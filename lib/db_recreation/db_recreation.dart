import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:my_recreation/db_recreation/recreation_entity.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DBRecreation extends GetxService {
  late Database dbBase;

  Future<DBRecreation> init() async {
    await createRecreationDB();
    return this;
  }

  createRecreationDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'recreation.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createRecreationTable(db);
      print(6666666);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', 'user-00${Random().nextInt(99)}');
      await prefs.setString(DateTime.now().toIso8601String(), 'createTime');
    });
  }

  createRecreationTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS recreation (id INTEGER PRIMARY KEY, createTime TEXT, title TEXT, list TEXT)');
  }

  insertRecreation(TopicEntity entity) async {
    final id = await dbBase.insert('recreation', {
      'createTime': entity.createTime.toIso8601String(),
      'title': entity.title,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    });
    return id;
  }

  updateRecreation(TopicEntity entity) async {
    await dbBase.update(
        'recreation',
        {
          'title': entity.title,
          'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
        },
        where: 'id = ?',
        whereArgs: [entity.id]);
  }

  cleanRecreationData() async {
    await dbBase.delete('recreation');
  }

  Future<List<TopicEntity>> getAllData() async {
    var result = await dbBase.query('recreation', orderBy: 'createTime DESC');
    return result.map((e) => TopicEntity.fromJson(e)).toList();
  }
}
