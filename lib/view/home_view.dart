import 'package:flutter/material.dart';
import 'package:movax_quadb/controller/movie_controller.dart';
import 'package:movax_quadb/routes/route_name.dart';
import 'package:movax_quadb/utils/app_color.dart';
import 'package:movax_quadb/utils/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieController>(context, listen: false).fetchMovies();
    });
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        surfaceTintColor: AppColor.bgColor,
        backgroundColor: AppColor.bgColor,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(ImagePath.logo2),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              ImagePath.appLogo,
              width: 120,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteName.search);
                },
                child: const Icon(
                  Icons.search,
                  color: AppColor.componentColor,
                  size: 32,
                ))
          ],
        ),
      ),
      body: Consumer<MovieController>(
        builder: (context, movieController, child) {
          if (movieController.isLoading) {
            return const Center(
                child:
                    CircularProgressIndicator(color: AppColor.componentColor));
          }

          if (movieController.movies.isEmpty) {
            return const Center(child: Text('No movies found'));
          }

          return SingleChildScrollView(
            physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 420,
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 1,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                      scrollDirection: Axis.horizontal,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final movie = movieController.movies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.details,
                              arguments: movie,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: movie.originalImageUrl != null
                                ? Image.network(
                                    movie.originalImageUrl!,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    color: AppColor.primary,
                                    child: Center(
                                      child: Text(
                                        movie.name,
                                        style: const TextStyle(
                                            color: AppColor.textColor),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Shows You May Like',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics:
                        const ScrollPhysics(parent: BouncingScrollPhysics()),
                    itemCount: movieController.movies.length * 3,
                    itemBuilder: (context, index) {
                      final movie = movieController
                          .movies[index % movieController.movies.length];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.details,
                                  arguments: movie,
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: movie.originalImageUrl != null
                                    ? Image.network(
                                        movie.originalImageUrl!,
                                        width: 100,
                                        height: 130,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        width: 100,
                                        height: 130,
                                        color: AppColor.primary,
                                        child: Center(
                                          child: Text(
                                            movie.name,
                                            style: const TextStyle(
                                                color: AppColor.textColor),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
