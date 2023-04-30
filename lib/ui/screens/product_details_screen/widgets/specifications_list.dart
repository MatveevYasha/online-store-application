import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/details_phone.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class SpecificationsList extends StatelessWidget {
  const SpecificationsList({
    super.key,
    required DetailPhone detailsPhones,
  }) : _detailsPhones = detailsPhones;

  final DetailPhone _detailsPhones;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Specifications(
          icon: Icons.receipt_rounded,
          text: _detailsPhones.cpu,
        ),
        _Specifications(
          icon: Icons.camera_alt_outlined,
          text: _detailsPhones.camera,
        ),
        _Specifications(
          icon: Icons.storage,
          text: _detailsPhones.ssd,
        ),
        _Specifications(
          icon: Icons.sd_card,
          text: _detailsPhones.sd,
        ),
      ],
    );
  }
}

class _Specifications extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Specifications({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: colorScheme.onSecondary,
        ),
        Text(
          text,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSecondary),
        ),
      ],
    );
  }
}
