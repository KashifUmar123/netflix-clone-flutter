import 'package:netflix/models/screen_model.dart';

class UserModel {
  String? id;
  String? name;
  String? uid;
  String? email;
  bool? isSubscriberd;
  int? subscriptionPeroid;
  List<ScreenModel>? screens;

  UserModel({
    this.id,
    this.name,
    this.uid,
    this.email,
    this.isSubscriberd,
    this.subscriptionPeroid,
    this.screens,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'email': email,
      'isSubscriberd': isSubscriberd,
      'subscriptionPeroid': subscriptionPeroid,
      'screens': screens!.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      isSubscriberd:
          map['isSubscriberd'] != null ? map['isSubscriberd'] as bool : null,
      subscriptionPeroid: map['subscriptionPeroid'] != null
          ? map['subscriptionPeroid'] as int
          : null,
      screens: map['screens'] != null
          ? List<ScreenModel>.from(
              map['screens'].map<ScreenModel?>(
                (x) => ScreenModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
