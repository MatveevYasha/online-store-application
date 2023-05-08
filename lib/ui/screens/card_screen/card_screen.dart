import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store_application/ui/global_widgets/large_button.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/card_image_widget.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/card_up_panel.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/cost_and_delivery.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/description_widget.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/name_screen.dart';
import 'package:online_store_application/ui/screens/product_details_screen/bloc/detail_bloc.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

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
                                child: ListView.builder(
                                  itemCount: state.card.length,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20),
                                      child: Row(
                                        children: [
                                          const CardImageWidget(),
                                          DescriptionWidget(
                                              text:
                                                  '\$${1500 * state.card[index]}.00'),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 30),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color:
                                                    colorScheme.onBackground),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        context
                                                            .read<DetailBloc>()
                                                            .add(
                                                                DecrementCardEvent(
                                                                    index));
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color:
                                                          colorScheme.onPrimary,
                                                    )),
                                                Text(
                                                  '${state.card[index]}',
                                                  style: textTheme.bodyMedium
                                                      ?.copyWith(fontSize: 20),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      context
                                                          .read<DetailBloc>()
                                                          .add(
                                                              IncrementCardEvent(
                                                                  index));
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color:
                                                        colorScheme.onPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  context
                                                      .read<DetailBloc>()
                                                      .add(RemoveCardEvent(
                                                          index));
                                                });
                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                color: colorScheme.onBackground,
                                              ))
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: CostAndDelivery(),
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
