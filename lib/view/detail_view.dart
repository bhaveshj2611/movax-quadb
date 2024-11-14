import 'package:flutter/material.dart';
import 'package:movax_quadb/model/movie_model.dart';
import 'package:movax_quadb/utils/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatelessWidget {
  final Movie movie;

  const DetailView({super.key, required this.movie});

  void openTvShowUrl() async {
    final url = Uri.parse(movie.url!);

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void watchTrailer(String query) async {
    final webUrl = Uri.parse(
        'https://www.youtube.com/results?search_query=${Uri.encodeComponent(query)}');

    if (await canLaunchUrl(webUrl)) {
      await launchUrl(webUrl, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $webUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColor.bgColor,
        title: Text(movie.name, style: const TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                movie.originalImageUrl != null
                    ? Image.network(
                        movie.originalImageUrl!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey,
                        child: const Icon(
                          Icons.movie,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.play_circle_outline,
                          size: 50, color: Colors.white),
                      onPressed: () {
                        watchTrailer(
                            "${movie.name} ${movie.premiered!.substring(0, 4)} trailer");
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              movie.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),
            Row(
              children: [
                if (movie.premiered != null)
                  Text(
                    movie.premiered!,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                if (movie.genres != null && movie.genres!.isNotEmpty) ...[
                  const SizedBox(width: 10),
                  Text(
                    movie.genres!.join(', '),
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
                if (movie.runtime != null) ...[
                  const SizedBox(width: 10),
                  Text(
                    '${movie.runtime} min',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                movie.rating != null
                    ? '${(movie.rating! * 10).toInt()}% people love this show'
                    : 'No rating available',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.componentColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: const BeveledRectangleBorder(),
                      backgroundColor: AppColor.textColor,
                    ),
                    icon: const Icon(
                      Icons.play_arrow,
                      color: AppColor.bgColor,
                    ),
                    label: const Text(
                      "Play",
                      style: TextStyle(color: AppColor.bgColor, fontSize: 18),
                    ),
                    onPressed: () {
                      openTvShowUrl();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Episode Info
            if (movie.previousEpisodeName != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.summary ?? 'No summary available',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            const SizedBox(height: 20),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(height: 4),
                    Text("My List", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
                    SizedBox(height: 4),
                    Text("Rate", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share, color: Colors.white),
                    SizedBox(height: 4),
                    Text("Share", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
