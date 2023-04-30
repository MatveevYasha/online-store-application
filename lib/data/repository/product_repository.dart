import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/phones.dart';
import 'package:online_store_application/ui/app.dart';

abstract class ProductRepository {
  const ProductRepository();

  Future<Phones> loadProducts();
}

class ConstProductRepository extends ProductRepository {
  const ConstProductRepository();

  @override
  Future<Phones> loadProducts() async {
    try {
      final responce = await dio
          .get('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
      final phones = Phones.fromJson(responce.data);
      return phones;
    } catch (e) {
      throw Exception('Loading error in repository: $e');
    }
  }
}
