class Episode {
  String? title;
  String? thumbnail;
  String? episodeUrl;
  bool? isContinue;
  Episode({
    this.title,
    this.thumbnail,
    this.episodeUrl,
    this.isContinue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'thumbnail': thumbnail,
      'episodeUrl': episodeUrl,
      'isContinue': isContinue,
    };
  }

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      title: map['title'] != null ? map['title'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      episodeUrl:
          map['episodeUrl'] != null ? map['episodeUrl'] as String : null,
      isContinue: map['isContinue'] != null ? map['isContinue'] as bool : null,
    );
  }
}
