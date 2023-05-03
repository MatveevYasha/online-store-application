part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class AddProductToCardEvent extends DetailEvent {
  final int count;

  AddProductToCardEvent(this.count);
}
