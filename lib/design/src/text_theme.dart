import "package:flutter/material.dart";

import "colors.dart";
import "text_sizes.dart";

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
  labelSmall: TextStyle(
    fontSize: kSizeLabel,
    fontWeight: FontWeight.w600,
    color: kColorText,
  ),
  labelLarge: TextStyle(
    fontSize: kSizeLabelLarge,
    fontWeight: FontWeight.w500,
    color: kColorText,
  ),
);
