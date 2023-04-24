import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:online_store_application/data/models/details_phone.dart';

class RaitingWidget extends StatelessWidget {
  const RaitingWidget({
    super.key,
    required DetailPhone detailsPhones,
  }) : _detailsPhones = detailsPhones;

  final DetailPhone _detailsPhones;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: _detailsPhones.rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 24,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
