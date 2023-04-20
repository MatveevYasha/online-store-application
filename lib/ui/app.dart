import 'package:flutter/material.dart';
import 'package:online_store_application/ui/screens/splash_screen/splash_screen.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online store application',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
