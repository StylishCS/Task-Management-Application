import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data.dart';

class MyScheduleScreen extends StatefulWidget {
  const MyScheduleScreen({super.key});

  @override
  State<MyScheduleScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyScheduleScreen> {
  late DateTime now;
  final novemberDays = List.generate(30, (index) {
    final date = DateTime(2023, 11, index + 1); // Example year 2023
    return {
      'dayNumber': index + 1,
      'dayName': getShortDayName(date.weekday),
    };
  });
  late List<Map<String, String>> todaysTasks;
  @override
  void initState() {
    now = DateTime.now();
    todaysTasks = tasksPerDay[now.day + 1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Schedule",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontSize: 28,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/svg/nav_bar_add.svg",
                height: 30,
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
      ),
      backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "November",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: novemberDays[index]["dayNumber"] == now.day
                          ? const Color.fromRGBO(254, 211, 106, 1)
                          : const Color.fromRGBO(39, 50, 56, 1),
                      width: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            novemberDays[index]["dayNumber"].toString(),
                            style: TextStyle(
                                color:
                                    novemberDays[index]["dayNumber"] == now.day
                                        ? Colors.black
                                        : Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            novemberDays[index]["dayName"].toString(),
                            style: TextStyle(
                                color:
                                    novemberDays[index]["dayNumber"] == now.day
                                        ? Colors.black
                                        : Colors.white,
                                fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: novemberDays.length,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                "Today's Tasks",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: GlobalKey(),
                    onDismissed: (direction) {
                      todaysTasks.removeAt(index);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        shape:
                            index == 0 ? null : const BeveledRectangleBorder(),
                        color: index == 0
                            ? const Color.fromRGBO(254, 211, 106, 1)
                            : const Color.fromRGBO(39, 50, 56, 1),
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                            todaysTasks[index]["title"].toString(),
                            style: TextStyle(
                                color: index == 0 ? Colors.black : Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "${todaysTasks[index]["startTime"]} - ${todaysTasks[index]["endTime"]}",
                            style: TextStyle(
                                color: index == 0 ? Colors.black : Colors.white,
                                fontSize: 18),
                          ),
                          // tileColor:
                          horizontalTitleGap: 10,
                          visualDensity: const VisualDensity(vertical: 4),
                          leading: index == 0
                              ? null
                              : Container(
                                  width: 10,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(254, 211, 106, 1),
                                      shape: BoxShape.rectangle),
                                ),
                          contentPadding: index == 0
                              ? const EdgeInsets.symmetric(
                                  horizontal: 20,
                                )
                              : EdgeInsets.zero,
                          // trailing: Stack(
                          //   children: [
                          //     Container(
                          //       width: 20,
                          //       height: 20,
                          //       decoration: BoxDecoration(
                          //           color: Colors.black, shape: BoxShape.circle),
                          //     )
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: todaysTasks.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

String getShortDayName(int weekday) {
  switch (weekday) {
    case DateTime.monday:
      return 'Mon';
    case DateTime.tuesday:
      return 'Tue';
    case DateTime.wednesday:
      return 'Wed';
    case DateTime.thursday:
      return 'Thu';
    case DateTime.friday:
      return 'Fri';
    case DateTime.saturday:
      return 'Sat';
    case DateTime.sunday:
      return 'Sun';
    default:
      return '';
  }
}
