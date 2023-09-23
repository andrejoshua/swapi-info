import "package:flutter/material.dart";

import "../display_sizes.dart";

/// Reusable [InfoItem] design item which will be used by other design items
/// Requires [label] to show any label
/// Requires [value] to show any value
class InfoItem extends StatelessWidget {
  const InfoItem({required this.label, required this.value, super.key});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(
          height: kSpaceInfo,
        ),
        // All values are set to maximum of 2 lines
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
          maxLines: 2,
        ),
      ],
    );
  }
}
