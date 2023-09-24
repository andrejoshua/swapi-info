// Snackbar will show up for a good 3 seconds
const Duration kDurationSnackbar = Duration(seconds: 3);
// The search will not respond to a click, instead, will wait until user stops typing in 2 seconds or more
// Once the condition follows, the search logic will run
const Duration kDurationSearchDebounce = Duration(seconds: 2);