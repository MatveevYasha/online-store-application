// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phones _$PhonesFromJson(Map<String, dynamic> json) => Phones(
      homeStore: (json['home_store'] as List<dynamic>)
          .map((e) => HomeStore.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestSeller: (json['best_seller'] as List<dynamic>)
          .map((e) => BestSeller.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhonesToJson(Phones instance) => <String, dynamic>{
      'home_store': instance.homeStore.map((e) => e.toJson()).toList(),
      'best_seller': instance.bestSeller.map((e) => e.toJson()).toList(),
    };
