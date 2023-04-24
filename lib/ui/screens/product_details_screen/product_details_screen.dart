import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/details_phone.dart';
import 'package:online_store_application/ui/global_widgets/button_with_icon.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/product_detail_carusel.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/up_panel.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

final _dio = Dio();

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final DetailPhone _detailsPhones;
  bool isLoading = true;

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
          const UpPanel(),
          (isLoading == true)
              ? const CircularProgressIndicator()
              : ProductDetailCarusel(detailsPhones: _detailsPhones),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }
}
