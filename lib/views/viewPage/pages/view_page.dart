import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mediaplusbackend/mediaplusbackend.dart';
import 'package:mediaplusfrontend/common/extensions/context_ext.dart';
import 'package:mediaplusfrontend/common/widgets/bgBanner/bg_banner.dart';
import 'package:mediaplusfrontend/common/widgets/cachedNetworkImage/cached_network_image.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key, this.index});

  final int? index;

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  void fetchChannelDetails() async {
    final channelId =
        context.read<TrendingMediaProvider>().trendingVideos[widget.index ?? 0];
    await context
        .read<TrendingMediaProvider>()
        .fetchChannelDetails(channelName: channelId.snippet?.channelId ?? "");
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchChannelDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    final trendingMediaProvider = Provider.of<TrendingMediaProvider>(context);
    final videoItem = trendingMediaProvider.trendingVideos[widget.index ?? 0];
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: CachedNetworkImageWidget(
              height: screenSize.height * .5,
              width: double.infinity,
              url: videoItem.snippet?.thumbnails?.maxres?.url ?? "",
            ),
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
                  Text(
                    "Published At: ${DateFormat("dd MMM, yyyy").format(videoItem.snippet?.publishedAt ?? DateTime.now())}",
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    videoItem.snippet?.title ?? "",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onTertiary,
                      borderRadius: BorderRadius.circular(10),
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
                        SizedBox(width: 10),
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
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("Recommanded"),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("Recommanded"),
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
