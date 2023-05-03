import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/category_token.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';

class CategoryList extends StatefulWidget {
  final List<CategoryToken> categoryList;

  const CategoryList({
    super.key,
    required this.categoryList,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (index == _selectedIndex)
                          ? colorScheme.primary
                          : colorScheme.onPrimary),
                  child: Icon(
                    widget.categoryList[index].icon,
                    size: 30,
                    color: (index == _selectedIndex)
                        ? colorScheme.onPrimary
                        : colorScheme.onSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.categoryList[index].name,
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
