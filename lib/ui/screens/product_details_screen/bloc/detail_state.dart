// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'detail_bloc.dart';

@immutable
class DetailState {
  final List<DetailPhone> phones;
  final List<int> card;
  final bool isLoading;

  DetailState({
    this.phones = const [],
    this.card = const [],
    this.isLoading = false,
  });

  DetailState copyWith({
    List<DetailPhone>? phones,
    List<int>? card,
    bool? isLoading,
  }) {
    return DetailState(
      phones: phones ?? this.phones,
      card: card ?? this.card,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailState &&
        other.phones == phones &&
        listEquals(other.card, card) &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => phones.hashCode ^ card.hashCode ^ isLoading.hashCode;
}
