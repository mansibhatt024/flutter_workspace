import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Mydb
{

  late Database db;

  Future open()async
  {
    var databasesPath = await getDatabasesPath();//database path decide
    String path = join(databasesPath,'form.db');
    print(path);

     db = await openDatabase(path,version: 1,onCreate:(Database db, int version) async
    {

      await db.execute('''

                    CREATE TABLE IF NOT EXISTS students( 
                      id INTEGER PRIMARY KEY,
                      name TEXT NOT NULL,
                      surname TEXT NOT NULL,
                      email TEXT NOT NULL,
                      gender TEXT NOT NULL,
                      hobbies TEXT NOT NULL,
                      city TEXT NOT NULL,
                      password TEXT NOT NULL,
                      confirm_password TEXT NOT NULL
                    );


                      //create more table here
                  
                  ''');


      print("Table Created");
    });



  }

  Future<Map<dynamic,dynamic>?> getsinglerecord(String email)async
  {

    List<Map> maps = await db.query('students', where: 'email = ?',whereArgs: [email.toString()]);

    if (maps.length > 0)
    {
      return maps.first;
    }
    return null;

  }


}
