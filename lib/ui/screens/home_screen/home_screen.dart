import 'package:flutter/material.dart';
import 'package:online_store_application/data/models/category_token.dart';
import 'package:online_store_application/ui/screens/home_screen/widgets/category_select.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.abc),
            Text('Zihuatanejo, Gro'),
            Icon(Icons.abc),
          ],
          // переделать
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined))
        ],
      ),
      body: Column(
        children: const [
          CategoryList(),
        ],
      ),
    );
  }
}
