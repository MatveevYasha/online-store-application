import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/phones.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class HotSalesCarusel extends StatelessWidget {
  const HotSalesCarusel({
    super.key,
    required Phones phones,
  }) : _phones = phones;

  final Phones _phones;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _phones.homeStore.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    _phones.homeStore[index].picture),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  (_phones.homeStore[index].isNew == true)
                      ? Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorScheme.primary),
                          child: Text(
                            'New',
                            style: textTheme.bodyMedium,
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  _TextWithShadow(
                    text: _phones.homeStore[index].title,
                    textStyle: textTheme.bodyLarge,
                  ),
                  _TextWithShadow(
                    text: _phones.homeStore[index].subtitle,
                    textStyle: textTheme.bodyMedium,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.022,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        color: colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      'Buy now!',
                      style: textTheme.bodyMedium
                          ?.copyWith(color: colorScheme.secondary),
                    )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TextWithShadow extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const _TextWithShadow({
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(text,
            style: textStyle?.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3
                ..color = colorScheme.secondary,
            )),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
