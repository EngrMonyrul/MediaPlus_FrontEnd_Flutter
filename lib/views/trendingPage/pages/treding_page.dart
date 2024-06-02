import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mediaplusbackend/mediaplusbackend.dart';
import 'package:mediaplusfrontend/common/extensions/context_ext.dart';
import 'package:mediaplusfrontend/common/widgets/cachedNetworkImage/cached_network_image.dart';
import 'package:mediaplusfrontend/utils/constants/assets_const.dart';
import 'package:mediaplusfrontend/utils/routes/routes_name.dart';
import 'package:mediaplusfrontend/views/trendingPage/providers/trending_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common/widgets/bgBanner/bg_banner.dart';
import '../../../common/widgets/regionButton/regionButton.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  final scrollController = ScrollController();
  final regionScrollController = ScrollController();

  void fetchTrendingVideos({String? nextPageToken}) async {
    final horizontalOffset =
        context.read<TrendingPageProvider>().regionControllerOffset;
    final trendingMediaProvider = context.read<TrendingMediaProvider>();
    if (nextPageToken == null) {
      trendingMediaProvider.setLoading(value: true);
    }
    await trendingMediaProvider
        .fetchTrendingVideos(nextPageToken: nextPageToken)
        .then((_) {
      trendingMediaProvider.setLoading(value: false);
      Future.delayed(const Duration(milliseconds: 500), () {
        regionScrollController.animateTo(horizontalOffset,
            duration: const Duration(milliseconds: 500),
            curve: Easing.legacyDecelerate);
      });
    });
    setState(() {});
  }

  void listenScrolling() {
    scrollController.addListener(() {
      if (scrollController.offset >= 1000) {
        context.read<TrendingPageProvider>().setGoUp(value: true);
      } else {
        context.read<TrendingPageProvider>().setGoUp(value: false);
      }
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetchTrendingVideos(
          nextPageToken: context
              .read<TrendingMediaProvider>()
              .trendingVideoResponse
              ?.nextPageToken,
        );
      }
    });
  }

  void listenRegionScrolling() {
    regionScrollController.addListener(() {
      context
          .read<TrendingPageProvider>()
          .setRegionControllerOffset(value: regionScrollController.offset);
      print(context.read<TrendingPageProvider>().regionControllerOffset);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchTrendingVideos();
    });
    listenScrolling();
    listenRegionScrolling();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    regionScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    return Scaffold(
      floatingActionButton: Consumer<TrendingPageProvider>(
        builder: (context, trendingPageProvider, child) {
          if (trendingPageProvider.showGoUp) {
            return GestureDetector(
              onTap: () {
                scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 700),
                    curve: Easing.emphasizedDecelerate);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Go Up",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Consumer<TrendingMediaProvider>(
        builder: (context, trendingMediaProvider, child) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              BGBanner(
                loading: trendingMediaProvider.loading,
                totalMedia:
                    trendingMediaProvider.trendingVideos.length.toDouble(),
              ),
              SingleChildScrollView(
                controller: scrollController,
                child: Skeletonizer(
                  enabled: trendingMediaProvider.loading,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.height * .45,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Enjoy All The Trending Videos",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              child: ListView.builder(
                                controller: regionScrollController,
                                itemCount: YouTubeRegionCode.values.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final region =
                                      YouTubeRegionCode.values[index];
                                  final selected =
                                      trendingMediaProvider.regionCode ==
                                          region.name;
                                  return RegionButton(
                                    onPressed: () {
                                      trendingMediaProvider.setRegionCode(
                                          value: region.name);
                                      fetchTrendingVideos();
                                    },
                                    selected: selected,
                                    regionCode: region.name,
                                    regionName: region.countryName,
                                  );
                                },
                              ),
                            ),
                            trendingMediaProvider.trendingVideos.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40.0),
                                    child: Center(
                                      child: Text(
                                        "No Videos In ${trendingMediaProvider.regionCode}\nTry Different Region",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: trendingMediaProvider
                                        .trendingVideos.length,
                                    itemBuilder: (context, index) {
                                      final trendingItem = trendingMediaProvider
                                          .trendingVideos[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, RoutesName.viewPage,
                                              arguments: trendingItem);
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: screenSize.height * .3,
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                bottom: 20,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImageWidget(
                                                  url: trendingItem
                                                          .snippet
                                                          ?.thumbnails
                                                          ?.maxres
                                                          ?.url ??
                                                      "",
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: screenSize.height * .3,
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.only(
                                                bottom: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    // Colors.black,
                                                    // Colors.black87,
                                                    Colors.black54,
                                                    Colors.black45,
                                                    Colors.black38,
                                                    Colors.black26,
                                                    Colors.black12,
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    trendingItem.snippet
                                                            ?.channelTitle ??
                                                        "",
                                                    style: theme
                                                        .textTheme.labelSmall
                                                        ?.copyWith(
                                                      color: theme
                                                          .colorScheme.primary,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    trendingItem
                                                            .snippet?.title ??
                                                        "Title",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: theme
                                                        .textTheme.bodyMedium
                                                        ?.copyWith(
                                                      color: theme.colorScheme
                                                          .secondary,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 5,
                                                          vertical: 5,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white38,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: StatisticsCard(
                                                          itemCount: double
                                                              .parse(trendingItem
                                                                      .statistics
                                                                      ?.viewCount ??
                                                                  "0"),
                                                          label: "Views",
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 5,
                                                          vertical: 5,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white38,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: StatisticsCard(
                                                          itemCount: double
                                                              .parse(trendingItem
                                                                      .statistics
                                                                      ?.likeCount ??
                                                                  "0"),
                                                          label: "Likes",
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 5,
                                                          vertical: 5,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white38,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: StatisticsCard(
                                                          itemCount: double
                                                              .parse(trendingItem
                                                                      .statistics
                                                                      ?.commentCount ??
                                                                  "0"),
                                                          label: "Comments",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        ),
                      ),
                      Center(
                        child: Lottie.asset(AssetsConst.loadingJson),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    super.key,
    this.label,
    this.itemCount,
  });

  final String? label;
  final double? itemCount;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return TweenAnimationBuilder(
      tween: Tween<double>(
        begin: 0,
        end: itemCount,
      ),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Text(
          "$label : $itemCount",
          style: theme.textTheme.labelSmall?.copyWith(
            fontSize: 6,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.secondary,
          ),
        );
      },
    );
  }
}
