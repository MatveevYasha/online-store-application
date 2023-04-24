import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/details_phone.dart';
import 'package:online_store_application/ui/global_widgets/button_with_icon.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class NameWidget extends StatelessWidget {
  final void Function()? onTap;
  const NameWidget({
    super.key,
    required DetailPhone detailsPhones,
    required this.isFavorite,
    required this.onTap,
  }) : _detailsPhones = detailsPhones;

  final DetailPhone _detailsPhones;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _detailsPhones.title,
          style: textTheme.displayLarge,
        ),
        ButtonWithIcon(
            isPrimaryColor: (isFavorite == false) ? false : true,
            icon: (isFavorite == false)
                ? Icons.favorite_border
                : Icons.favorite_outlined,
            onTap: onTap)
      ],
    );
  }
}
