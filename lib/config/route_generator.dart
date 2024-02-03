import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ram_mandir_app/presentation/error_page.dart';
import 'package:ram_mandir_app/presentation/home_page.dart';
import 'package:ram_mandir_app/presentation/music_page.dart';

class RouteGenerator {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const HomePage());
      case "/music":
        return PageTransition(type: PageTransitionType.bottomToTop, child: const MusicPage(), duration: const Duration(milliseconds: 500));
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}
