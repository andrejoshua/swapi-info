import "package:flutter/material.dart";

const Color kColorPrimary = Color(0xFFB71C1C);
const Color kColorBackground = Colors.white;
const Color kColorCharacterBackground = Color(0xFFC4C4C4);
const Color kColorStarshipBackground = Color(0xFFFFF3DD);
const Color kColorVehicleBackground = Color(0xFFFFF3DD);
const Color kColorHomeworldBackground = Color(0xFFEDFDF4);

const Color kColorError = Color(0xFFD81D1D);

const Color kColorText = Colors.black;
const Color kColorTextWhite = Colors.white;

const Color kColorDarkGray = Color(0xFF676767);

// Sample of using color scheme
// Now we will only use light theme
const ColorScheme kSchemeLight = ColorScheme.light(
  // Primary color
  primary: kColorPrimary,
  // Color above primary
  onPrimary: kColorTextWhite,
  // Default additional color, set to grey
  surface: kColorBackground,
  onSurface: kColorTextWhite,
  // Default background color, set to white
  background: kColorBackground,
  onBackground: kColorText,
  error: kColorError,
  onError: kColorTextWhite,
  brightness: Brightness.light,
);
