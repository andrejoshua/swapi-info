import "package:flutter/material.dart";

import "../molecule/empty_widget.dart";

class VisibilityDashWidget extends StatelessWidget {
  const VisibilityDashWidget({
    required this.isVisible,
    required this.contentWidget,
    super.key,
  });

  final bool isVisible;
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
