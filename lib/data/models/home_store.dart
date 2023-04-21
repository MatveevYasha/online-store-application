import 'package:json_annotation/json_annotation.dart';

part 'home_store.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeStore {
  final int id;
  @JsonKey(name: 'is_new')
  final bool? isNew;
  final String title;
  final String subtitle;
  final String picture;
  @JsonKey(name: 'is_buy')
  final bool isBuy;

  HomeStore({
    required this.id,
    this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  factory HomeStore.fromJson(Map<String, dynamic> json) =>
      _$HomeStoreFromJson(json);
  Map<String, dynamic> toJson() => _$HomeStoreToJson(this);
}
