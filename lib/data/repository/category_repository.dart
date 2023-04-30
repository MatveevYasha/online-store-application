import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/category_token.dart';

abstract class CategoryRepository {
  const CategoryRepository();

  Future<List<CategoryToken>> loadCategory();
}

class ConstCategoryRepository extends CategoryRepository {
  const ConstCategoryRepository();

  static final List<CategoryToken> _categoryList = [
    CategoryToken(name: 'Phones', icon: Icons.phone_android_outlined),
    CategoryToken(name: 'Computer', icon: Icons.computer),
    CategoryToken(name: 'Health', icon: Icons.heart_broken),
    CategoryToken(name: 'Books', icon: Icons.library_books),
    CategoryToken(name: 'Other', icon: Icons.rule_outlined),
  ];

  @override
  Future<List<CategoryToken>> loadCategory() async {
    return _categoryList;
  }
}
