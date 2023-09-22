extension ResponseStatusCodeExt on int? {
  bool get isSuccess {
    if (this == null) {
      return false;
    }

    return this! >= 200 && this! < 300;
  }
}
