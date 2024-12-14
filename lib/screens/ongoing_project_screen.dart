import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navigation_task/tasks_model.dart';

import 'home_screen.dart';

class OngoingProjectWidget extends StatefulWidget {
  const OngoingProjectWidget({super.key});

  @override
  State<OngoingProjectWidget> createState() => _OngoingProjectWidgetState();
}

class _OngoingProjectWidgetState extends State<OngoingProjectWidget> {
  Map<int, Color> colors = {
    1: Colors.black,
    2: Colors.cyan,
    3: Colors.purple,
    4: Colors.green,
    5: Colors.pink
  };
  @override
  Widget build(BuildContext context) {
    final ProjectModel args =
        ModalRoute.of(context)!.settings.arguments as ProjectModel;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/svg/back.svg",
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
          centerTitle: true,
          foregroundColor: Colors.white,
          title: const Text("Task Details"),
          titleTextStyle:
              const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: IconButton(
                icon: const Icon(Icons.edit),
                iconSize: 30,
                onPressed: () => log("message"),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                args.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: const Color.fromRGBO(254, 211, 106, 1),
                          ),
                          const Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.black,
                            size: 40,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Due Date",
                              style: TextStyle(
                                  color: Color.fromRGBO(140, 170, 185, 1)),
                            ),
                            Text(
                              "${random.integer(30, min: 1)} ${args.date}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: const Color.fromRGBO(254, 211, 106, 1),
                          ),
                          const Icon(
                            Icons.person_2,
                            color: Colors.black,
                            size: 40,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Project Team",
                              style: TextStyle(
                                  color: Color.fromRGBO(140, 170, 185, 1)),
                            ),
                            SizedBox(
                              width: 70,
                              height: 20,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  for (var i = 0; i < int.parse(args.team); i++)
                                    Positioned(
                                      left: i * 16,
                                      top: 0,
                                      child: CircleAvatar(
                                        // backgroundColor: colors[i],
                                        radius: 10,
                                        backgroundImage: getRandomImage(),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Project Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                args.details,
                style: const TextStyle(
                  color: Color.fromRGBO(188, 207, 216, 1),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Project Progress",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          color: const Color.fromRGBO(254, 211, 106, 1),
                          value: int.parse(args.progress) / 100,
                        ),
                      ),
                      Text(
                        "${args.progress}%",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "All Tasks",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Card(
                        child: ListTile(
                          minTileHeight: 65,
                          title: Text(
                            args.tasks[index].taskName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          tileColor: const Color.fromRGBO(69, 90, 100, 1),
                          contentPadding:
                              const EdgeInsets.only(left: 20, right: 10),
                          trailing: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                color: const Color.fromRGBO(254, 211, 106, 1),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      args.tasks[index].isDone =
                                          !args.tasks[index].isDone;
                                    });
                                  },
                                  icon: Icon(
                                    args.tasks[index].isDone
                                        ? Icons.check_circle_outline_outlined
                                        : Icons.circle_outlined,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: args.tasks.length,
                ),
              )
            ],
          ),
        ));
  }
}
