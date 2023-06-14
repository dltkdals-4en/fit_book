import 'package:firebase_core/firebase_core.dart';
import 'package:fit_book/providers/login_provider.dart';
import 'package:fit_book/providers/server_data_provider.dart';
import 'package:fit_book/routes/route_generator.dart';
import 'package:fit_book/routes/routes.dart';
import 'package:fit_book/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/home_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<ServerDataProvider>(
            create: (_) => ServerDataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit Book',
      initialRoute: Routes.login,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        scaffoldBackgroundColor: KColors.white,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
