import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/article_details/article.dart';
import 'package:news_app/presentation/screens/home/home.dart';
import 'package:news_app/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String article_details = '/article_details';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
      case article_details:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ArticleDetails(),
        );
    }
  }
}
