import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mediaplusbackend/mediaplusbackend.dart';
import 'package:mediaplusfrontend/common/extensions/context_ext.dart';
import 'package:mediaplusfrontend/common/widgets/bgBanner/bg_banner.dart';
import 'package:mediaplusfrontend/common/widgets/cachedNetworkImage/cached_network_image.dart';
import 'package:mediaplusfrontend/utils/routes/routes_name.dart';
import 'package:mediaplusfrontend/views/playerPage/pages/player_page.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key, this.item});

  final Item? item;

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  void fetchChannelDetails() async {
    await context.read<TrendingMediaProvider>().fetchChannelDetails(
        channelName: widget.item?.snippet?.channelId ?? "");
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchChannelDetails();
    });
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    final trendingMediaProvider = Provider.of<TrendingMediaProvider>(context);
    // final videoItem = trendingMediaProvider.trendingVideos[widget.index ?? 0];
    final videoItem = widget.item;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImageWidget(
                height: screenSize.height * .5,
                width: double.infinity,
                url: videoItem?.snippet?.thumbnails?.maxres?.url ?? "",
              ),
              Container(
                height: screenSize.height * .5,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      "Published At: ${DateFormat("dd MMM, yyyy").format(videoItem?.snippet?.publishedAt ?? DateTime.now())}",
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    Text(
                      videoItem?.snippet?.title ?? "",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PlayButton(
                          title: "Watch",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RoutesName.playerPage,
                                arguments: widget.item);
                          },
                          iconData: Icons.play_circle,
                        ),
                        SizedBox(width: 20),
                        PlayButton(
                          title: "Listen",
                          onPressed: () {},
                          iconData: Icons.headphones,
                        ),
                        SizedBox(width: 20),
                        PlayButton(
                          title: "Save",
                          onPressed: () {},
                          iconData: Icons.playlist_add,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        // color: theme.colorScheme.onTertiary,
                        // borderRadius: BorderRadius.circular(10),
                        ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImageWidget(
                            height: screenSize.height * .05,
                            width: screenSize.width * .1,
                            url: trendingMediaProvider
                                    .channelDetails
                                    ?.items
                                    ?.first
                                    .snippet
                                    ?.thumbnails
                                    ?.thumbnailsDefault
                                    ?.url ??
                                "",
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: screenSize.height * .05,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                trendingMediaProvider.channelDetails?.items
                                        ?.first.snippet?.title ??
                                    "",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * .7,
                                child: Text(
                                  trendingMediaProvider.channelDetails?.items
                                          ?.first.snippet?.description ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.labelSmall,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Views",
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "233303",
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onTertiary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text("Recommanded"),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text("Recommanded"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    this.title,
    this.iconData,
    this.onPressed,
  });

  final String? title;
  final IconData? iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 5),
        ),
        onPressed: onPressed ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData ?? Icons.play_circle),
            const SizedBox(width: 5),
            Text(title ?? "Video"),
          ],
        ),
      ),
    );
  }
}
