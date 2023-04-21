import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class CustomDropdownButton extends StatelessWidget {
  final String name;
  final String insideText;

  const CustomDropdownButton({
    super.key,
    required this.name,
    required this.insideText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: colorScheme.onSecondary),
            ),
            child: DropdownButtonHideUnderline(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton(
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                      child: Text(
                    insideText,
                    style: textTheme.displayMedium
                        ?.copyWith(color: colorScheme.secondary),
                  ))
                ],
                onChanged: null,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
              ),
            )),
          ),
        ),
      ],
    );
  }
}
