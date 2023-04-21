import 'package:json_annotation/json_annotation.dart';

part 'best_seller.g.dart';

@JsonSerializable(explicitToJson: true)
class BestSeller {
  final int id;
  @JsonKey(name: 'is_favorites')
  final bool isFavorites;
  final String title;
  @JsonKey(name: 'price_without_discount')
  final int priceWithoutDiscount;
  @JsonKey(name: 'discount_price')
  final int discountPrice;
  final String picture;

  BestSeller({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  factory BestSeller.fromJson(Map<String, dynamic> json) =>
      _$BestSellerFromJson(json);
  Map<String, dynamic> toJson() => _$BestSellerToJson(this);
}
