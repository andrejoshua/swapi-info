/// Enum to determine the size of the platform
///
/// For now this ignores landscape based platforms, such as desktop or web
///
/// * [AppPlatformSize.small] will be set for small devices,
///   such as old iPhones or iPhone SE
/// * [AppPlatformSize.medium] will be set for medium-res devices,
///   such as older Android phones (Samsung J7, etc.). Also iPhone mini might be in this category.
/// * [AppPlatformSize.standard] will be set for current-res phones,
///   such as Pixel standard phones, or iPhone standard phones
/// * [AppPlatformSize.max] will be set for max or plus sized phones,
///   such as iPhone Pro Max, or Pixel Pro
///   The default sizes or spacing from Figma will default to this
enum AppPlatformSize {
  small, // Old iPhone 5 or below, iPhone SE
  medium, // Usually old Android bigger phones, but with lower res. This may also include iPhone mini
  standard, // Current phones, standard size
  max, // XL or Max phones, Figma sizes will default to this
  // large, // Tablet sizes, not going to put bigger devices such as computers for now
}
