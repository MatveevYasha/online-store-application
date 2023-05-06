import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store_application/ui/global_widgets/large_button.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/card_up_panel.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/cost_and_delivery.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/list_of_products_widget.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/name_screen.dart';
import 'package:online_store_application/ui/screens/product_details_screen/bloc/detail_bloc.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          return Column(
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
                      (state.card.isEmpty == true)
                          ? const Expanded(
                              child: Center(
                                  child: Text('В корзине пока ничего нет')))
                          : Expanded(
                              child: RawScrollbar(
                                thumbColor: colorScheme.onBackground,
                                thumbVisibility: true,
                                trackVisibility: true,
                                child: ListOfProductsWidget(),
                              ),
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: const CostAndDelivery(),
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
          );
        },
      ),
    );
  }
}
