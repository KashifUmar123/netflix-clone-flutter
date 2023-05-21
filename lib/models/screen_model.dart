class ScreenModel {
  String? screenName;
  String? password;
  String? thumbnail;

  ScreenModel({
    this.screenName,
    this.password,
    this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'screenName': screenName,
      'password': password,
      'thumbnail': thumbnail,
    };
  }

  factory ScreenModel.fromMap(Map<String, dynamic> map) {
    return ScreenModel(
      screenName:
          map['screenName'] != null ? map['screenName'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
    );
  }
}
