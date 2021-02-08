import 'dart:async';
import 'dart:io';

import 'package:birth_days_app/src/data/dto/person_data_dto.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'dto/event_data_dto.dart';
import 'dto/group_data_dto.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "BirthDaysData.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onConfigure: onConfigure,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Person ("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "name TEXT,"
              "group_id INTEGER"
              ")");
          await db.execute("CREATE TABLE PersonGroup ("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "name TEXT"
              ")");
          await db.execute("CREATE TABLE PersonEvent ("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "name TEXT,"
              "type INTEGER,"
              "date INTEGER,"
              "person_id INTEGER, "
              //"CONSTRAINT fk_column "
              "FOREIGN KEY (person_id) "
              "REFERENCES Person(id) "
              "ON DELETE CASCADE"
              ")");
        });

    //"CONSTRAINT Person"
    //    "FOREIGN KEY (id)"
    //    "REFERENCES departments(person_id)"
    //    "ON DELETE CASCADE"

  }

  addPerson(PersonDataDTO newPerson) async {
    final db = await database;

    Map<String, dynamic> values = {
      "name"  : newPerson.name,
      "group_id"  : newPerson.groupId,
    };
    var result = await db.insert("Person", values);
    return result;
  }

  addEvent(EventDataDTO newEvent) async {
    final db = await database;

    Map<String, dynamic> values = {
      "name"  : newEvent.name,
      "type"  : newEvent.eventType,
      "date"  : newEvent.date.millisecondsSinceEpoch,
      "person_id"  : newEvent.personId
    };

    var result = await db.insert("PersonEvent", values);
    return result;
  }

  addGroup(GroupDataDTO newGroup) async {
    final db = await database;

    Map<String, dynamic> values = {
      "name"  : newGroup.name
    };

    var result = await db.insert("PersonGroup", values);
    return result;
  }

  updatePerson(PersonDataDTO updatedPerson) async {
    final db = await database;
    var res = await db.update("Person", updatedPerson.toMap(),
        where: "id = ?", whereArgs: [updatedPerson.id]);
    return res;
  }

  getPersonById(int id) async {
    final db = await database;
    var res = await db.query("Person", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? PersonDataDTO.fromMap(res.first) : null;
  }

  getEventById(int id) async {
    final db = await database;
    var res = await db.query("PersonEvent", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? PersonDataDTO.fromMap(res.first) : null;
  }

  Future<List<EventDataDTO>> getEventsByPersonId(int id) async {
    //TODO doesnt work
    final db = await database;
    var res = await db.query("PersonEvent", where: "person_id = ?", whereArgs: [id]);
    List<EventDataDTO> list =
    res.isNotEmpty ? res.map((c) => EventDataDTO.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<PersonDataDTO>> getAllPersons() async {
    final db = await database;
    var res = await db.query("Person");
    List<PersonDataDTO> list =
    res.isNotEmpty ? res.map((c) => PersonDataDTO.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<PersonDataDTO>> getPersonByFilter([String name,int groupId]) async {
    final db = await database;
    var res = await db.query("Person",where: "name COLLATE UTF8_GENERAL_CI LIKE ?",whereArgs: ['%$name']);
    List<PersonDataDTO> list =
    res.isNotEmpty ? res.map((c) => PersonDataDTO.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<EventDataDTO>> getAllEvents() async {
    final db = await database;
    var res = await db.query("PersonEvent");
    List<EventDataDTO> list =
    res.isNotEmpty ? res.map((c) =>
        EventDataDTO.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<GroupDataDTO>> getAllGroups() async {
    final db = await database;
    var res = await db.query("PersonGroup");
    List<GroupDataDTO> list =
    res.isNotEmpty ? res.map((c) => GroupDataDTO.fromMap(c)).toList() : [];
    return list;
  }

  deletePerson(int id) async {
    final db = await database;
    return db.delete("Person", where: "id = ?", whereArgs: [id]);
  }

  deletePersonEvent(int id) async {
    final db = await database;
    return db.delete("PersonEvent", where: "id = ?", whereArgs: [id]);
  }

  /*deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }*/
}
