part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class AddProductToCardEvent extends DetailEvent {
  final int count;

  AddProductToCardEvent(this.count);
}

class IncrementCardEvent extends DetailEvent {
  final int index;

  IncrementCardEvent(this.index);
}

class DecrementCardEvent extends DetailEvent {
  final int index;

  DecrementCardEvent(this.index);
}

class RemoveCardEvent extends DetailEvent {
  final int index;

  RemoveCardEvent(this.index);
}
