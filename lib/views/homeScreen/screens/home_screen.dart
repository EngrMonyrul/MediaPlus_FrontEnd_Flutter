import 'package:flutter/material.dart';
import 'package:mediaplusbackend/mediaplusbackend.dart';
import 'package:mediaplusfrontend/common/extensions/context_ext.dart';
import 'package:mediaplusfrontend/utils/constants/assets_const.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*------------------------>
  *-------> variables
  <-------------------------*/
  final scrollController = ScrollController();

  /*------------------------>
  *-------> functions
  <-------------------------*/
  void fetchPaginationData({String? nextPageToken}) async {
    final trendingMediaProvider = context.read<TrendingMediaProvider>();
    if (nextPageToken == null) {
      trendingMediaProvider.setLoading(value: true);
    }
    // showLoadingDialog(context: context);
    await trendingMediaProvider
        .fetchTrendingVideos(nextPageToken: nextPageToken)
        .then((value) {
      trendingMediaProvider.setLoading(value: false);
      // Navigator.pop(context);
    });
  }

  void listenScrollController() {
    scrollController.addListener(() {
      print(scrollController.position);
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (context
                    .read<TrendingMediaProvider>()
                    .trendingVideoResponse
                    ?.nextPageToken !=
                null ||
            context
                    .read<TrendingMediaProvider>()
                    .trendingVideoResponse
                    ?.nextPageToken !=
                "") {
          fetchPaginationData(
              nextPageToken: context
                      .read<TrendingMediaProvider>()
                      .trendingVideoResponse
                      ?.nextPageToken ??
                  "");
        }
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchPaginationData();
    });
    listenScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          scrollController.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Easing.legacyAccelerate);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "Go Up",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Consumer<TrendingMediaProvider>(
        builder: (context, trendingMediaProvider, child) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              /*-------------------> hero section bg <-------------------*/
              // BackgroundBanner(
              //   imagePath: AssetsConst.bannerBg,
              //   totalItem: trendingMediaProvider.trendingVideos?.length,
              //   mediaLimit: "Unlimited",
              //   mediaType: "Trending Videos",
              //   uiLoading: trendingMediaProvider.loading,
              // ),
              SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: screenSize.height * .45),
                    // Skeletonizer(
                    //   enabled: trendingMediaProvider.loading,
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //       horizontal: 10,
                    //       vertical: 20,
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: theme.colorScheme.secondary,
                    //       borderRadius: const BorderRadius.only(
                    //         topLeft: Radius.circular(20),
                    //         topRight: Radius.circular(20),
                    //       ),
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const Center(
                    //             child: Text("Enjoy Your Day with MediaPlus")),
                    //         const SizedBox(height: 10),
                    //         Text(
                    //           "Trending Videos",
                    //           style: theme.textTheme.titleSmall?.copyWith(
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         ListView.builder(
                    //           shrinkWrap: true,
                    //           physics: const NeverScrollableScrollPhysics(),
                    //           itemCount:
                    //               trendingMediaProvider.trendingVideos?.length,
                    //           itemBuilder: (context, index) {
                    //             final item = trendingMediaProvider
                    //                 .trendingVideos?[index];
                    //             // final channelDetails =
                    //             // trendingMediaProvider.fetchChannelDetails(
                    //             //     channelId:
                    //             //     item.snippet?.channelId ?? "");
                    //             return MediaItem(
                    //               imgUrl:
                    //                   item?.snippet?.thumbnails?.maxres?.url,
                    //             );
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    if (trendingMediaProvider
                                .trendingVideoResponse?.nextPageToken !=
                            null ||
                        trendingMediaProvider
                                .trendingVideoResponse?.nextPageToken !=
                            "")
                      const SizedBox(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
