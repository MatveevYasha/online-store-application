// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'details_phone.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailPhone {
  @JsonKey(name: 'CPU')
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final String id;
  final List<String> images;
  final bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;

  DetailPhone({
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
  });

  factory DetailPhone.fromJson(Map<String, dynamic> json) =>
      _$DetailPhoneFromJson(json);
  Map<String, dynamic> toJson() => _$DetailPhoneToJson(this);
}
