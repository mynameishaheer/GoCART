import 'package:flutter/material.dart';
import 'package:gocart/MainScreen_Pages/main_page.dart';
import 'package:gocart/OnBoarding/login_page.dart';
import 'package:gocart/OnBoarding/tellusmore_page.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class signupPage extends StatefulWidget {
  signupPage({Key? key}) : super(key: key);

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenHeight * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //SizedBox(height: screenHeight * 0.1),
                  // Logo
                  Hero(
                    tag: 'logo',
                    child: logo(
                      fontSize: screenHeight * 0.06,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Login Banner
                  Hero(
                    tag: 'main text',
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 59, 59, 61),
                        fontSize: screenHeight * 0.09,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        // Email TextField
                        gocartTextField(
                          hint: "Email",
                          control: TextEditingController(),
                          textType: TextInputType.emailAddress,
                        ),
                        // Password TextField
                        gocartTextField(
                          hint: "Password",
                          control: TextEditingController(),
                          pswd: true,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // ---------- or -----------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.black54,
                              ),
                            ),
                            Text("  or  ",
                                style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontSize: screenHeight * 0.03,
                                    fontWeight: FontWeight.w400)),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                      ],
                    ),
                  ),
                  // Signup with Google Button
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => homePage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenHeight * 0.05),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.circular(5)),
                          // width: screenHeight * 0.1,
                          height: screenHeight * 0.07,
                          width: screenWidth * 0.75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: screenHeight * 0.05,
                                height: screenHeight * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://img.icons8.com/color/48/000000/google-logo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Sign up with Google',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.024,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  // Login Button
                  Hero(
                    tag: 'onBoarding Button',
                    child: coolButton(
                        text: "Register",
                        // width: screenWidth * 0.5,
                        // height: screenHeight * 0.07,
                        // textSize: screenWidth * 0.04,
                        functionToComply: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tellusmorePage()));
                        }),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Dont have an account?
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text("Already have an account? "),
                        InkWell(
                            child: const Text("Login",
                                style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.underline,
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginPage()));
                            })
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}