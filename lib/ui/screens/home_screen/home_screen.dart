// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/phones.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/best_seller_grid.dart';

import 'package:online_store_application/ui/screens/home_screen/widgets/category_select.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/category_text.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/custom_bottom_bar.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/custom_bottom_sheet.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/hot_sales_carusel.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/main_app_bar.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/text_field_form.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

final _dio = Dio();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Phones _phones;
  bool isLoading = true;

  @override
  void initState() {
    _getPhones();
    super.initState();
  }

  void _getPhones() async {
    // Добавить блок try catch и блок с загрузкой в флаттер блоке.
    final responce = await _dio
        .get('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
    _phones = Phones.fromJson(responce.data);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return const CustomBottomSheet();
            },
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CategoryText(
              textLeft: 'Select Category',
              textRight: 'view all',
            ),
            const CategoryList(),
            const TextFieldForm(),
            const CategoryText(
              textLeft: 'Hot sales',
              textRight: 'see more',
            ),
            (isLoading == true)
                ? const CircularProgressIndicator()
                : HotSalesCarusel(phones: _phones),
            const CategoryText(
              textLeft: 'Best seller',
              textRight: 'see more',
            ),
            (isLoading == true)
                ? const CircularProgressIndicator()
                : BestSellerGrid(phones: _phones),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
