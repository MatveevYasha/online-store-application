import 'package:json_annotation/json_annotation.dart';
import 'package:online_store_application/data/models/best_seller.dart';
import 'package:online_store_application/data/models/home_store.dart';

part 'phones.g.dart';

@JsonSerializable(explicitToJson: true)
class Phones {
  @JsonKey(name: 'home_store')
  final List<HomeStore> homeStore;
  @JsonKey(name: 'best_seller')
  final List<BestSeller> bestSeller;

  Phones({
    required this.homeStore,
    required this.bestSeller,
  });

  factory Phones.fromJson(Map<String, dynamic> json) => _$PhonesFromJson(json);
  Map<String, dynamic> toJson() => _$PhonesToJson(this);
}
