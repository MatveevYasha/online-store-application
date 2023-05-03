import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:online_store_application/data/repository/category_repository.dart';
import 'package:online_store_application/data/repository/details_repository.dart';
import 'package:online_store_application/data/repository/product_repository.dart';
import 'package:online_store_application/ui/app.dart';

void main() {
  GetIt.I.registerSingleton<ProductRepository>(const ConstProductRepository());
  GetIt.I
      .registerSingleton<CategoryRepository>(const ConstCategoryRepository());
  GetIt.I.registerSingleton<DetailsRepository>(const ConstDetailsRepository());

  runApp(const App());
}
