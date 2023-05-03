// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadState extends HomeState {
  Phones products;
  List<CategoryToken> category;

  HomeLoadState({
    required this.products,
    required this.category,
  });
}
