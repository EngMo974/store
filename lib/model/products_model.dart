class ProductsModel {
  int id;
  String name;
  String price;
  String category;
  String desc;
  String image;

  ProductsModel({this.id, this.name, this.price, this.category, this.desc,this.image});

  factory ProductsModel.fromMap(Map<String, dynamic> json) => new ProductsModel(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    category: json["category"],
    desc: json["desc"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this.id;
    map["name"] = this.name;
    map["price"] = this.price;
    map["category"] = this.category;
    map["desc"] = this.desc;
    map["image"] = this.image;
    return map;
  }



}
