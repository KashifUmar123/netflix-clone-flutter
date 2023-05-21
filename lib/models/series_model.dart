import 'package:netflix/constants/episode_model.dart';

class Series {
  String? name;
  int? totalEpisodes;
  String? title;
  int? currentEpisode;
  String? thumbnailUrl;
  List<Episode>? episodes;
  bool? isContinue;
  Series({
    this.name,
    this.totalEpisodes,
    this.title,
    this.currentEpisode,
    this.thumbnailUrl,
    this.episodes,
    this.isContinue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'totalEpisodes': totalEpisodes,
      'title': title,
      'currentEpisode': currentEpisode,
      'thumbnailUrl': thumbnailUrl,
      'episodes': episodes!.map((x) => x.toMap()).toList(),
      'isContinue': isContinue,
    };
  }

  factory Series.fromMap(Map<String, dynamic> map) {
    return Series(
      name: map['name'] != null ? map['name'] as String : null,
      totalEpisodes:
          map['totalEpisodes'] != null ? map['totalEpisodes'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      currentEpisode:
          map['currentEpisode'] != null ? map['currentEpisode'] as int : null,
      thumbnailUrl:
          map['thumbnailUrl'] != null ? map['thumbnailUrl'] as String : null,
      episodes: map['episodes'] != null
          ? List<Episode>.from(
              map['episodes'].map<Episode?>(
                (x) => Episode.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      isContinue: map['isContinue'] != null ? map['isContinue'] as bool : null,
    );
  }
}
