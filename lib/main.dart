import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nocoffee/src/config/constant/app_name.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nocoffee/src/config/router/app_router.gr.dart';
import 'package:nocoffee/src/config/theme/app_theme.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko');
  await Hive.initFlutter();
  Hive.registerAdapter<CoffeeDataModel>(CoffeeDataModelAdapter());
  await Hive.openBox<CoffeeDataModel>("coffee");

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter appRouter = AppRouter();

  @override
  void dispose() {
    // 앱 종료 시 Hive 닫기
    Hive.close();
    super.dispose();
  }

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
