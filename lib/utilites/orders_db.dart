import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store/model/products_model.dart';

class OrderDatabase {
  static OrderDatabase orderDatabase;

  OrderDatabase._();

  static final db = OrderDatabase._();

  OrderDatabase._createInstance();

  factory OrderDatabase() {
    if (orderDatabase == null) {
      orderDatabase = OrderDatabase._createInstance();
    }
    return orderDatabase;
  }

  static Database _database;
  String tableName = "orders_table";
  String _id = "id";
  String __product_name = "product_name";
  String __price = "price";
  String __client_name = "client_name";
  String __details = "details";
  String __address = "address";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializedDatabase();
    }
    return _database;
  }

  Future<Database> initializedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "orders.db";

    var userDB = await openDatabase(path, version: 1, onCreate: createDatabase);
    return userDB;
  }

  void createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY AUTOINCREMENT, $__product_name TEXT, $__price TEXT," +
            " $__client_name TEXT, $__details TEXT, $__address TEXT )");
  }

  Future<List<Map<String, dynamic>>> ordersList() async {
    Database db = await this.database;
    var result = await db.query(tableName, orderBy: "$_id ASC");
    return result;
  }

  getAllOrders() async {
    final db = await database;
    var res = await db.query(tableName);
    List<ProductsModel> list =
        res.isNotEmpty ? res.map((c) => ProductsModel.fromMap(c)).toList() : [];
    return list;
  }

  Future<int> insertOrder(ProductsModel productsDB) async {
    Database db = await this.database;
    var result = await db.insert(tableName, productsDB.toMap());
    return result;
  }
}
