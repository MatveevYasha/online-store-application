import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardImageWidget extends StatelessWidget {
  const CardImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: CachedNetworkImageProvider(
                'https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig'),
            fit: BoxFit.scaleDown,
          ),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
