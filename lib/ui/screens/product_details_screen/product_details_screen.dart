import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store_application/data/models/details_phone.dart';
import 'package:online_store_application/ui/app.dart';
import 'package:online_store_application/ui/global_widgets/large_button.dart';
import 'package:online_store_application/ui/screens/product_details_screen/bloc/detail_bloc.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/filter_list_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/name_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/product_detail_carusel.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/raiting_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/select_color_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/selector_capacity_widget.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/specifications_list.dart';
import 'package:online_store_application/ui/screens/product_details_screen/widgets/up_panel.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // late final DetailPhone _detailsPhones;
  bool isLoading = true;
  final List<int> _listOfProduct = [];
  bool isFavorite = false;
  final bloc = DetailBloc(detdb);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        body: BlocConsumer<DetailBloc, DetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            // if (state is DetailLoadState && isLoading == true) {
            //   _detailsPhones = state.phone;
            //   _listOfProduct = [];
            //   isLoading = false;
            // }
            // if (state is AddCardState) {
            //   _listOfProduct = state.listOfProduct;
            // }

            return Column(
              children: [
                (state.isLoading == false)
                    ? const Center(child: CircularProgressIndicator())
                    : UpPanel(
                        listOfProduct: state.card,
                      ),
                (state.isLoading == false)
                    ? const CircularProgressIndicator()
                    : ProductDetailCarusel(detailsPhones: state.phones.first),
                const SizedBox(height: 15),
                Expanded(
                  child: (state.isLoading == false)
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            color: colorScheme.onPrimary,
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.onSecondary,
                                blurRadius: 40,
                                offset: const Offset(0, -5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NameWidget(
                                detailsPhones: state.phones.first,
                                isFavorite: isFavorite,
                                onTap: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                              ),
                              RaitingWidget(detailsPhones: state.phones.first),
                              const FilterListWidget(),
                              SpecificationsList(
                                  detailsPhones: state.phones.first),
                              Text(
                                'Select color and capacity',
                                style: textTheme.displayMedium
                                    ?.copyWith(color: colorScheme.secondary),
                              ),
                              Row(
                                children: [
                                  SelectColorWidget(
                                    detailsPhones: state.phones.first,
                                  ),
                                  SelectorCapacityWidget(
                                    detailsPhones: state.phones.first,
                                  ),
                                ],
                              ),
                              LargeButton(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                onTap: () {
                                  bloc.add(AddProductToCardEvent(1));
                                },
                                text:
                                    'Add to Cart    \$${state.phones.first.price}',
                              )
                            ],
                          ),
                        ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
