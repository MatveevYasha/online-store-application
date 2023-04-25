import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        'My Card',
        style: textTheme.bodyLarge
            ?.copyWith(color: colorScheme.secondary, fontSize: 35),
      ),
    );
  }
}
