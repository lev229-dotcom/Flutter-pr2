import 'dart:io';
import 'package:flutter_application_1/common/data_base_request.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../data/model/role.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database database;
  final int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'carshop.db');
    

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {

    sqfliteFfiInit();
       var db = await databaseFactoryFfi.openDatabase(_pathDB, options: OpenDatabaseOptions(
        version: _version,
        onUpgrade: (db,oldVersion,newVersion)=> onUpdateTable(db),
        
        onCreate: (db, version) async {
        await onCreateTable(db);
      }
        
        ));
       
    } 
    else {
      database = await openDatabase(_pathDB, version: _version,
      
      onUpgrade:(db,oldVersion,newVersion)=> onUpdateTable(db),
    
          onCreate: (db, version) async {
        await onCreateTable(db);
      });
    }
    
  }

  Future<void> onCreateTable(Database db) async {

    for (var i=0; i< DataBaseRequest.tableList.length;i++)
    {
      await db.execute(DataBaseRequest.tableCreateList[i]);
    }
    await onInitTable(db); 
     }

  Future<void> onInitTable (Database db) async{
    try
    {
      db.insert(DataBaseRequest.tableRole, Role(role:'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(role:'Пользователь').toMap());
      

    }
     on DatabaseException catch(e)
    {

    }
  }
  
Future<void>  onUpdateTable(Database db)async {

var tables=await db.rawQuery('Select name FROM sqlite_master');
for (var table in DataBaseRequest.tableList)
{
  if (tables.contains(table))
  {
    await db.execute(DataBaseRequest.deleteTable(table));
  }
}
for (var i=0; i< DataBaseRequest.tableList.length;i++)
    {
      await db.execute(DataBaseRequest.tableCreateList[i]);
    }
}



}
