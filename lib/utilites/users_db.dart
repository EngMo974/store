import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store/model/users.dart';

class UserDatabase {
  static UserDatabase userDatabase;

  UserDatabase._createInstance();

  factory UserDatabase() {
    if (userDatabase == null) {
      userDatabase = UserDatabase._createInstance();
    }
    return userDatabase;
  }

  static Database _database;
  String tableName = "users_table";
  String _id = "id";
  String __name = "name";
  String __email = "email";
  String __password = "password";
  String __type = "type";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializedDatabase();
    }
    return _database;
  }

  Future<Database> initializedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "users.db";

    var userDB = await openDatabase(path, version: 1, onCreate: createDatabase);
    return userDB;
  }

  void createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY AUTOINCREMENT, $__name TEXT, $__email TEXT," +
            " $__password INTEGER, $__type TEXT )");
  }

  Future<List<Map<String, dynamic>>> usersList() async {
    Database db = await this.database;
    var result = await db.query(tableName, orderBy: "$_id ASC");
    return result;
  }

  Future<List<User>> users() async {
    // Get a reference to the database.
    Database db = await this.database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'],
          name: maps[i]['name'],
          email: maps[i]['email'],
          type: maps[i]['type'],
          password: maps[i]['password']);
    });
  }

  Future<int> insertUser(User user) async {
    Database db = await this.database;
    var result = await db.insert(tableName, user.toMap());
    return result;
  }

  Future<User> loginUser(String email, String password) async {
    var dbClient = await database;
    String sql =
        "SELECT * FROM user WHERE email = $email AND password = $password";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;

    return User.fromMap(result.first);
  }
}
