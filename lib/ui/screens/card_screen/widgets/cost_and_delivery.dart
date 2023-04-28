import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';

class CostAndDelivery extends StatelessWidget {
  final int count;

  const CostAndDelivery({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.only(top: 20);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const _Devider(
            padding: padding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _TextWidget(
                  padding: padding,
                  textTop: 'Delivery',
                  textBottom: 'Total',
                ),
                _TextWidget(
                  padding: padding,
                  textBottom: (count == 0) ? '\$0 us' : '\$${1.5 * count}00 us',
                  // textTop: 'sda',
                  textTop: 'Free',
                ),
              ],
            ),
          ),
          const _Devider(
            padding: padding,
          ),
        ],
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String textTop;
  final String textBottom;

  const _TextWidget({
    super.key,
    required this.padding,
    required this.textTop,
    required this.textBottom,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Text(textTop),
        ),
        Padding(
          padding: padding,
          child: Text(textBottom),
        ),
      ],
    );
  }
}

class _Devider extends StatelessWidget {
  final EdgeInsets padding;

  const _Devider({
    super.key,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      height: 2,
      color: colorScheme.onBackground,
    );
  }
}
