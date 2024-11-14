import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movax_quadb/controller/movie_controller.dart';
import 'package:movax_quadb/routes/route_name.dart';
import 'package:movax_quadb/utils/app_color.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        Provider.of<MovieController>(context, listen: false)
            .searchMovies(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieController>(context);

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 64.0, 8.0, 8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: AppColor.textColor),
                alignLabelWithHint: true,
                labelText: 'Search',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _onSearchChanged;
                  },
                  child: const Icon(
                    Icons.search,
                    color: AppColor.componentColor,
                  ),
                ),
              ),
              style: const TextStyle(
                color: AppColor.componentColor,
                fontSize: 16.0,
                letterSpacing: 1.0,
              ),
              cursorColor: AppColor.primary,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onChanged: _onSearchChanged,
            ),
            Expanded(
              child: movieProvider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.textColor,
                      ),
                    )
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: movieProvider.movies.length,
                      itemBuilder: (context, index) {
                        final movie = movieProvider.movies[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.details,
                              arguments: movie,
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: movie.originalImageUrl != null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        child: Image.network(
                                          movie.originalImageUrl!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      )
                                    : Container(
                                        color: Colors.grey,
                                        child: const Icon(
                                          Icons.image,
                                          size: 120,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
