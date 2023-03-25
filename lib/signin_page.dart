import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'clipper.dart';

class MySignInPage extends StatefulWidget {
  const MySignInPage({Key? key}) : super(key: key);

  @override
  State<MySignInPage> createState() => _MySignInPageState();
}

class _MySignInPageState extends State<MySignInPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isValid = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.black,
                height: size.height * 0.3,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromTop(
                        duration: const Duration(
                          seconds: 2,
                        ),
                      ),
                      atRestEffect: WidgetRestingEffects.bounce(
                        duration: const Duration(
                          seconds: 10,
                        ),
                      ),
                      child: Container(
                        height: size.height * 0.18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/image.jpg',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.65,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        child: TextFormField(
                          controller: mailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your E_Mail';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                            //  icon: Icon(Icons.email),
                            prefixIcon: Icon(Icons.mail),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Give Your Password';
                            } else if (value.length < 6) {
                              return 'Should Be At Least 6 Characters';
                            } else if (value.length > 15) {
                              return 'Should Not Be More Than 15 Characters';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(),
                            //  icon: Icon(Icons.password),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 180),
                      child: WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromRight(
                          duration: const Duration(
                            seconds: 3,
                          ),
                        ),
                        atRestEffect: WidgetRestingEffects.dangle(
                          duration: const Duration(
                            seconds: 2,
                          ),
                        ),
                        child: const Text(
                          'FORGOT PASSWORD ?',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: size.height * 0.085,
                        width: size.width * 0.8,
                        child: WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromLeft(
                            duration: const Duration(
                              seconds: 3,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (mailController.text.isEmpty &&
                                  passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please Enter The All Requirements',
                                    ),
                                  ),
                                );
                                return;
                              }
                              isValid = formKey.currentState!.validate();
                              if (!isValid) {
                                return;
                              } else {
                                print("E_Mail: ${mailController.text}");
                                print("Password: ${passwordController.text}");
                                mailController.clear();
                                passwordController.clear();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Data Has Been Entered Successfully',
                                    ),
                                  ),
                                );
                                print(
                                  'Well Done \n Keep it up !!!',
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                            child: WidgetAnimator(
                              atRestEffect: WidgetRestingEffects.dangle(
                                duration: const Duration(
                                  seconds: 5,
                                ),
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.black,
                            width: 100,
                            height: 1,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          WidgetAnimator(
                            incomingEffect:
                                WidgetTransitionEffects.incomingSlideInFromTop(
                              duration: const Duration(
                                seconds: 3,
                              ),
                            ),
                            atRestEffect: WidgetRestingEffects.dangle(
                              duration: const Duration(
                                seconds: 2,
                              ),
                            ),
                            child: const Text(
                              'Social Login',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.black,
                            width: 100,
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: WidgetAnimator(
                        // incomingEffect:
                        //     WidgetTransitionEffects.incomingSlideInFromLeft(
                        //   duration: const Duration(
                        //     seconds: 3,
                        //   ),
                        // ),
                        atRestEffect: WidgetRestingEffects.swing(
                          duration: const Duration(
                            seconds: 5,
                          ),
                        ),
                        child: Container(
                          height: size.height * 0.08,
                          width: size.width * 0.4,
                          decoration: const BoxDecoration(
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/google.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetAnimator(
                            incomingEffect:
                                WidgetTransitionEffects.incomingSlideInFromLeft(
                              duration: const Duration(
                                seconds: 3,
                              ),
                            ),
                            atRestEffect: WidgetRestingEffects.dangle(
                              duration: const Duration(
                                seconds: 2,
                              ),
                            ),
                            child: const Text(
                              'New User ?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromRight(
                              duration: const Duration(
                                seconds: 3,
                              ),
                            ),
                            atRestEffect: WidgetRestingEffects.dangle(
                              duration: const Duration(
                                seconds: 2,
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
