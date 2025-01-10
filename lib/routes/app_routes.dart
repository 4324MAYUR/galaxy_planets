import 'package:flutter/cupertino.dart';
import 'package:galaxy_planets/pages/detail/detail_page.dart';
import 'package:galaxy_planets/pages/favorite/favorite_page.dart';
import 'package:galaxy_planets/pages/home/home_page.dart';
import 'package:galaxy_planets/pages/splash/splash_page.dart';

class AllRoutes {
  static String splash = "/";
  static String home = "/home";
  static String detail = "/detail";
  static String favorite = "/favorite";

  static Map<String, Widget Function(BuildContext)> pages = {
    "/" : (context) =>   const SplashPage(),
    "/home" : (context) => const HomePage(),
    "/detail" : (context) => const DetailPage(),
    "/favorite" : (context) => const FavoritePage(),
  };
}
