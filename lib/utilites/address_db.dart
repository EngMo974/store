import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store/model/address_model.dart';
import 'package:store/model/products_model.dart';

class AddressDatabase {
  static AddressDatabase addressDatabase;

  AddressDatabase._();

  static final db = AddressDatabase._();

  AddressDatabase._createInstance();

  factory AddressDatabase() {
    if (addressDatabase == null) {
      addressDatabase = AddressDatabase._createInstance();
    }
    return addressDatabase;
  }

  static Database _database;
  String tableName = "address_table";
  String _id = "id";
  String __adress = "address";
  String __name = "name";
  String __city = "city";
  String __phone = "phone";


  Future<Database> get database async {
    if (_database == null) {
      _database = await initializedDatabase();
    }
    return _database;
  }

  Future<Database> initializedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "address.db";

    var userDB = await openDatabase(path, version: 1, onCreate: createDatabase);
    return userDB;
  }

  void createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY AUTOINCREMENT, $__adress TEXT" );
  }

  Future<List<Map<String, dynamic>>> productsAddress() async {
    Database db = await this.database;
    var result = await db.query(tableName, orderBy: "$_id ASC");
    return result;
  }

  getAllAddress() async {
    final db = await database;
    var res = await db.query(tableName);
    List<ProductsModel> list =
    res.isNotEmpty ? res.map((c) => ProductsModel.fromMap(c)).toList() : [];
    return list;
  }

  Future<int> insertAddress(AddressModel addressModel) async {
    Database db = await this.database;
    var result = await db.insert(tableName, addressModel.toMap());
    return result;
  }



}
