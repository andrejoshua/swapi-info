import "package:flutter/material.dart";
import "package:swapiinfo/design/colors.dart";
import "package:swapiinfo/design/text_sizes.dart";

// This is a sample of using text theme
const TextTheme kThemeText = TextTheme(
  displayLarge: TextStyle(
    fontSize: kSizeHeadlineLarge,
    fontWeight: FontWeight.bold,
    color: kColorText,
  ),
  displayMedium: TextStyle(
    fontSize: kSizeHeadlineMedium,
    fontWeight: FontWeight.w600,
    color: kColorText,
  ),
  bodyLarge: TextStyle(
    fontSize: kSizeBody,
    fontWeight: FontWeight.normal,
    color: kColorText,
  ),
  bodySmall: TextStyle(
    fontSize: kSizeLabel,
    fontWeight: FontWeight.w600,
    color: kColorText,
  ),
);
