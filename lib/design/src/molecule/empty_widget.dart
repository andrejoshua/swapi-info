import "package:flutter/material.dart";

import "../constants.dart";

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      kDashString,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
