import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store_application/ui/global_widgets/button_with_icon.dart';
import 'package:online_store_application/ui/global_widgets/large_button.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/card_up_panel.dart';
import 'package:online_store_application/ui/screens/card_screen/widgets/cost_and_delivery.dart';
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
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.37,
                          child: ListView.builder(
                            itemCount: listOfProduct.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                'https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig'),
                                            fit: BoxFit.scaleDown,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Galaxy Note 20 \nUltra',
                                          style: textTheme.bodyMedium
                                              ?.copyWith(fontSize: 20),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '\$${1500 * listOfProduct[index]}.00',
                                          style: textTheme.bodyMedium?.copyWith(
                                              fontSize: 20,
                                              color: colorScheme.primary),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 30),
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: colorScheme.onBackground),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (listOfProduct[index] > 1) {
                                                  listOfProduct[index] =
                                                      listOfProduct[index] - 1;
                                                  count = listOfProduct.reduce(
                                                      (value, element) =>
                                                          value + element);
                                                }
                                              });
                                            },
                                            child: Text(
                                              '-',
                                              style: textTheme.bodyMedium
                                                  ?.copyWith(fontSize: 20),
                                            ),
                                          ),
                                          Text(
                                            '${listOfProduct[index]}',
                                            style: textTheme.bodyMedium
                                                ?.copyWith(fontSize: 20),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                listOfProduct[index] =
                                                    listOfProduct[index] + 1;
                                                count = listOfProduct.reduce(
                                                    (value, element) =>
                                                        value + element);
                                              });
                                            },
                                            child: Text(
                                              '+',
                                              style: textTheme.bodyMedium
                                                  ?.copyWith(fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            listOfProduct.removeAt(index);
                                            if (listOfProduct.isNotEmpty) {
                                              count = listOfProduct.reduce(
                                                  (value, element) =>
                                                      value + element);
                                            } else {
                                              count = 0;
                                            }
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.21,
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
