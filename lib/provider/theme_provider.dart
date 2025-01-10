import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {

  bool isDark = false;

 // change theme
  void changeTheme() async {
    isDark = !isDark;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
    notifyListeners();
  }

  Future<void> initTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    notifyListeners();
  }

}
