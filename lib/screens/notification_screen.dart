import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:navigation_task/screens/home_screen.dart';

class MyNotificationWidget extends StatelessWidget {
  const MyNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontSize: 28,
          ),
        ),
        backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "New",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Inter", fontSize: 24),
              ),
              SizedBox(
                height: 330,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: getRandomImage(),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 270,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      Faker().person.name(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Expanded(
                                      child: Text(
                                        " left a comment in task",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(140, 170, 185, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Mobile App Design Project",
                                  style: TextStyle(
                                    color: Color.fromRGBO(254, 211, 106, 1),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Text(
                            "31 min",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 4,
                ),
              ),
              const Text(
                "Earlier",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Inter", fontSize: 24),
              ),
              SizedBox(
                height: 330,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 4),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: getRandomImage(),
                          ),
                          const Spacer(),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 270,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      Faker().person.name(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Expanded(
                                      child: Text(
                                        " left a comment in task",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(140, 170, 185, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                "Mobile App Design Project",
                                style: TextStyle(
                                  color: Color.fromRGBO(254, 211, 106, 1),
                                ),
                              )
                            ],
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          const Text(
                            "31 min",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
