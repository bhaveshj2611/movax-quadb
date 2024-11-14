import 'package:flutter/material.dart';
import 'package:movax_quadb/routes/route_name.dart';
import 'package:movax_quadb/utils/app_color.dart';
import 'package:movax_quadb/utils/app_constants.dart';
import 'package:movax_quadb/widgets/logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> gotoNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, RouteName.navbar);
  }

  @override
  void initState() {
    gotoNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildLogo(450, ImagePath.appLogo),
                const SizedBox(height: 10),
                buildLogo(120, ImagePath.logo2),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 64,
                  ),
                  child: Text(
                    "Your One Stop Destination for Movies & TV Shows",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                        color: AppColor.textColor),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                ImagePath.banner,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Text(
              'Developed by @bhaveshj2611',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.componentColor),
            ),
          )
        ],
      ),
    );
  }
}
