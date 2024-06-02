import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaplusfrontend/common/extensions/context_ext.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget(
      {super.key, this.url, this.boxFit, this.height, this.width, this.zoom});

  final String? url;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final double? zoom;

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    return Transform.scale(
      scale: zoom ?? 1,
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl:
            url ?? "assets/images/woman-listening-to-music-with-headphones.jpg",
        fit: boxFit ?? BoxFit.cover,
        placeholder: (context, url) {
          return Center(
            child: Skeletonizer(
              child: Container(
                height: screenSize.height * .3,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onTertiary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CircularProgressIndicator(),
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            color: theme.colorScheme.onTertiary,
            child: Center(
              child: Text(error.toString()),
            ),
          );
        },
      ),
    );
  }
}
