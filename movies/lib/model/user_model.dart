class User {

  String name;
  String avatar;

  User.fromJson(json) {
    name = json['name'];
    avatar = json['avatar'];
  }

}