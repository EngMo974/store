class User {
  int id;
  String name;
  String email;
  String password;
  String type;

  User({this.id, this.name, this.email, this.password, this.type});

  User.fromMap(dynamic obj) {
    this.email = obj['email'];
    this.password = obj['password'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this.id;
    map["name"] = this.name;
    map["email"] = this.email;
    map["password"] = this.password;
    map["type"] = this.type;
    return map;
  }
}
