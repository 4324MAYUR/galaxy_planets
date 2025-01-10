import 'package:flutter/material.dart';
import 'package:galaxy_planets/provider/json_provider.dart';
import 'package:galaxy_planets/provider/theme_provider.dart';
import 'package:galaxy_planets/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ThemeProvider themeProvider = ThemeProvider();
  await themeProvider.initTheme();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JsonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
      routes: AllRoutes.pages,
      initialRoute: AllRoutes.splash,
    );
  }
}
