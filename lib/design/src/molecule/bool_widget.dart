import "package:flutter/material.dart";

class BoolWidget extends StatelessWidget {
  const BoolWidget({
    required this.state,
    required this.trueWidget,
    required this.falseWidget,
    super.key,
  });

  final bool state;
  final Widget trueWidget;
  final Widget falseWidget;

  @override
  Widget build(BuildContext context) {
    if (state) {
      return trueWidget;
    } else {
      return falseWidget;
    }
  }
}
