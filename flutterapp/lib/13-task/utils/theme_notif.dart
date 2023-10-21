import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/widgets/botton_dialog_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  static const String key = "theme";
  final SharedPreferences prefs;
  late ThemeType theme;

  ThemeNotifier(this.prefs) {
    try {
      final savedTheme = prefs.getString(key);
      theme = savedTheme == null
          ? ThemeType.system
          : ThemeType.values.firstWhere((e) => e.toString() == savedTheme);
    } catch (e) {
      theme = ThemeType.system;
    }
  }

  void setTheme(ThemeType theme) {
    this.theme = theme;
    prefs.setString(key, theme.toString());
    notifyListeners();
  }
}
