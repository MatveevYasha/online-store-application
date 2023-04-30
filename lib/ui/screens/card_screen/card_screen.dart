import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store_application/ui/global_widgets/button_with_icon.dart';
import 'package:online_store_application/ui/global_widgets/large_button.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/card_up_panel.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/cost_and_delivery.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/list_of_products_widget.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/name_screen.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class CardScreen extends StatefulWidget {
  final List<int>? listOfProduct;

  CardScreen({Key? key, this.listOfProduct}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  List<int> listOfProduct = [];
  int count = 0;

  @override
  void initState() {
    if (widget.listOfProduct!.isNotEmpty) {
      listOfProduct = widget.listOfProduct!;
      count = listOfProduct.reduce((value, element) => value + element);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CardUpPanel(),
          const NameScreen(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (listOfProduct.isEmpty == true)
                      ? const Expanded(
                          child:
                              Center(child: Text('В корзине пока ничего нет')))
                      : Expanded(
                          child: RawScrollbar(
                            thumbColor: colorScheme.onBackground,
                            thumbVisibility: true,
                            trackVisibility: true,
                            child: ListOfProductsWidget(
                                listOfProduct: listOfProduct, count: count),
                          ),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: CostAndDelivery(count: count),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: LargeButton(
                        onTap: () {},
                        height: MediaQuery.of(context).size.height * 0.075,
                        text: 'Checkout'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
