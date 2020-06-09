import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store/model/products_model.dart';

class ProductsDatabase {
  static ProductsDatabase productsDatabase;

  ProductsDatabase._();

  static final db = ProductsDatabase._();

  ProductsDatabase._createInstance();

  factory ProductsDatabase() {
    if (productsDatabase == null) {
      productsDatabase = ProductsDatabase._createInstance();
    }
    return productsDatabase;
  }

  static Database _database;
  String tableName = "productss_table";
  String _id = "id";
  String __name = "name";
  String __price = "price";
  String __category = "category";
  String __desc = "desc";
  String __image = "image";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializedDatabase();
    }
    return _database;
  }

  Future<Database> initializedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "productss.db";

    var userDB =
        await openDatabase(path, version: 1, onCreate: await createDatabase);
    return userDB;
  }

  Future<List<ProductsModel>> createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY AUTOINCREMENT, $__name TEXT, $__price TEXT," +
            " $__category TEXT, $__desc TEXT, $__image TEXT )");
  }

   productsList() async {
    Database db = await this.database;
    var result = await db.query(tableName, orderBy: "$_id ASC");
    return result;
  }

  getAllProducts() async {
    final db = await database;
    var res = await db.query(tableName, orderBy: "$_id ASC");
    List<ProductsModel> list =
        res.isNotEmpty ? res.map((c) => ProductsModel.fromMap(c)).toList() : [];
    return list;
  }

  Future<int> insertProduct(ProductsModel productsDB) async {
    Database db = await this.database;
    var result = await db.insert(tableName, productsDB.toMap());
    return result;
  }
}
