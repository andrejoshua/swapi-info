/// Custom extensions on nullable string
extension NullableStringExtensions on String? {
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else {
      return this!.isEmpty;
    }
  }

  bool get isNotNullOrEmpty {
    if (this == null) {
      return false;
    } else {
      return this!.isNotEmpty;
    }
  }

  int get toInt {
    if (isNotNullOrEmpty) {
      return int.parse(this!);
    } else {
      return 0;
    }
  }
}

extension UrlExt on String {
  String getId() {
    return split("/").where((String element) => element.isNotNullOrEmpty).last;
  }
}
