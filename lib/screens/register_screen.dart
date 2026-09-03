import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_tutorial_app/screens/Signin_screen.dart';
import 'package:getx_tutorial_app/screens/home_screen.dart';
import 'package:getx_tutorial_app/widgets/register_formfield.dart';

class RegisterScreen extends StatelessWidget {
  var storage = GetStorage();
  final _formKey = GlobalKey<FormState>();
  String email = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // width: 212,
              height: 29,
              margin: const EdgeInsets.only(top: 45.88), //55.88
              alignment: Alignment.center,
              child: Text(
                "Welcome to Startify",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  //color: Color(0xff191C1F),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Container(
              width: 362,
              height: 19,
              margin: const EdgeInsets.only(top: 8),
              alignment: Alignment.center,
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
            SizedBox(height: 35),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RegisterBox(
                    text: "email".tr,
                    //text: "Email",
                    hintnote: "Enter your Email",
                    isEmail: true,
                    onSaved: (value) {
                      email = value ?? 'taniaJaveed@gmail.com';
                    },
                  ),
                  SizedBox(height: 15),
                  RegisterBox(
                    text: "password".tr,
                    //text: "Password",
                    hintnote: "   Enter your Password",
                    isPassword: true,
                  ),
                  SizedBox(height: 15),
                  RegisterBox(
                    text: "Confirm Password",
                    hintnote: "Re - enter Password",
                    isPassword: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Container(
              width: 200,
              height: 18,
              margin: const EdgeInsets.only(right: 145, left: 27),
              child: Row(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Color(0xff8D5CE2), width: 1),
                    ),
                  ),
                  SizedBox(
                    width: 13, //14
                  ),
                  Container(
                    width: 169,
                    //height: 17,
                    child: Text(
                      "I agree to the Privacy Policy.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        //color: Color(0xff4F4F4F),
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 43), //53
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
                        _formKey.currentState!.save();
                        storage.write('email', email);
                        debugPrint(storage.read('email'));
                        Get.off(() => HomeScreen());
                        Get.snackbar(
                          "Message",
                          "Registered Successfully",
                          titleText: Text(
                            "Message",
                            style: TextStyle(
                              fontSize: 16,
                              //color: Colors.black
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          messageText: Text(
                            "Registered Successfully",
                            style: TextStyle(
                              fontSize: 12,
                              //color: Colors.black
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          colorText: Color(0xff000000),
                          backgroundColor: Color.fromARGB(255, 177, 174, 174),
                          margin: EdgeInsets.all(10),
                          //maxWidth: 300,
                          animationDuration: Duration(seconds: 5),
                          //backgroundGradient: ,
                          //borderColor: ,
                          //boxShadows: ,
                          isDismissible: true,
                          dismissDirection: DismissDirection.horizontal,
                          // forwardAnimationCurve: Curves.bounceInOut,
                          overlayBlur: 5,
                          //overlayColor: ,
                          //userInputForm: ,
                          icon: Icon(
                            Icons.check_circle,
                            color: Color(0xffFFFFFF),
                          ),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please fill all fields correctly",
                        );
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
                        "Register Now",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFFFFF),
                          //color: Theme.of(context).colorScheme.onSurface,
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
                            //color: Color(0xff4F4F4F)
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
                              //color: Color(0xff4F4F4F),
                              // color: Theme.of(context).colorScheme.onSurface,
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
                              color: Color(0xffE1E1E1),
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
                              color: Color(0xffE1E1E1),
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
                        text: "Already have an account?",
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.7),
                        ), // Default style
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(SigninScreen());
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24), //64
          ],
        ),
      ),
    );
  }
}
