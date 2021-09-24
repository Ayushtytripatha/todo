import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/Presentation/screens/home_screen.dart';
import 'package:todo/on_generate_route.dart';
import 'features/Presentation/cubit/task_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  // await sl.init();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
      create: (_) => di.sl<TaskCubit>()
        ..opendatabase()
        ..initNotification(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
      ),
    );
  }
}
