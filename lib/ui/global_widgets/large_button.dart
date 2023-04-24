import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class LargeButton extends StatelessWidget {
  final void Function() onTap;
  final double height;
  final String text;

  const LargeButton({
    super.key,
    required this.onTap,
    required this.height,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorScheme.primary),
          child: Center(
              child: Text(
            text,
            style:
                textTheme.displayLarge?.copyWith(color: colorScheme.onPrimary),
          )),
        ),
      ),
    );
  }
}
