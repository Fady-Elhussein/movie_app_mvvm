import 'package:flutter/material.dart';
import 'package:movie_app_mvvm/core/services/services_locator.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() async {
  ServicesLocator().init();
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MoviesScreen());
  }
}
