import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(null),
        onPressed: () {},
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
              style: textTheme.displaySmall,
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
            onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined))
      ],
    );
  }
}
