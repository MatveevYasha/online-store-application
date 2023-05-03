import 'package:flutter/material.dart';
import 'package:online_store_application/ui/app.dart';
import 'package:online_store_application/ui/global_widgets/button_with_icon.dart';
import 'package:online_store_application/ui/screens/card_screen/card_screen.dart';
import 'package:online_store_application/ui/screens/product_details_screen/bloc/detail_bloc.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class UpPanel extends StatelessWidget {
  final List<int> listOfProduct;

  const UpPanel({
    super.key,
    required this.listOfProduct,
  });

  @override
  Widget build(BuildContext context) {
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CardScreen(
                            listOfProduct: listOfProduct,
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
          (listOfProduct.isEmpty)
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
                      '${listOfProduct.length}',
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
