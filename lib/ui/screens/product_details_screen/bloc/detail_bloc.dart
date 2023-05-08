import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:online_store_application/data/models/category_token.dart';
import 'package:online_store_application/data/models/details_phone.dart';
import 'package:online_store_application/data/models/phones.dart';
import 'package:online_store_application/data/repository/category_repository.dart';
import 'package:online_store_application/data/repository/details_repository.dart';
import 'package:online_store_application/data/repository/product_repository.dart';
import 'package:online_store_application/ui/app.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailsRepository _detailsyRepository;

  DetailBloc(this._detailsyRepository) : super(DetailState()) {
    on<AddProductToCardEvent>(_addToCard);
    on<IncrementCardEvent>(_increment);
    on<DecrementCardEvent>(_decrement);
    on<RemoveCardEvent>(_remove);
    _initialize();
  }

  _initialize() async {
    final phone = await _detailsyRepository.loadDetPhones();
    emit(state.copyWith(phones: [phone], isLoading: true));
  }

  FutureOr _addToCard(AddProductToCardEvent event, emit) async {
    emit(state.copyWith(card: [...state.card, event.count]));
  }

  FutureOr _increment(
      IncrementCardEvent event, Emitter<DetailState> emit) async {
    List<int> list = state.card;
    list.replaceRange(
        event.index, event.index + 1, [list.elementAt(event.index) + 1]);
    emit(
      state.copyWith(card: list),
    );
  }

  FutureOr _decrement(
      DecrementCardEvent event, Emitter<DetailState> emit) async {
    List<int> list = state.card;
    if (list.elementAt(event.index) > 1) {
      list.replaceRange(
          event.index, event.index + 1, [list.elementAt(event.index) - 1]);
    }
    emit(
      state.copyWith(card: list),
    );
  }

  FutureOr _remove(RemoveCardEvent event, Emitter<DetailState> emit) async {
    List<int> list = state.card;
    list.removeAt(event.index);
    emit(
      state.copyWith(card: list),
    );
  }
}
