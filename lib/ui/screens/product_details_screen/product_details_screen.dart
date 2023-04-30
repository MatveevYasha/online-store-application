import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/details_phone.dart';
import 'package:online_store_application/ui/global_widgets/large_button.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/filter_list_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/name_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/product_detail_carusel.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/raiting_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/select_color_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/selector_capacity_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/specifications_list.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/up_panel.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

final _dio = Dio();

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final DetailPhone _detailsPhones;
  bool isLoading = true;
  final List<int> _listOfProduct = [];
  bool isFavorite = false;

  @override
  void initState() {
    _getDetailPhones();
    super.initState();
  }

  void _getDetailPhones() async {
    // Добавить блок try catch и блок с загрузкой в флаттер блоке.
    final responce = await _dio
        .get('https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5');
    _detailsPhones = DetailPhone.fromJson(responce.data);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UpPanel(
            listOfProduct: _listOfProduct,
          ),
          (isLoading == true)
              ? const CircularProgressIndicator()
              : ProductDetailCarusel(detailsPhones: _detailsPhones),
          const SizedBox(height: 15),
          Expanded(
            child: (isLoading == true)
                ? const SizedBox()
                : Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: colorScheme.onPrimary,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.onSecondary,
                          blurRadius: 40,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NameWidget(
                          detailsPhones: _detailsPhones,
                          isFavorite: isFavorite,
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                        RaitingWidget(detailsPhones: _detailsPhones),
                        const FilterListWidget(),
                        SpecificationsList(detailsPhones: _detailsPhones),
                        Text(
                          'Select color and capacity',
                          style: textTheme.displayMedium
                              ?.copyWith(color: colorScheme.secondary),
                        ),
                        Row(
                          children: [
                            SelectColorWidget(
                              detailsPhones: _detailsPhones,
                            ),
                            SelectorCapacityWidget(
                              detailsPhones: _detailsPhones,
                            ),
                          ],
                        ),
                        LargeButton(
                          height: MediaQuery.of(context).size.height * 0.08,
                          onTap: () {
                            setState(() {
                              _listOfProduct.add(1);
                            });
                          },
                          text: 'Add to Cart    \$${_detailsPhones.price}',
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
