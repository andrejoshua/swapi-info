import "package:flutter/material.dart";
import 'package:swapiinfo/design/src/display_sizes.dart';

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
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
