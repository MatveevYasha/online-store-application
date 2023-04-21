// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:online_store_application/ui/theme/color_scheme.dart';

// ignore: must_be_immutable
class ButtonWithIcon extends StatelessWidget {
  final bool isPrimaryColor;
  final IconData icon;
  void Function()? onTap;

  ButtonWithIcon({
    Key? key,
    required this.isPrimaryColor,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isPrimaryColor == true)
                ? colorScheme.primary
                : colorScheme.secondary),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
