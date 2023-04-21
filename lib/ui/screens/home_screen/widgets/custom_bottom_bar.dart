import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<IconData> listOfIcons = [
      Icons.shopping_bag_outlined,
      Icons.favorite_border,
      Icons.person_outline,
    ];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: colorScheme.secondary,
      ),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '⚪ Explorer',
              style: textTheme.displayMedium?.copyWith(
                  color: colorScheme.onPrimary, fontWeight: FontWeight.w700),
            ),
            ...listOfIcons
                .map((e) => Icon(e, color: colorScheme.onPrimary))
                .toList()
          ],
        ),
      ),
    );
  }
}
