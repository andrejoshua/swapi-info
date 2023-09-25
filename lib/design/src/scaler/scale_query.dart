import "package:flutter/material.dart";

import "platform_size.dart";
import "screen_constants.dart";
import "widget_scaler.dart";

/// Specific class built for [WidgetScaler]
class ScaleQuery {
  final BuildContext _context;

  ScaleQuery._(this._context);

  factory ScaleQuery.of(BuildContext context) {
    return ScaleQuery._(context);
  }

  /// Logic to determine [AppPlatformSize] of a platform
  /// The sizes are default to [AppPlatformSize.max]
  AppPlatformSize get deviceSize {
    // If the width is less than 350, it's small phone
    if (_isSmallOfSize) {
      return AppPlatformSize.small;
    }

    // If the height is less than 700, usually is a lower-res phone
    // Like old Samsung Galaxy
    if (_isMediumOfHeight) {
      return AppPlatformSize.medium;
    }

    // If the height is 900 or more, usually is a Max or XL version phone
    // Like iPhone _ Pro Max or Pixel _ XL
    if (_isMaxOfHeight) {
      return AppPlatformSize.max;
    }

    // Standard modern phones, applies to iPhone X or newer,
    // or Pixel, OnePlus phones
    return AppPlatformSize.standard;
  }

  bool get hasNotch {
    return MediaQuery.of(_context).viewPadding.top > 0 &&
        MediaQuery.of(_context).viewPadding.bottom > 0;
  }

  /// If the width is less than 350, it's small phone or 667 iphone SE
  bool get _isSmallOfSize =>
      MediaQuery.of(_context).size.height < kSmallScreenHeight;

  /// If the height is less than 700, usually is a lower-res phone
  bool get _isMediumOfHeight =>
      MediaQuery.of(_context).size.height <= kMediumScreenHeight;

  /// If the height is 900 or more, usually is a Max or XL version phone
  bool get _isMaxOfHeight =>
      MediaQuery.of(_context).size.height >= kMaxScreenHeight;
}
