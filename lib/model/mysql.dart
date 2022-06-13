import 'package:mysql1/mysql1.dart';

class MySql {
  static String host = "localhost",
      user = "root",
      password = "8883121575Pp@",
      db = "railway";
  static int port = 3306;

  static Future<void> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    var conn = await MySqlConnection.connect(settings);
    var a = conn.query("SELECT * FROM train");
    print(a);
    await conn.close();
  }
}
