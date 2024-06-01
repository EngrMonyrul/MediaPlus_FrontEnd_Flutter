import 'package:flutter/material.dart';
import 'package:mediaplusfrontend/common/extensions/context_ext.dart';

import '../cachedNetworkImage/cached_network_image.dart';

class MediaItem extends StatelessWidget {
  const MediaItem({
    super.key,
    this.imgUrl,
  });

  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: screenSize.height * .3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.colorScheme.tertiary,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImageWidget(
                  // url: imgUrl ?? "",
                  ),
            ),
          ),
          Container(
            height: screenSize.height * .25,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black87,
                  Colors.black54,
                  Colors.black45,
                  Colors.black38,
                  Colors.black26,
                  Colors.black12,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Channel Name",
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "File Name",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                ),
                Text(
                  "Uploaded At: ${DateTime.parse("2024-05-28T14:00:11Z")}",
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
