import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/widgets/get_theme.dart';
import 'package:flutterapp/13-task/screen/profile_screen.dart';
import 'package:flutterapp/13-task/utils/theme_notif.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterapp/13-task/utils/theme_extension.dart' as ext;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(prefs),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Theme Demo',
          theme: getTheme(themeNotifier.theme),
          darkTheme: themeNotifier.theme.themeData(),
          themeMode: themeNotifier.theme.themeMode(),
          home: const ProfileScreen(),
        );
      },
    );
  }
}
