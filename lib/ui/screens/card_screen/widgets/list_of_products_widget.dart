import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class ListOfProductsWidget extends StatefulWidget {
  final List<int> listOfProduct;
  int count;

  ListOfProductsWidget({
    super.key,
    required this.listOfProduct,
    required this.count,
  });

  @override
  State<ListOfProductsWidget> createState() => _ListOfProductsWidgetState();
}

class _ListOfProductsWidgetState extends State<ListOfProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listOfProduct.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              const _Image(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Galaxy Note 20 \nUltra',
                    style: textTheme.bodyMedium?.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${1500 * widget.listOfProduct[index]}.00',
                    style: textTheme.bodyMedium
                        ?.copyWith(fontSize: 20, color: colorScheme.primary),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                width: MediaQuery.of(context).size.width * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: colorScheme.onBackground),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (widget.listOfProduct[index] > 1) {
                              widget.listOfProduct[index] =
                                  widget.listOfProduct[index] - 1;
                              widget.count = widget.listOfProduct
                                  .reduce((value, element) => value + element);
                            }
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          color: colorScheme.onPrimary,
                        )),
                    Text(
                      '${widget.listOfProduct[index]}',
                      style: textTheme.bodyMedium?.copyWith(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.listOfProduct[index] =
                              widget.listOfProduct[index] + 1;
                          widget.count = widget.listOfProduct
                              .reduce((value, element) => value + element);
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.listOfProduct.removeAt(index);
                      if (widget.listOfProduct.isNotEmpty) {
                        widget.count = widget.listOfProduct
                            .reduce((value, element) => value + element);
                      } else {
                        widget.count = 0;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: colorScheme.onBackground,
                  ))
            ],
          ),
        );
      },
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    super.key,
  });

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
