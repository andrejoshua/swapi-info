import "package:flutter/material.dart";

const Color kColorBackground = Colors.white;
const Color kColorCharacterBackground = Color(0xFFC4C4C4);
const Color kColorStarshipBackground = Color(0xFFFFF3DD);
const Color kColorVehicleBackground = Color(0xFFFFF3DD);
const Color kColorHomeworldBackground = Color(0xFFEDFDF4);

const Color kColorError = Color(0xFFD81D1D);

const Color kColorText = Colors.black;
const Color kColorTextWhite = Colors.white;

const ColorScheme kSchemeLight = ColorScheme.light(
  primary: kColorCharacterBackground,
  onPrimary: kColorText,
  secondary: kColorStarshipBackground,
  onSecondary: kColorText,
  tertiary: kColorVehicleBackground,
  onTertiary: kColorText,
  surface: kColorBackground,
  onSurface: kColorText,
  background: kColorBackground,
  onBackground: kColorText,
  error: kColorError,
  onError: kColorTextWhite,
  brightness: Brightness.light,
);
