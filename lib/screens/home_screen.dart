import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navigation_task/screens/home_screen_widget.dart';
import 'package:navigation_task/screens/notification_screen.dart';
import 'package:navigation_task/screens/schedule_screen.dart';

import '../tasks_model.dart';

class HomePageState extends StatefulWidget {
  const HomePageState({super.key});

  @override
  State<HomePageState> createState() => _HomePageStateState();
}

final Map<int, AssetImage> persons = {
  1: const AssetImage("assets/images/Person1.png"),
  2: const AssetImage("assets/images/Person2.png"),
  3: const AssetImage("assets/images/Person3.png"),
  4: const AssetImage("assets/images/Person4.png"),
  5: const AssetImage("assets/images/Person5.png"),
  6: const AssetImage("assets/images/Person6.png"),
  7: const AssetImage("assets/images/Person7.png"),
  8: const AssetImage("assets/images/Person8.png"),
  9: const AssetImage("assets/images/Person9.png"),
  10: const AssetImage("assets/images/Person10.png"),
  11: const AssetImage("assets/images/Person11.png"),
};
AssetImage getRandomImage() {
  int randomNum = random.integer(11, min: 1);
  return persons[randomNum]!;
}

class _HomePageStateState extends State<HomePageState> {
  Map<int, Color> colors = {
    1: Colors.black,
    2: Colors.cyan,
    3: Colors.purple,
    4: Colors.green,
    5: Colors.pink
  };

  List<ProjectModel> projectsList = List<ProjectModel>.generate(
      30,
      (index) => ProjectModel(
          title: Faker().company.name(),
          date: Faker().date.month(),
          team: random.integer(5, min: 1).toString(),
          details: Faker().lorem.sentences(4).toString(),
          progress: 100.toString(),
          tasks: List.generate(
            10,
            (index) => TaskModel(taskName: Faker().job.title()),
          )));
  List<ProjectModel> uncompletedProjectsList = List<ProjectModel>.generate(
      30,
      (index) => ProjectModel(
          title: Faker().company.name(),
          date: Faker().date.month(),
          team: random.integer(5, min: 1).toString(),
          details: Faker().lorem.sentences(4).toString(),
          progress: random.integer(100).toString(),
          tasks: List.generate(
            10,
            (index) => TaskModel(taskName: Faker().job.title()),
          )));
  int _selectedIndex = 0;
  final Map<int, String> navigationPages = {
    0: "/home",
    1: "/chat",
    2: "/",
    3: "/schedule",
    4: "/notifications"
  };
  final List<String> iconsList = [
    "assets/svg/nav_bar_home.svg",
    "assets/svg/nav_bar_chat.svg",
    "assets/svg/nav_bar_calendar.svg",
    "assets/svg/nav_bar_notification.svg"
  ];
  final List<Widget> widgetList = [
    const MyWidget(),
    const MyWidget(),
    const MyScheduleScreen(),
    const MyNotificationWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(254, 211, 106, 1),
        child: SvgPicture.asset("assets/svg/nav_bar_add.svg"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 60,
        backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
        itemCount: iconsList.length,
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconsList[index],
                height: 25,
                width: 25,
                // ignore: deprecated_member_use
                color: isActive
                    ? const Color.fromRGBO(254, 211, 106, 1)
                    : const Color.fromRGBO(97, 125, 138, 1),
              ),
            ],
          );
        },
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
      body: widgetList[_selectedIndex],
    );
  }
}
