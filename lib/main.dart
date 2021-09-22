import 'package:flutter/material.dart';
import 'package:todo/features/Presentation/screens/home_screen.dart';
import 'package:todo/on_generate_route.dart';
import 'injection_container.dart' as sl;

void main() async {
  // await sl.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY Daily Task',
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
      onGenerateRoute: OnGenerateRoute.route,
      routes: {
        "/": (context) {
          return HomeScreen();
        }
      },
    );
  }
}
