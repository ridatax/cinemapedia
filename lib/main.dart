import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/config/router/app.router.dart';
import 'package:cinemapedia/config/theme/app.theme.dart';

Future<void> main() async {
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await dotenv.load(fileName: '.env');
  initializeDateFormatting(Environment.LANGUAGUE);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: Environment.APP_NAME,
      theme: AppTheme().getTheme(),
    );
  }
}
