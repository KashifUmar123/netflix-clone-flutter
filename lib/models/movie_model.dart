class Movie {
  String? title;
  String? description;
  bool? isContinue;
  String? thumbailUrl;
  String? movieUrl;

  Movie({
    this.title,
    this.description,
    this.isContinue,
    this.thumbailUrl,
    this.movieUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'isContinue': isContinue,
      'thumbailUrl': thumbailUrl,
      'movieUrl': movieUrl,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      description:
          map['description'] != null ? map['description'] as String : null,
      isContinue: map['isContinue'] != null ? map['isContinue'] as bool : null,
      thumbailUrl:
          map['thumbailUrl'] != null ? map['thumbailUrl'] as String : null,
      movieUrl: map['movieUrl'] != null ? map['movieUrl'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }
}
