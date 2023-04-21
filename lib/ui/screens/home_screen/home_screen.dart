// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:online_store_application/ui/screens/home_screen/widgets/category_select.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/category_text.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/custom_bottom_bar.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/custom_bottom_sheet.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/main_app_bar.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/text_field_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          children: const [
            CategoryText(
              textLeft: 'Select Category',
              textRight: 'view all',
            ),
            CategoryList(),
            TextFieldForm(),
            CategoryText(
              textLeft: 'Hot sales',
              textRight: 'see more',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
