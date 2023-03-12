import 'package:flutter/material.dart';
import 'package:moviesapp/providers/movies_provider.dart';
import 'package:moviesapp/providers/theme_changer.dart';
import 'package:moviesapp/screens/screens.dart';
import 'package:moviesapp/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => ThemeChanger(AppTheme.lightTheme)),
           ChangeNotifierProvider(
          create: (context) => MoviesProvier(), lazy: false),
    ], child: const MaterialAppWithTheme());
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: theme.getTheme(),
      darkTheme: AppTheme.darkTheme,
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'details': (context) => const DetailsScreen(),
      },
    );
  }
}
