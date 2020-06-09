class AddressModel {
  int id;
  String address;

  AddressModel({this.id, this.address});

  factory AddressModel.fromMap(Map<String, dynamic> json) => new AddressModel(
        id: json["id"],
        address: json["address"],
      );



  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this.id;
    map["address"] = this.address;
  }
}
