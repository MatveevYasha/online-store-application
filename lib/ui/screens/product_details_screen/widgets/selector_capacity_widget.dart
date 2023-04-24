import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/details_phone.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class SelectorCapacityWidget extends StatefulWidget {
  const SelectorCapacityWidget({
    super.key,
    required DetailPhone detailsPhones,
  }) : _detailsPhones = detailsPhones;

  final DetailPhone _detailsPhones;

  @override
  State<SelectorCapacityWidget> createState() => _SelectorCapacityWidgetState();
}

class _SelectorCapacityWidgetState extends State<SelectorCapacityWidget> {
  int _selectedCapacityIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.4,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget._detailsPhones.capacity.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCapacityIndex = index;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (_selectedCapacityIndex == index)
                    ? colorScheme.primary
                    : colorScheme.onPrimary,
              ),
              child: Center(
                child: Text(
                  '${widget._detailsPhones.capacity[index]} GB',
                  style: textTheme.displaySmall?.copyWith(
                      color: (_selectedCapacityIndex == index)
                          ? colorScheme.onPrimary
                          : colorScheme.onSecondary),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
