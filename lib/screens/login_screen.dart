import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navigation_task/Cache/cache.dart';

import '../http.dart';

class MyLoginWidget extends StatefulWidget {
  const MyLoginWidget({super.key});
  @override
  State<MyLoginWidget> createState() => _MyLoginWidgetState();
}

class _MyLoginWidgetState extends State<MyLoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  String? _email;
  String? _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 40, 50, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
              ),
              child: Center(child: SvgPicture.asset("assets/svg/logo.svg")),
            ),
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
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Email Address",
                      style: TextStyle(
                        color: Color.fromRGBO(140, 170, 185, 1),
                        fontFamily: "Inter",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onSaved: (newValue) => _email = newValue,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter a Valid Email";
                        }
                        if (!value.contains("@")) {
                          return "Please Enter a Valid Email";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        // prefix: SvgPicture.asset("assets/svg/password2.svg"),
                        // contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: SvgPicture.asset(
                            "assets/svg/email.svg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(15),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 30,
                          minHeight: 30,
                        ),
                        prefixIconColor: Colors.white,
                        hintText: "Enter Your Email Address",

                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color.fromRGBO(69, 90, 100, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                        color: Color.fromRGBO(140, 170, 185, 1),
                        fontFamily: "Inter",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onSaved: (newValue) => _password = newValue,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter a Valid Password";
                        }
                        return null;
                      },
                      obscureText: _showPassword,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: SvgPicture.asset(
                            "assets/svg/password2.svg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(15),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 30,
                          minHeight: 30,
                        ),
                        prefixIconColor: Colors.white,
                        hintText: "Enter Your Password",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color.fromRGBO(69, 90, 100, 1),
                        suffixIcon: IconButton(
                          icon: _showPassword
                              ? SvgPicture.asset("assets/svg/showpassword.svg")
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.white,
                                ),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              log("message");
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color.fromRGBO(140, 170, 185, 1),
                                fontSize: 16,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // api
                          Response res = await WebService.loginRequest(
                            email: _email,
                            password: _password,
                          );
                          if (res.statusCode == 200) {
                            await CacheData.setMapData(
                                key: "user", value: res.data["user"]);
                            await CacheData.setData(
                                key: "token", value: res.data["token"]);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(context, "/home");
                          } else if (res.statusCode == 404) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(
                                  child: Text(
                                    res.data,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.red.withOpacity(0.7),
                                shape: const RoundedRectangleBorder(),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Center(
                                  child: Text(
                                    "Something Went Wrong, Please Try Again Later",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.red.withOpacity(0.7),
                                shape: const RoundedRectangleBorder(),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        color: const Color.fromRGBO(254, 211, 106, 1),
                        child: const Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color.fromRGBO(140, 170, 185, 1),
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            "Or continue with",
                            style: TextStyle(
                              color: Color.fromRGBO(140, 170, 185, 1),
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color.fromRGBO(140, 170, 185, 1),
                              indent: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        log("message");
                      },
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/google.svg"),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Google",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Inter",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                  color: Color.fromRGBO(140, 170, 185, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter",
                                ),
                              ),
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: Color.fromRGBO(254, 211, 106, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
