part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoadCategory extends ProductState {}

class ProductLoadProduct extends ProductState {}
