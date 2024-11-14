import 'package:flutter/material.dart';
import 'package:movax_quadb/model/movie_model.dart';
import 'package:movax_quadb/routes/route_name.dart';
import 'package:movax_quadb/view/detail_view.dart';
import 'package:movax_quadb/view/home_view.dart';
import 'package:movax_quadb/view/navbar.dart';
import 'package:movax_quadb/view/search_view.dart';
import 'package:movax_quadb/view/splash_view.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case RouteName.splash:
          return const SplashView();
        case RouteName.navbar:
          return const NavBar();
        case RouteName.home:
          return HomeView();
        case RouteName.search:
          return SearchView();
        case RouteName.details:
          final movie= settings.arguments as Movie;
          return DetailView(
            movie: movie,
          );

        default:
          return const Scaffold(body: Center(child: Text('Route not found')));
      }
    });
  }
}
