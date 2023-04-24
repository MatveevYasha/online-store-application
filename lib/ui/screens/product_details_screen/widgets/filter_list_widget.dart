import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class FilterListWidget extends StatefulWidget {
  const FilterListWidget({
    super.key,
  });

  @override
  State<FilterListWidget> createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  final List<String> _filterList = ['Shop', 'Details', 'Features'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: MediaQuery.of(context).size.width * 0.05);
        },
        scrollDirection: Axis.horizontal,
        itemCount: _filterList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Text(
                  _filterList[index],
                  style: textTheme.displayLarge?.copyWith(
                      fontWeight: (index == _selectedIndex)
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: (index == _selectedIndex)
                          ? colorScheme.secondary
                          : colorScheme.onSecondary),
                ),
              ),
              const SizedBox(height: 5),
              (index == _selectedIndex)
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: colorScheme.primary),
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
