import 'package:flutter/material.dart';
import 'package:online_store_application/ui/global_widgets/button_with_icon.dart';
import 'package:online_store_application/ui/global_widgets/custom_dropdown_button.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(30)),
      height: MediaQuery.of(context).size.height * 0.47,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWithIcon(
                icon: Icons.close,
                isPrimaryColor: false,
                onTap: () => Navigator.of(context).pop(),
              ),
              Text(
                'Filter options',
                style: textTheme.titleLarge,
              ),
              const _ButtonWithText(),
            ],
          ),
          const SizedBox(height: 20),
          const CustomDropdownButton(
            name: 'Brand',
            insideText: 'Samsung',
          ),
          const CustomDropdownButton(
            name: 'Prise',
            insideText: '\$300 - \$500',
          ),
          const CustomDropdownButton(
            name: 'Size',
            insideText: '4.5 to 5.5 inches',
          ),
        ],
      ),
    );
  }
}

class _ButtonWithText extends StatelessWidget {
  const _ButtonWithText();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorScheme.primary),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Text(
              'Done',
              style:
                  textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
            )),
      ),
    );
  }
}
