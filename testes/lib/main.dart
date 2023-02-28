import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testes/views/all_pages.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Blogs';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.pink.shade200,
        scaffoldBackgroundColor: Colors.pink.shade600,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0
        )
      ),
      home: const AllPages(),
    );
  }
}

