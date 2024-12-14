import 'package:flutter/material.dart';
import 'package:navigation_task/screens/edit_profile_screen.dart';
import 'package:navigation_task/screens/login_screen.dart';
import 'package:navigation_task/screens/onboarding_screen.dart';
import 'package:navigation_task/screens/ongoing_project_screen.dart';
import 'package:navigation_task/screens/signup_screen.dart';

import 'Cache/cache.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheDataInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? user = CacheData.getMapData(key: "user");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: user != null ? "/home" : "/",
      routes: {
        "/": (context) => const MyLandingPage(),
        "/login": (context) => const MyLoginWidget(),
        "/signup": (context) => const MySignupWidget(),
        "/home": (context) => const HomePageState(),
        "/ongoingProject": (context) => const OngoingProjectWidget(),
        "/editProfile": (context) => const MyEditProfileWidget(),
      },
    );
  }
}
