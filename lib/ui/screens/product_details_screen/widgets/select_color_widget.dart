import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/details_phone.dart';
import 'package:online_store_application/ui/global_widgets/hex_color.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';

class SelectColorWidget extends StatefulWidget {
  const SelectColorWidget({
    super.key,
    required DetailPhone detailsPhones,
  }) : _detailsPhones = detailsPhones;

  final DetailPhone _detailsPhones;

  @override
  State<SelectColorWidget> createState() => _SelectColorWidgetState();
}

class _SelectColorWidgetState extends State<SelectColorWidget> {
  int _selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.4,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget._detailsPhones.color.length,
        itemBuilder: (context, index) {
          double circleDiametr = 40;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColorIndex = index;
              });
            },
            child: Container(
              height: circleDiametr,
              width: circleDiametr,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: HexColor(widget._detailsPhones.color[index]),
              ),
              child: (_selectedColorIndex == index)
                  ? Icon(Icons.check, color: colorScheme.onPrimary)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
