import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class CategoryText extends StatelessWidget {
  String textLeft;
  String textRight;
  CategoryText({
    Key? key,
    required this.textLeft,
    required this.textRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          textLeft,
          style: textTheme.displayLarge,
        ),
        Text(
          textRight,
          style: textTheme.displaySmall?.copyWith(color: colorScheme.primary),
        ),
      ],
    );
  }
}
