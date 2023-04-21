import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.75,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: colorScheme.onPrimary,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                labelText: 'Search',
                labelStyle: textTheme.displayMedium
                    ?.copyWith(color: colorScheme.onSecondary),
                prefixIcon: Icon(
                  Icons.search,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: colorScheme.primary),
            child: Icon(
              Icons.qr_code,
              color: colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
