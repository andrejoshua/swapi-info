import "package:flutter/material.dart";

import "../molecule/empty_widget.dart";

/// Powered by [Visibility] widget
/// This widget is built just to have reusable widget across multiple views
/// This widget shows dash "-" character if the [isVisible] condition set to false
class VisibilityDashWidget extends StatelessWidget {
  const VisibilityDashWidget({
    required this.isVisible,
    required this.contentWidget,
    super.key,
  });

  /// [isVisible] determines if the content is visible or not
  final bool isVisible;
  /// [contentWidget] shows actual content underneath Visibility widget
  final Widget contentWidget;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      replacement: const EmptyWidget(),
      child: contentWidget,
    );
  }
}
