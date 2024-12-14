import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navigation_task/http.dart';

class MySignupWidget extends StatefulWidget {
  const MySignupWidget({super.key});

  @override
  State<MySignupWidget> createState() => _MySignupWidgetState();
}

class _MySignupWidgetState extends State<MySignupWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  String? _name;
  String? _email;
  String? _password;
  bool _agreed = false;
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
                      "Create your account",
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
                      "Full Name",
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
                      onSaved: (newValue) => _name = newValue,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter a Valid Name";
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
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: SvgPicture.asset(
                            "assets/svg/name.svg",
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
                        hintText: "Enter Your Full Name",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color.fromRGBO(69, 90, 100, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Checkbox(
                            value: _agreed,
                            fillColor: WidgetStateProperty.all(
                                const Color.fromRGBO(33, 40, 50, 1)),
                            checkColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _agreed = value!;
                              });
                            },
                          ),
                          SizedBox(
                            width: 300,
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I have read & agreed to DayTask ",
                                    style: TextStyle(
                                      color: Color.fromRGBO(140, 170, 185, 1),
                                      fontSize: 14,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy, Terms & Condition",
                                    style: TextStyle(
                                      color: Color.fromRGBO(254, 211, 106, 1),
                                      fontSize: 14,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   "I have read & agreed to DayTask Privacy Policy, Terms & Condition",
                    //   style: TextStyle(
                    //     color: Color.fromRGBO(140, 170, 185, 1),
                    //     fontSize: 14,
                    //     fontFamily: "Inter",
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          if (!_agreed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Center(
                                  child: Text(
                                    "Please Agree on Terms",
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
                            return;
                          }
                          
                          _formKey.currentState!.save();
                          Response res = await WebService.signupRequest(
                              name: _name, email: _email, password: _password);
                          if (res.statusCode == 201) {
                            showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (context) => Dialog(
                                backgroundColor: Colors.green[100],
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "You're Account Was Made Successfully.",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Login Now!",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.popUntil(
                                          context,
                                          (route) => route.isFirst,
                                        );
                                      },
                                      child: const Text(
                                        "Confirm",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else if (res.statusCode == 400) {
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
                                    "Something Went Wrong, Please Try Again Later...",
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
                            "Sign Up",
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
                      height: 10,
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
                      height: 10,
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
                          Navigator.pushNamed(context, "/login");
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                  color: Color.fromRGBO(140, 170, 185, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter",
                                ),
                              ),
                              TextSpan(
                                text: "Log In",
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
