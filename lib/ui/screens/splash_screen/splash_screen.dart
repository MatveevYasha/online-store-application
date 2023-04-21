import 'package:flutter/material.dart';
import 'package:online_store_application/ui/screens/home_screen/home_screen.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';
import 'package:online_store_application/ui/theme/text_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loading();
    super.initState();
  }

  void loading() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomeScreen(),
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.secondary,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: colorScheme.primary),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130),
              child: Text('Ecommerce \nConcept',
                  style: textTheme.displayLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
