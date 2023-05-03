import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_store_application/data/models/category_token.dart';
import 'package:online_store_application/data/models/phones.dart';
import 'package:online_store_application/data/repository/category_repository.dart';
import 'package:online_store_application/data/repository/product_repository.dart';
import 'package:online_store_application/ui/app.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  HomeBloc(this._productRepository, this._categoryRepository)
      : super(HomeInitialState()) {
    _initialize();
  }

  _initialize() async {
    final products = await _productRepository.loadProducts();
    final category = await _categoryRepository.loadCategory();
    emit(
      HomeLoadState(products: products, category: category),
    );
  }
}
