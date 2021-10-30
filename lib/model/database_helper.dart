import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseHelper {
  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;

  static final _tableName = 'Reports';

  static final columnId = 'id';
  static final creationDate = 'date';
  static final totalAmount = 'totalAmount';
  static final ntwoThousand = 'ntwoThousand';
  static final nfiveHundred = 'nfiveHundred';
  static final ntwoHundred = 'ntwoHundred';
  static final nhundred = 'nhundred';
  static final nfifty = 'nfifty';
  static final ntwenty = 'ntwenty';
  static final nten = 'nten';
  static final nfive = 'nfive';

  static final cten = 'cten';
  static final cfive = 'cfive';
  static final ctwo = 'ctwo';
  static final cone = 'cone';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  bool hasData() {
    if (_database != null)
      return true;
    else
      return false;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_tableName ( 
      $columnId INTEGER PRIMARY KEY,
      $creationDate TEXT NOT NULL,
      $totalAmount INTGER DEFAULT 0,
      $ntwoThousand INTEGER DEFAULT 0,
       $nfiveHundred INTEGER DEFAULT 0,
        $ntwoHundred INTEGER DEFAULT 0,
         $nhundred INTEGER DEFAULT 0,
          $nfifty INTEGER DEFAULT 0,
           $ntwenty INTEGER DEFAULT 0,
            $nten INTEGER DEFAULT 0,
             $nfive INTEGER DEFAULT 0,
              $cten INTEGER DEFAULT 0,
               $cfive INTEGER DEFAULT 0,
                $ctwo INTEGER DEFAULT 0,
                 $cone INTEGER DEFAULT 0)
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId=?', whereArgs: [id]);
  }
}
