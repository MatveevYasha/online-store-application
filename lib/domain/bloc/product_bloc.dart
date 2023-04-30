import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_store_application/data/repository/category_repository.dart';
import 'package:online_store_application/data/repository/product_repository.dart';
import 'package:online_store_application/ui/app.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductLoading()) {
    on<ProductEvent>(_loading);
    on<ProductEvent>(_load);
  }

  _loading(event, emit) {
    emit(ProductLoadProduct());
  }

  _load(event, emit) async {
    final responce = await _productRepository.loadProducts();
    print(responce);
  }
}
