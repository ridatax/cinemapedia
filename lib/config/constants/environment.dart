import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String APP_NAME = 'Cinemapedia';
  static String EMPTY = '';
  static String theMovieDbUrl = dotenv.env['THE_MOVIEDB_URL'] ?? "Don't exist url moviedb";
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? "Don't exist api key moviedb";
  static String languague = dotenv.env['LANGUAGUE'] ?? "es-MX";
  static int ZERO = 0;
  static int ONE = 1;
  static int TWO = 2;
  static int THREE = 3;
  static int FOUR = 4;
  static int FIVE = 5;
  static int SIX = 6;
  static int SEVEN = 7;
  static int EIGHT = 8;
  static int NINE = 9;
  static int TEN = 10;

}