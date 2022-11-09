// ignore_for_file: public_member_api_docs, sort_constructors_first
class DatabaseConnectionConfiguration {
  final String host;
  final String user;
  final String password;
  final String databaseName;
  final int port;
  DatabaseConnectionConfiguration({
    required this.host,
    required this.user,
    required this.password,
    required this.databaseName,
    required this.port,
  });
}
