import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:navigation_task/Cache/cache.dart';

import '../tasks_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
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

class _MyWidgetState extends State<MyWidget> {
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
  Future<void> _handleRefresh() async {}

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? user = CacheData.getMapData(key: "user");
    String? token = CacheData.getData(key: "token");
    log(user["name"] ?? "No user");
    log(token ?? "No token");
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        height: 400,
        color: const Color.fromRGBO(254, 211, 106, 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: Color.fromRGBO(254, 211, 106, 1),
                            fontSize: 18),
                      ),
                      Text(
                        user["name"] ?? "No User",
                        style: const TextStyle(
                            fontFamily: "Pilat Extended",
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/editProfile");
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: persons[7],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Completed Tasks",
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => log("message"),
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: Color.fromRGBO(254, 211, 106, 1),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 200,
                      color: index == 0
                          ? const Color.fromRGBO(254, 211, 106, 1)
                          : const Color.fromRGBO(69, 90, 100, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 100,
                            child: Text(
                              projectsList[index].title,
                              style: TextStyle(
                                  fontFamily: "Pilat Extended",
                                  color:
                                      index == 0 ? Colors.black : Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Team Members",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    color: index == 0
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              SizedBox(
                                width: 70,
                                height: 20,
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    for (var i = 0;
                                        i < int.parse(projectsList[index].team);
                                        i++)
                                      Positioned(
                                        right: i * 16,
                                        top: 0,
                                        child: CircleAvatar(
                                          // backgroundColor: colors[i],
                                          radius: 10,
                                          backgroundImage: getRandomImage(),
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Complete",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: index == 0
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "${projectsList[index].progress}%",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        color: index == 0
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              LinearProgressIndicator(
                                value:
                                    double.parse(projectsList[index].progress),
                                backgroundColor: Colors.white,
                                color: index == 0 ? Colors.black : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                minHeight: 8,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: projectsList.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Ongoing Projects",
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => log("message"),
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: Color.fromRGBO(254, 211, 106, 1),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              // height: 450,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 6),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            arguments: uncompletedProjectsList[index],
                            '/ongoingProject');
                      },
                      child: Card(
                        child: ListTile(
                          minVerticalPadding: 15,
                          tileColor: const Color.fromRGBO(69, 90, 100, 1),
                          title: Text(
                            uncompletedProjectsList[index].title,
                            style: const TextStyle(
                                fontFamily: "Pilat Extended",
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Team Members",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 70,
                                    height: 20,
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        for (var i = 0;
                                            i <
                                                int.parse(
                                                    uncompletedProjectsList[
                                                            index]
                                                        .team);
                                            i++)
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
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Due On : ${random.integer(30)} ${uncompletedProjectsList[index].date}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: CircularProgressIndicator(
                                      color: const Color.fromRGBO(
                                          254, 211, 106, 1),
                                      value: int.parse(
                                              uncompletedProjectsList[index]
                                                  .progress) /
                                          100,
                                    ),
                                  ),
                                  Text(
                                    "${uncompletedProjectsList[index].progress}%",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "Inter",
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          minTileHeight: 140,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: uncompletedProjectsList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
