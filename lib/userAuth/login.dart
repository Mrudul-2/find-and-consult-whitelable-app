
import 'package:flutter/material.dart';
import 'package:whitelabel/userAuth/home.dart';
import 'package:whitelabel/userAuth/register.dart';

import '../color.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool showPass = false;
  bool isLoading = false;
  bool emailValid = false;
  late String email;
  late String pass;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : Scaffold(
        body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xff121212),
              image: DecorationImage(
                image: AssetImage("assets/images/Bg.png"),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 34.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text("Welcome back,",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitasse id orci facilisi nulla scelerisque. Nisl ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          color: HexColor.fromHex("#F7FCFF")),
                      child: Form(
                        key: _key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              'Email',
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                onChanged: (val) {
                                  setState(() {
                                    emailValid = RegExp(
                                        r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val);
                                  });
                                },
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Email is required";
                                  } else if (!emailValid) {
                                    return "Email is not valid";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  email = val.toString();
                                },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    fontFamily: "Plus Jakarta Sans",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                      emailValid ? Icons.check : Icons.close),
                                  suffixIconColor: emailValid
                                      ? const Color.fromARGB(255, 52, 163, 83)
                                      : Colors.red[300],
                                  hintText: "your email",
                                  hintStyle: const TextStyle(
                                      color: Color.fromARGB(80, 44, 44, 1),
                                      fontFamily: "Plus Jakarta Sans",
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          width: 0.88,
                                          color:
                                          HexColor.fromHex("#E1E1E1"))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          width: 0.88,
                                          color:
                                          HexColor.fromHex("#E1E1E1"))),
                                )),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              'Password',
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                onSaved: (val) {
                                  pass = val.toString();
                                },
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Password is required";
                                  }
                                  return null;
                                },
                                obscureText: !showPass,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(
                                    fontFamily: "Plus Jakarta Sans",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  suffixIconColor:
                                  HexColor.fromHex('#4280EF'),
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        showPass = !showPass;
                                      });
                                    },
                                    icon: showPass
                                        ? const Icon(
                                        Icons.visibility_outlined)
                                        : const Icon(
                                        Icons.visibility_off_outlined),
                                  ),
                                  hintText: "your password",
                                  hintStyle: const TextStyle(
                                      color: Color.fromARGB(80, 44, 44, 1),
                                      fontFamily: "Plus Jakarta Sans",
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          width: 0.88,
                                          color:
                                          HexColor.fromHex("#E1E1E1"))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          width: 0.88,
                                          color:
                                          HexColor.fromHex("#E1E1E1"))),
                                )),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontFamily: "Plus Jakarta Sans",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor.fromHex("#FF5757")),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.9,
                                    child: TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15.0),
                                            ),
                                          ),
                                          minimumSize:
                                          MaterialStateProperty.all<Size>(
                                              const Size(
                                                  double.infinity, 50.0)),
                                          padding: MaterialStateProperty.all(
                                            const EdgeInsets.fromLTRB(
                                                0, 15.0, 0, 15.0),
                                          ),
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black)),
                                      child: const Text(
                                        "Sign In",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.9,
                                    child: TextButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: HexColor.fromHex(
                                                        "#4280EF")),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    15.0),
                                              ),
                                            ),
                                            minimumSize: MaterialStateProperty
                                                .all<Size>(const Size(
                                                double.infinity, 50.0)),
                                            padding:
                                            MaterialStateProperty.all(
                                              const EdgeInsets.fromLTRB(
                                                  0, 15.0, 0, 15.0),
                                            ),
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            const Image(
                                              image: AssetImage(
                                                  'assets/images/g.png'),
                                              height: 30.0,
                                              width: 30.0,
                                              fit: BoxFit.contain,
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text('Sign in with Google',
                                                style: TextStyle(
                                                    fontFamily:
                                                    "Plus Jakarta Sans",
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    color: HexColor.fromHex(
                                                        "#4280EF")))
                                          ],
                                        ),
                                        onPressed: () async {
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            // remove this button if platform is not ios
                            // (!Platform.isIOS)
                            //     ? const SizedBox()
                            //     : Row(
                            //   mainAxisAlignment:
                            //   MainAxisAlignment.center,
                            //   children: [
                            //     Flexible(
                            //       child: SizedBox(
                            //         width: MediaQuery.of(context)
                            //             .size
                            //             .width *
                            //             0.9,
                            //         child: TextButton(
                            //           style: ButtonStyle(
                            //               shape:
                            //               MaterialStateProperty.all(
                            //                 RoundedRectangleBorder(
                            //                   side: const BorderSide(
                            //                       color: Colors.black),
                            //                   borderRadius:
                            //                   BorderRadius.circular(
                            //                       15.0),
                            //                 ),
                            //               ),
                            //               fixedSize:
                            //               MaterialStateProperty.all(
                            //                   const Size.fromWidth(
                            //                       double.infinity)),
                            //               padding:
                            //               MaterialStateProperty.all(
                            //                 const EdgeInsets.fromLTRB(
                            //                     0, 15.0, 0, 15.0),
                            //               ),
                            //               backgroundColor:
                            //               MaterialStateProperty.all(
                            //                   Colors.white)),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //             MainAxisAlignment.center,
                            //             children: [
                            //               const Image(
                            //                 image: AssetImage(
                            //                     'assets/images/a.png'),
                            //                 height: 20.0,
                            //                 width: 20.0,
                            //               ),
                            //               const SizedBox(
                            //                 width: 10.0,
                            //               ),
                            //               Text('Sign in with Apple',
                            //                   style: TextStyle(
                            //                       fontFamily:
                            //                       "Plus Jakarta Sans",
                            //                       fontSize: 15.0,
                            //                       fontWeight:
                            //                       FontWeight.w500,
                            //                       color:
                            //                       HexColor.fromHex(
                            //                           "#4280EF")))
                            //             ],
                            //           ),
                            //           onPressed: () async {
                            //           },
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Flexible(
                                   child: Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: FCColors.black
                                    ),
                                ),
                                 ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>registerScreen()));
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor.fromHex("#4178D4")),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
