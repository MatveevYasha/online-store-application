import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store_application/ui/screens/product_details_screen/bloc/detail_bloc.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';

class CostAndDelivery extends StatelessWidget {
  const CostAndDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.only(top: 20);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const _Devider(
            padding: EdgeInsets.only(top: 0),
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
                  textBottom: (context.read<DetailBloc>().state.card.isEmpty)
                      ? '\$0 us'
                      : '\$${1.5 * context.read<DetailBloc>().state.card.reduce((value, element) => value + element)}00 us',
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
