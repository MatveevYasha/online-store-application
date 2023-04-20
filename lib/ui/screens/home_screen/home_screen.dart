// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:online_store_application/ui/screens/home_screen/widgets/category_select.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/category_text.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/main_app_bar.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          CategoryText(
            textLeft: 'Select Category',
            textRight: 'view all',
          ),
          const CategoryList(),
        ],
      ),
    );
  }
}
