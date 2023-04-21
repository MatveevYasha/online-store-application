import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class CategoryText extends StatelessWidget {
  final String textLeft;
  final String textRight;
  const CategoryText({
    Key? key,
    required this.textLeft,
    required this.textRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: textTheme.displayLarge,
          ),
          Text(
            textRight,
            style:
                textTheme.displayMedium?.copyWith(color: colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
