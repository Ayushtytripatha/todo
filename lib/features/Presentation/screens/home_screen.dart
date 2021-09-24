import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todo/app_const.dart';
import 'package:todo/features/Presentation/cubit/task_cubit.dart';
import 'package:todo/features/Presentation/pages/complete_task.dart';

import 'package:todo/features/Presentation/pages/home_page.dart';
import 'package:todo/features/Presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final iconList = <IconData>[
    FontAwesome.home,
    FontAwesome.tasks,
  ];

  List<Widget> get _pages => [
        HomePage(),
        CompleteTaskPage(),
      ];
  int _pagenavindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: colorC80863,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, PageConst.addNewTaskPage).then((value) {
            BlocProvider.of<TaskCubit>(context).getAllTask();
          });
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: _bottomNavBar(),
      body: _pages[_pagenavindex],
    );
  }

  Widget _bottomNavBar() {
    return AnimatedBottomNavigationBar(
      activeColor: color6FADE4,
      gapLocation: GapLocation.center,
      icons: iconList,
      activeIndex: _pagenavindex,
      onTap: (index) {
        setState(() {
          _pagenavindex = index;
        });
      },
    );
  }
}
