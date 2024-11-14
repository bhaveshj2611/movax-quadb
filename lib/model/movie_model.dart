class Movie {
  final int id;
  final String name;
  final String? url;
  final String? type;
  final String? language;
  final List<String>? genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final String? scheduleTime;
  final List<String>? scheduleDays;
  final double? rating;
  final int? weight;
  final Network? network;
  final String? summary;
  final String? mediumImageUrl;
  final String? originalImageUrl;
  final ExternalLinks? externals;
  final String? previousEpisodeName;
  final String? previousEpisodeUrl;

  Movie({
    required this.id,
    required this.name,
    this.url,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.scheduleTime,
    this.scheduleDays,
    this.rating,
    this.weight,
    this.network,
    this.summary,
    this.mediumImageUrl,
    this.originalImageUrl,
    this.externals,
    this.previousEpisodeName,
    this.previousEpisodeUrl,
  });

  // Factory constructor to create a Movie object from JSON
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      type: json['type'],
      language: json['language'],
      genres: List<String>.from(json['genres'] ?? []),
      status: json['status'],
      runtime: json['runtime'],
      averageRuntime: json['averageRuntime'],
      premiered: json['premiered'],
      ended: json['ended'],
      officialSite: json['officialSite'],
      scheduleTime: json['schedule']?['time'],
      scheduleDays: List<String>.from(json['schedule']?['days'] ?? []),
      rating: (json['rating']?['average'] as num?)?.toDouble(),
      weight: json['weight'],
      network:
          json['network'] != null ? Network.fromJson(json['network']) : null,
      summary: json['summary'],
      mediumImageUrl: json['image']?['medium'],
      originalImageUrl: json['image']?['original'],
      externals: json['externals'] != null
          ? ExternalLinks.fromJson(json['externals'])
          : null,
      previousEpisodeName: json['_links']?['previousepisode']?['name'],
      previousEpisodeUrl: json['_links']?['previousepisode']?['href'],
    );
  }
}

// Supporting Network class to store network details
class Network {
  final int id;
  final String name;
  final String? officialSite;
  final Country? country;

  Network({
    required this.id,
    required this.name,
    this.officialSite,
    this.country,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      name: json['name'],
      officialSite: json['officialSite'],
      country:
          json['country'] != null ? Country.fromJson(json['country']) : null,
    );
  }
}

// Supporting Country class for network country details
class Country {
  final String name;
  final String code;
  final String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      timezone: json['timezone'],
    );
  }
}

// Supporting ExternalLinks class for external IDs
class ExternalLinks {
  final int? tvrage;
  final int? thetvdb;
  final String? imdb;

  ExternalLinks({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  factory ExternalLinks.fromJson(Map<String, dynamic> json) {
    return ExternalLinks(
      tvrage: json['tvrage'],
      thetvdb: json['thetvdb'],
      imdb: json['imdb'],
    );
  }
}
