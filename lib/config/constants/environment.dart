import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String EMPTY = '';
  static String theMovieDbUrl = dotenv.env['THE_MOVIEDB_URL'] ?? "Don't exist url moviedb";
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? "Don't exist api key moviedb";
  static String languague = dotenv.env['LANGUAGUE'] ?? "es-MX";
}