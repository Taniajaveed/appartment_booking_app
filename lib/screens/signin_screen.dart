import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial_app/screens/home_screen.dart';
import 'package:getx_tutorial_app/screens/register_screen.dart';
import 'package:getx_tutorial_app/widgets/register_formfield.dart';

class SigninScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // width: 155,
              height: 29,
              margin: const EdgeInsets.only(top: 45.88), //55.88
              alignment: Alignment.center,
              child: Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  //color: Color(0xff191C1F),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              //width: 362,
              height: 19,
              child: Text(
                "Please fill in the required field to continue!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  //color: Color(0xff4F4F4F),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 35), //78
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RegisterBox(
                    text: "email".tr,
                    hintnote: "   Enter your email",
                  ),
                  SizedBox(height: 15),
                  RegisterBox(
                    text: "password".tr,
                    hintnote: "   Enter your Password",
                    isPassword: true,
                  ),
                  SizedBox(height: 18),
                  Container(
                    width: 137, //127
                    height: 21, //19
                    margin: const EdgeInsets.only(left: 229), //279
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        //color: Color(0xff8D5CE2),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 43), //89
            Container(
              width: 342,
              height: 274,
              //color: Colors.pink,
              margin: const EdgeInsets.symmetric(horizontal: 44),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.off(() => HomeScreen());
                      }
                    },
                    child: Container(
                      width: 342,
                      height: 66,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        //color: Color(0xff8D5CE2),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 19),
                  Container(
                    width: 293,
                    height: 31,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                        Container(
                          //width: 130,
                          height: 22,
                          child: Text(
                            " Or Continue with ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,

                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32), //32
                  Container(
                    width: 154,
                    height: 66,
                    child: Row(
                      children: [
                        Container(
                          width: 68,
                          height: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              //color: Color(0xffE1E1E1),
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 2,
                            ),
                          ),
                          child: Container(
                            width: 24.97,
                            height: 31.9,
                            child: Image(
                              image: AssetImage(
                                "assets/images/AppleRegister.png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 18),
                        Container(
                          width: 68,
                          height: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              //color: Color(0xffE1E1E1),
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 2,
                            ),
                          ),
                          child: Container(
                            width: 24.97,
                            height: 31.9,
                            child: Image(
                              image: AssetImage(
                                "assets/images/googleRegister.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40), //40
                  Container(
                    //width: 209, //199
                    height: 20,
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          //color: Colors.black
                          color: Theme.of(context).colorScheme.onSurface,
                        ), // Default style
                        children: [
                          TextSpan(
                            text: "Register Now",
                            style: TextStyle(
                              //color: Color(0xff8D5CE2),
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //Get.toNamed('/register');
                                Get.to(
                                  RegisterScreen(),
                                  //arguments: "Data From Previous Screen", --- Need to retrive data on screen where you passed that argument -----Text("${Get.argument}", style: TextStyle(fontSize: 14,))
                                  //fullscreenDialog: true,
                                  transition: Transition.zoom,
                                  duration: Duration(seconds: 5),
                                  curve: Curves.easeInOut,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
