class OrdersModel {
  int id;
  String product_name;
  String client_name;
  String price;
  String address;
  String details;


  OrdersModel({this.id, this.product_name, this.client_name, this.price,
      this.address, this.details});

  factory OrdersModel.fromMap(Map<String, dynamic> json) => new OrdersModel(
    id: json["id"],
    product_name: json["product_name"],
    client_name: json["client_name"],
    price: json["price"],
    details: json["details"],
    address: json["address"],
  );



  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this.id;
    map["product_name"] = this.product_name;
    map["client_name"] = this.client_name;
    map["price"] = this.price;
    map["details"] = this.details;
    map["address"] = this.address;

  }
}
