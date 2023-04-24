import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/details_phone.dart';

class ProductDetailCarusel extends StatelessWidget {
  const ProductDetailCarusel({
    super.key,
    required DetailPhone detailsPhones,
  }) : _detailsPhones = detailsPhones;

  final DetailPhone _detailsPhones;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeFactor: 0.5,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        ),
        items: _detailsPhones.images
            .map(
              (image) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
