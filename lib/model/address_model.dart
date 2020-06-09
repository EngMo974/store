class AddressModel {
  int id;
  String address;
  String name;
  String city;
  String phone;

  AddressModel({this.id, this.address, this.name, this.city, this.phone});

  factory AddressModel.fromMap(Map<String, dynamic> json) => new AddressModel(
        id: json["id"],
        address: json["address"],
        name: json["name"],
        city: json["city"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this.id;
    map["address"] = this.address;
    map["name"] = this.name;
    map["phone"] = this.phone;
  }
}
