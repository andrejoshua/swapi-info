// NOTE: the numbers in this constant should remain unchanged
// All of the numbers here are based on actual dimensions
// For the scale, the scale numbers are based on independent research, trials and errors

/// Default width for [AppPlatformSize.small]
const double kSmallScreenWidth = 350;

/// Default height for [AppPlatformSize.small]
const double kSmallScreenHeight = 667;

/// Default height for [AppPlatformSize.medium]
const double kMediumScreenHeight = 700;
/// Default height for [AppPlatformSize.max]
const double kMaxScreenHeight = 900;

/// For [AppPlatformSize.small] the sizes are larger 101.5%.
const double kSmallDownScale = 1.105;
/// For [AppPlatformSize.medium] the sizes are reduced 100.78%.
const double kMediumDownScale = 1.078;
/// For [AppPlatformSize.standard] the sizes are reduced 100.3%.
const double kStandardScale = 1.0;
/// For [AppPlatformSize.max] the sizes are not reduced because Figma design aligns with max phones.
const double kDefaultScale = 1.0;