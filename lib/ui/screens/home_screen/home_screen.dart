// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store_application/data/models/category_token.dart';
import 'package:online_store_application/data/models/phones.dart';
import 'package:online_store_application/ui/app.dart';
import 'package:online_store_application/ui/screens/home_screen/bloc/home_bloc.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/best_seller_grid.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/category_select.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/category_text.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/custom_bottom_bar.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/custom_bottom_sheet.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/hot_sales_carusel.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/main_app_bar.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/text_field_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Phones _phones;
  late final List<CategoryToken> _categoryList;
  bool isLoading = true;
  final bloc = HomeBloc(prdb, cdb);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
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
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeLoadState && isLoading == true) {
              _phones = state.products;
              _categoryList = state.category;
              isLoading = false;
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const CategoryText(
                    textLeft: 'Select Category',
                    textRight: 'view all',
                  ),
                  (isLoading == true)
                      ? const CircularProgressIndicator()
                      : CategoryList(
                          categoryList: _categoryList,
                        ),
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
            );
          },
        ),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}
