import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store_application/ui/app.dart';
import 'package:online_store_application/ui/global_widgets/button_with_icon.dart';
import 'package:online_store_application/ui/screens/card_screen/card_screen.dart';
import 'package:online_store_application/ui/screens/product_details_screen/bloc/detail_bloc.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class UpPanel extends StatelessWidget {
  const UpPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var card = context.read<DetailBloc>().state.card;
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonWithIcon(
                    isPrimaryColor: false,
                    icon: Icons.chevron_left,
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
                Text(
                  'Product Details',
                  style: textTheme.titleLarge,
                ),
                ButtonWithIcon(
                    isPrimaryColor: true,
                    icon: Icons.shopping_bag_outlined,
                    onTap: () {
                      Navigator.of(context).pushNamed('/home/detail/card');
                    }),
              ],
            ),
          ),
          (card.isEmpty)
              ? const SizedBox()
              : Positioned(
                  top: 15,
                  right: 20,
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.secondary,
                    ),
                    child: Text(
                      '${card.length}',
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
