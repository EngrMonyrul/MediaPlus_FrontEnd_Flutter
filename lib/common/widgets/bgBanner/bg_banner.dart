import 'package:flutter/material.dart';
import 'package:mediaplusfrontend/common/extensions/context_ext.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/constants/assets_const.dart';

class BGBanner extends StatelessWidget {
  const BGBanner({
    super.key,
    this.padding,
    this.bgColor,
    this.bannerImg,
    this.title,
    this.subTitle,
    this.mediaType,
    this.mediaLimit,
    this.totalMedia,
    this.onPressed,
    this.buttonName,
    this.titleColor,
    this.subTitleColor,
    this.mediaTypeColor,
    this.mediaLimitColor,
    this.totalMediaColor,
    this.buttonColor,
    this.buttonTextColor,
    this.height,
    this.width,
    this.loading,
  });

  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final String? bannerImg;
  final String? title;
  final String? subTitle;
  final String? mediaType;
  final String? mediaLimit;
  final double? totalMedia;
  final VoidCallback? onPressed;
  final String? buttonName;
  final Color? titleColor;
  final Color? subTitleColor;
  final Color? mediaTypeColor;
  final Color? mediaLimitColor;
  final Color? totalMediaColor;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? height;
  final double? width;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    return Container(
      height: height ?? screenSize.height / 2,
      width: width ?? double.infinity,
      padding: padding ??
          const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 20,
          ),
      decoration: BoxDecoration(
        color: bgColor ?? theme.colorScheme.primary,
        image: DecorationImage(
          image: AssetImage(bannerImg ?? AssetsConst.bannerBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.statusBarHeight + 10),
          Text(
            title ?? "MediaPlus",
            style: theme.textTheme.headlineMedium?.copyWith(
              color: titleColor ?? theme.colorScheme.secondary,
            ),
          ),
          Text(
            subTitle ?? "Audio & Video Module",
            style: theme.textTheme.labelSmall?.copyWith(
              color: subTitleColor ?? theme.colorScheme.secondary,
            ),
          ),
          const Spacer(flex: 7),
          Skeletonizer(
            enabled: loading ?? false,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mediaType ?? "Trending Videos",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: mediaTypeColor ?? theme.colorScheme.secondary,
                      ),
                    ),
                    Text(
                      mediaLimit ?? "Unlimited",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: mediaLimitColor ?? theme.colorScheme.secondary,
                      ),
                    ),
                    TweenAnimationBuilder(
                      tween: Tween<double>(
                        begin: 0,
                        end: totalMedia ?? 100,
                      ),
                      duration: const Duration(seconds: 1),
                      builder: (context, value, child) {
                        return Text(
                          "${value.toInt()}+ Videos",
                          style: theme.textTheme.labelSmall?.copyWith(
                            color:
                                totalMediaColor ?? theme.colorScheme.secondary,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: buttonColor,
                  ),
                  onPressed: onPressed ?? () {},
                  child: Text(
                    buttonName ?? "Online Search",
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: buttonTextColor ?? theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
