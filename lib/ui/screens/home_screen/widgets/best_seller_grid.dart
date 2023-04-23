import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/phones.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class BestSellerGrid extends StatelessWidget {
  const BestSellerGrid({
    super.key,
    required Phones phones,
  }) : _phones = phones;

  final Phones _phones;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _phones.bestSeller.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: CachedNetworkImage(
                              imageUrl: _phones.bestSeller[index].picture,
                              height: MediaQuery.of(context).size.height * 0.15,
                              errorWidget: (context, url, error) {
                                return Center(
                                    child: Image.asset(
                                        'assets/images/no_image.png'));
                              },
                            ),
                          ),
                          _FavoriteButton(
                            phones: _phones,
                            index: index,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${_phones.bestSeller[index].priceWithoutDiscount}  ',
                            style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.secondary,
                                fontWeight: FontWeight.w700),
                          ),
                          Text('\$${_phones.bestSeller[index].discountPrice}',
                              style: textTheme.displaySmall?.copyWith(
                                  color: colorScheme.onSecondary,
                                  decorationColor: colorScheme.onSecondary,
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                      Text(_phones.bestSeller[index].title,
                          style: textTheme.displaySmall
                              ?.copyWith(color: colorScheme.secondary)),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _FavoriteButton extends StatelessWidget {
  final int index;
  const _FavoriteButton({
    super.key,
    required Phones phones,
    required this.index,
  }) : _phones = phones;

  final Phones _phones;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: colorScheme.onPrimary),
        padding: const EdgeInsets.all(7),
        child: Icon(
          (_phones.bestSeller[index].isFavorites == true)
              ? Icons.favorite
              : Icons.favorite_border,
          size: 15,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
