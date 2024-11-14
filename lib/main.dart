import 'package:flutter/material.dart';
import 'package:movax_quadb/controller/movie_controller.dart';

import 'package:movax_quadb/routes/custom_route.dart';
import 'package:movax_quadb/routes/route_name.dart';
import 'package:movax_quadb/utils/app_color.dart';
import 'package:movax_quadb/view/splash_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quadb',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      onGenerateRoute: CustomRoute.allRoutes,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
