import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navigation_task/Cache/cache.dart';
import 'package:navigation_task/screens/home_screen.dart';

class MyEditProfileWidget extends StatefulWidget {
  const MyEditProfileWidget({super.key});

  @override
  State<MyEditProfileWidget> createState() => _MyEditProfileWidgetState();
}

class _MyEditProfileWidgetState extends State<MyEditProfileWidget> {
  Map<String, dynamic> user = CacheData.getMapData(key: "user");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  "assets/svg/back.svg",
                  height: 18,
                ),
              ),
              const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: 28,
                ),
              ),
              SvgPicture.asset(
                "assets/svg/nav_bar_add.svg",
                height: 30,
                // ignore: deprecated_member_use
                color: const Color.fromRGBO(33, 40, 50, 1),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 155,
                    height: 155,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(254, 211, 106, 1),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: getRandomImage(),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 13,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(33, 40, 50, 1),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/svg/nav_bar_add.svg",
                          height: 20,
                          // ignore: deprecated_member_use
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Card(
              child: Container(
                width: double.infinity,
                height: 60,
                color: const Color.fromRGBO(69, 90, 100, 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/user.svg",
                        height: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      const Spacer(),
                      Text(
                        user["name"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(flex: 8),
                      SvgPicture.asset(
                        "assets/svg/edit.svg",
                        height: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Card(
              child: Container(
                width: double.infinity,
                height: 60,
                color: const Color.fromRGBO(69, 90, 100, 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/usertag.svg",
                        height: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      const Spacer(),
                      Text(
                        user["email"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(flex: 4),
                      SvgPicture.asset(
                        "assets/svg/edit.svg",
                        height: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Card(
              child: Container(
                width: double.infinity,
                height: 60,
                color: const Color.fromRGBO(69, 90, 100, 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/password.svg",
                        height: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      const Spacer(),
                      const Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(flex: 10),
                      SvgPicture.asset(
                        "assets/svg/edit.svg",
                        height: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Card(
              child: Container(
                width: double.infinity,
                height: 60,
                color: const Color.fromRGBO(69, 90, 100, 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/todolist.svg",
                        height: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      const Spacer(),
                      const Text(
                        "My Tasks",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(flex: 8),
                      SvgPicture.asset(
                        "assets/svg/list.svg",
                        height: 12,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Card(
              child: Container(
                width: double.infinity,
                height: 60,
                color: const Color.fromRGBO(69, 90, 100, 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/privacy.svg",
                        height: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      const Spacer(),
                      const Text(
                        "Privacy",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(flex: 10),
                      SvgPicture.asset(
                        "assets/svg/list.svg",
                        height: 12,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Card(
              child: Container(
                width: double.infinity,
                height: 60,
                color: const Color.fromRGBO(69, 90, 100, 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/setting.svg",
                        height: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      const Spacer(),
                      const Text(
                        "Settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(flex: 11),
                      SvgPicture.asset(
                        "assets/svg/list.svg",
                        height: 12,
                        // ignore: deprecated_member_use
                        color: const Color.fromRGBO(140, 170, 185, 1),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
            InkWell(
              onTap: () {
                CacheData.clearData(clearData: true);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/login",
                  (route) => false,
                );
              },
              child: Card(
                child: Container(
                  width: double.infinity,
                  height: 60,
                  color: const Color.fromRGBO(254, 211, 106, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/logout.svg",
                        // ignore: deprecated_member_use
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
