// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

// ignore: must_be_immutable
class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  void Function()? onTap;
  MainAppBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const IconButton(
        icon: Icon(null),
        onPressed: null,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_outlined,
            color: colorScheme.primary,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              'Zihuatanejo, Gro',
              style: textTheme.titleMedium,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: colorScheme.onSecondary,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onTap,
          icon: const Icon(Icons.filter_alt_outlined),
        )
      ],
    );
  }
}
