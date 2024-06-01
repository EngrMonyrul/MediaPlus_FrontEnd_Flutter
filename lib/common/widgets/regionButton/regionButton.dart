import 'package:flutter/material.dart';
import 'package:mediaplusfrontend/common/extensions/context_ext.dart';

class RegionButton extends StatelessWidget {
  const RegionButton(
      {super.key,
        this.onPressed,
        this.selected,
        this.regionCode,
        this.regionName});

  final VoidCallback? onPressed;
  final bool? selected;
  final String? regionCode;
  final String? regionName;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: selected ?? false
              ? theme.colorScheme.primary
              : theme.colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: regionCode ?? "",
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: selected ?? false
                      ? theme.colorScheme.secondary
                      : theme.colorScheme.onSecondary,
                ),
              ),
              TextSpan(
                text: "\n$regionName",
                style: TextStyle(
                  fontSize: 6,
                  color: selected ?? false
                      ? theme.colorScheme.secondary
                      : theme.colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
