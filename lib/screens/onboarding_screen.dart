import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyLandingPage extends StatelessWidget {
  const MyLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Column(
                children: [
                  SvgPicture.asset("assets/svg/logo.svg"),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Day",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Pilat Extended",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Task",
                        style: TextStyle(
                          color: Color.fromRGBO(254, 211, 106, 1),
                          fontSize: 20,
                          fontFamily: "Pilat Extended",
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.white,
                  width: 400,
                  height: 350,
                ),
                SvgPicture.asset("assets/svg/onboarding.svg"),
              ],
            ),
            const Spacer(
              flex: 3,
            ),
            const Text(
              "Manage\nyour\nTask with",
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.w900,
                fontFamily: "Pilat Extended",
                height: 1.1,
              ),
            ),
            const Text(
              "DayTask",
              style: TextStyle(
                color: Color.fromRGBO(254, 211, 106, 1),
                fontSize: 55,
                fontWeight: FontWeight.w900,
                fontFamily: "Pilat Extended",
                height: 1.1,
              ),
            ),
            const Spacer(
              flex: 6,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/login");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(254, 211, 106, 1),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 70),
                shape: const BeveledRectangleBorder(),
              ),
              child: const Text(
                "Let's Start",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
