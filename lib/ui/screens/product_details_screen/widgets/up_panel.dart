import 'package:flutter/material.dart';
import 'package:online_store_application/ui/global_widgets/button_with_icon.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class UpPanel extends StatelessWidget {
  const UpPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWithIcon(
              isPrimaryColor: false, icon: Icons.chevron_left, onTap: () {}),
          Text(
            'Product Details',
            style: textTheme.titleLarge,
          ),
          ButtonWithIcon(
              isPrimaryColor: true,
              icon: Icons.shopping_bag_outlined,
              onTap: () {}),
        ],
      ),
    );
  }
}