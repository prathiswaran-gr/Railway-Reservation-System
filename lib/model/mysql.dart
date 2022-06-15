import 'package:mysql1/mysql1.dart';

class MySql {
  static String host = "",
      user = "root",
      password = "",
      db = "rrs";
  static int port = 3306;
  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    var conn = await MySqlConnection.connect(settings);
    await Future.delayed(Duration(seconds: 2));
    return conn;
  }
}
