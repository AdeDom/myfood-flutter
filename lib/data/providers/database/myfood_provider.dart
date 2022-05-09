import 'dart:io';

import 'package:myfood/app/config/database_constant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class MyFoodProvider {
  Database? database;

  Future initDb();

  Future closeDb();
}

class MyFoodProviderImpl implements MyFoodProvider {
  @override
  Database? database;

  MyFoodProviderImpl() {
    initDb();
  }

  @override
  Future initDb() async {
    try {
      final String databasePath = await getDatabasesPath();
      final String path = join(databasePath, DatabaseConstant.databaseName);

      if (!await Directory(dirname(path)).exists()) {
        await Directory(dirname(path)).create(recursive: true);
      }

      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          print("Database Create");
          String sql = "CREATE TABLE ${DatabaseConstant.tableUser} ("
              "${DatabaseConstant.columnUserId} TEXT PRIMARY KEY,"
              "${DatabaseConstant.columnUsername} TEXT,"
              "${DatabaseConstant.columnName} TEXT,"
              "${DatabaseConstant.columnEmail} TEXT,"
              "${DatabaseConstant.columnMobileNo} TEXT,"
              "${DatabaseConstant.columnAddress} TEXT,"
              "${DatabaseConstant.columnImage} TEXT,"
              "${DatabaseConstant.columnStatus} TEXT,"
              "${DatabaseConstant.columnCreated} TEXT,"
              "${DatabaseConstant.columnUpdated} TEXT"
              ")";
          await db.execute(sql);
        },
        onOpen: (Database db) async {
          print("Database version: ${await db.getVersion()}");
        },
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future closeDb() async {
    database?.close();
  }
}
