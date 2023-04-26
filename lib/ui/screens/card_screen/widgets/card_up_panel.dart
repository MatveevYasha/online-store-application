import 'package:flutter/material.dart';
import 'package:online_store_application/ui/global_widgets/button_with_icon.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class CardUpPanel extends StatelessWidget {
  const CardUpPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Row(
          children: [
            ButtonWithIcon(
              isPrimaryColor: false,
              icon: Icons.chevron_left,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const Spacer(flex: 10),
            Text(
              'Add address',
              style: textTheme.displayMedium
                  ?.copyWith(color: colorScheme.secondary),
            ),
            const Spacer(flex: 1),
            ButtonWithIcon(
                isPrimaryColor: true,
                icon: Icons.location_on_outlined,
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
