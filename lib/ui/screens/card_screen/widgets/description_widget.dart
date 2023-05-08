import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class DescriptionWidget extends StatelessWidget {
  final String text;
  const DescriptionWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Galaxy Note 20 \nUltra',
          style: textTheme.bodyMedium?.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: textTheme.bodyMedium
              ?.copyWith(fontSize: 20, color: colorScheme.primary),
        ),
      ],
    );
  }
}
