import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/category_token.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<CategoryToken> _categoryList = [
    CategoryToken(name: 'Phones', icon: Icons.phone_android_outlined),
    CategoryToken(name: 'Computer', icon: Icons.computer),
    CategoryToken(name: 'Health', icon: Icons.heart_broken),
    CategoryToken(name: 'Books', icon: Icons.library_books),
    CategoryToken(name: 'Other', icon: Icons.rule_outlined),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categoryList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (index == _selectedIndex)
                        ? colorScheme.primary
                        : colorScheme.onPrimary),
                child: IconButton(
                  color: (index == _selectedIndex)
                      ? colorScheme.onPrimary
                      : colorScheme.onSecondary,
                  icon: Icon(
                    _categoryList[index].icon,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 5),
              Text(
                _categoryList[index].name,
                style: TextStyle(
                    color: (index == _selectedIndex)
                        ? colorScheme.primary
                        : colorScheme.secondary),
              )
            ],
          );
        },
      ),
    );
  }
}
