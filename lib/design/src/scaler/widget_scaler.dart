import "package:flutter/material.dart";

import "platform_size.dart";
import "scale_query.dart";
import "screen_constants.dart";

/// Used as a baseline for widget sizes
/// All of the sizes has to be reduced to follow platform screen capabilities.
class WidgetScaler {
  final BuildContext _context;

  // This will be later used if there is any size modifications for different device orientations
  // ignore: unused_field
  final Orientation _orientation;

  WidgetScaler._(this._context, this._orientation);

  /// When constructing, you can put [orientation] defined from [OrientationBuilder] widget.
  factory WidgetScaler.construct(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    return WidgetScaler._(context, orientation);
  }

  /// Default function to scale down sizes
  double scaledSize(double defaultSize) {
    final double firstDownscale = defaultSize * _scaleFactor;
    if (firstDownscale < 4) {
      return firstDownscale;
    }

    final double firstDownscaleMod = firstDownscale % 4;
    final double secondDownscale = firstDownscale - firstDownscaleMod;
    return secondDownscale;
  }

  double get deviceHeight => MediaQuery.of(_context).size.height;

  double get deviceWidth => MediaQuery.of(_context).size.width;

  double get _scaleFactor {
    switch (ScaleQuery.of(_context).deviceSize) {
      case AppPlatformSize.small:
        return kSmallDownScale;
      case AppPlatformSize.medium:
        return kMediumDownScale;
      case AppPlatformSize.max:
        return kDefaultScale;
      default:
        return kStandardScale;
    }
  }
}
