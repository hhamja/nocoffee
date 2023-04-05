import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nocoffee/src/config/constant/app_name.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nocoffee/src/config/router/app_router.gr.dart';
import 'package:nocoffee/src/config/theme/app_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko');
  await Hive.initFlutter();

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: AppThemeData.appTheme,
    );
  }
}
