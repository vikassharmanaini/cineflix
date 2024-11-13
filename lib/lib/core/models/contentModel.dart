class MediaContent {
  final String? id;
  final String? title;
  final String? description;
  final String? category;
  final int? duration;
  final String? rating;
  final double? imdbRating;
  final List<String>? genres;
  final bool? isMoviePart;
  final int? moviePart;
  final bool? isSeries;
  final int? introStartTime;
  final int? introEndTime;
  final String? posterUrl;
  final String? studio;
  final String? productionHouse;
  final String? contentAdvisory;
  final List<Cast?>? casts;
  final List<Subtitle?>? subtitles;
  final List<AvailableQuality?>? availableQualities;
  final String? contentType;
  final String? videoUrl;
  final bool? isFree;
  final DateTime? releaseDate;
  final int? likes;
  final int? watchTime;
  final int? shares;
  final int? dislikes;
  final int? views;
  final bool? availableForRent;
  final double? rentPrice;
  final double? cnfPrice;
  final int? downloadCount;
  final Map? audioUrls;
  final ResolutionLimits? resolutionLimits;
  final SeriesInfo? seriesInfo;

  MediaContent({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.duration,
    required this.rating,
    required this.imdbRating,
    required this.genres,
    required this.isMoviePart,
    required this.moviePart,
    required this.isSeries,
    required this.introStartTime,
    required this.introEndTime,
    required this.posterUrl,
    required this.studio,
    required this.productionHouse,
    required this.contentAdvisory,
    required this.casts,
    required this.subtitles,
    required this.availableQualities,
    required this.contentType,
    required this.videoUrl,
    required this.isFree,
    required this.releaseDate,
    required this.likes,
    required this.watchTime,
    required this.shares,
    required this.dislikes,
    required this.views,
    required this.availableForRent,
    required this.rentPrice,
    required this.cnfPrice,
    required this.downloadCount,
    required this.audioUrls,
    required this.resolutionLimits,
    required this.seriesInfo,
  });

  factory MediaContent.fromJson(Map<String, dynamic> json) {
    return MediaContent(
      id: json['_id'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      category: json['category'].toString(),
      duration: json['duration'],
      rating: json['rating'].toString(),
      imdbRating: json['imdbRating'].toDouble(),
      genres: List<String>.from(json['genres']),
      isMoviePart: json['isMoviePart'],
      moviePart: json['moviePart'],
      isSeries: json['isSeries'],
      introStartTime: json['introStartTime'],
      introEndTime: json['introEndTime'],
      posterUrl: json['posterUrl'],
      studio: json['studio'],
      productionHouse: json['productionHouse'],
      contentAdvisory: json['contentAdvisory'],
      casts: (json['casts'] as List).map((e) => Cast.fromJson(e)).toList(),
      subtitles:
          (json['subtitles'] as List).map((e) => Subtitle.fromJson(e)).toList(),
      availableQualities: (json['availableQualities'] as List)
          .map((e) => AvailableQuality.fromJson(e))
          .toList(),
      contentType: json['contentType'],
      videoUrl: json['videoUrl'],
      isFree: json['isFree'],
      releaseDate: DateTime.parse(json['releaseDate']),
      likes: json['likes'],
      watchTime: json['watchTime'],
      shares: json['shares'],
      dislikes: json['dislikes'],
      views: json['views'],
      availableForRent: json['availableForRent'],
      rentPrice: json['rentPrice'],
      cnfPrice: json['cnfPrice'],
      downloadCount: json['downloadCount'],
      audioUrls: json['audioUrls'],
      resolutionLimits: ResolutionLimits.fromJson(json['resolutionLimits']),
      seriesInfo: SeriesInfo.fromJson(json['seriesInfo']),
    );
  }
}

class AudioUrls {
  final String english;
  final String spanish;
  final String french;
  final String hindi;

  AudioUrls({
    required this.english,
    required this.spanish,
    required this.french,
    required this.hindi,
  });

  factory AudioUrls.fromJson(Map<String, dynamic> json) {
    return AudioUrls(
      english: json['english'],
      spanish: json['spanish'],
      french: json['french'],
      hindi: json['hindi'],
    );
  }
}

class ResolutionLimits {
  final String freeUser;
  final String paidUser;

  ResolutionLimits({
    required this.freeUser,
    required this.paidUser,
  });

  factory ResolutionLimits.fromJson(Map<String, dynamic> json) {
    return ResolutionLimits(
      freeUser: json['freeUser'],
      paidUser: json['paidUser'],
    );
  }
}

class SeriesInfo {
  final String seriesName;
  final int seasonNumber;
  final String episodeTitle;
  final int episodeDuration;

  SeriesInfo({
    required this.seriesName,
    required this.seasonNumber,
    required this.episodeTitle,
    required this.episodeDuration,
  });

  factory SeriesInfo.fromJson(Map<String, dynamic> json) {
    return SeriesInfo(
      seriesName: json['seriesName'],
      seasonNumber: json['seasonNumber'],
      episodeTitle: json['episodeTitle'],
      episodeDuration: json['episodeDuration'],
    );
  }
}

class Cast {
  final String charName;
  final String realName;
  final String pictureUrl;
  final String id;

  Cast({
    required this.charName,
    required this.realName,
    required this.pictureUrl,
    required this.id,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      charName: json['charName'],
      realName: json['realName'],
      pictureUrl: json['pictureUrl'],
      id: json['_id'],
    );
  }
}

class Subtitle {
  final String language;
  final String fileUrl;
  final String id;

  Subtitle({
    required this.language,
    required this.fileUrl,
    required this.id,
  });

  factory Subtitle.fromJson(Map<String, dynamic> json) {
    return Subtitle(
      language: json['language'],
      fileUrl: json['fileUrl'],
      id: json['_id'],
    );
  }
}

class AvailableQuality {
  final String resolution;
  final String fileUrl;
  final String id;

  AvailableQuality({
    required this.resolution,
    required this.fileUrl,
    required this.id,
  });

  factory AvailableQuality.fromJson(Map<String, dynamic> json) {
    return AvailableQuality(
      resolution: json['resolution'],
      fileUrl: json['fileUrl'],
      id: json['_id'],
    );
  }
}
