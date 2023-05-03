import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:online_store_application/data/repository/category_repository.dart';
import 'package:online_store_application/data/repository/details_repository.dart';
import 'package:online_store_application/data/repository/product_repository.dart';
import 'package:online_store_application/ui/screens/card_screen/card_screen.dart';
import 'package:online_store_application/ui/screens/home_screen/home_screen.dart';
import 'package:online_store_application/ui/screens/product_details_screen/product_details_screen.dart';
import 'package:online_store_application/ui/screens/splash_screen/splash_screen.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

final dio = Dio();
final ProductRepository prdb = GetIt.I.get<ProductRepository>();
final CategoryRepository cdb = GetIt.I.get<CategoryRepository>();
final DetailsRepository detdb = GetIt.I.get<DetailsRepository>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online store application',
      theme: ThemeData(
        textTheme: textTheme,
        useMaterial3: true,
        colorScheme: colorScheme,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/home/detail': (context) => const ProductDetailsScreen(),
        '/home/detail/card': (context) => const CardScreen(),
      },
    );
  }
}
