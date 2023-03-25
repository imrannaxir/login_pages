import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetAnimator(
        incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(),
        // atRestEffect: WidgetRestingEffects.swing(),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.red,
                Colors.orange,
                Colors.orange,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const TextAnimator(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WidgetAnimator(
                      atRestEffect: WidgetRestingEffects.swing(
                        duration: const Duration(
                          seconds: 7,
                        ),
                      ),
                      child: const Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ],
                            ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: WidgetAnimator(
                                      incomingEffect: WidgetTransitionEffects
                                          .incomingSlideInFromRight(
                                        duration: const Duration(
                                          seconds: 1,
                                        ),
                                      ),
                                      // atRestEffect: WidgetRestingEffects.dangle(),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Email or Phone number",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: mailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Enter Your E_Mail';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: WidgetAnimator(
                                      incomingEffect: WidgetTransitionEffects
                                          .incomingSlideInFromLeft(
                                        duration: const Duration(
                                          seconds: 1,
                                        ),
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          border: InputBorder.none,
                                          suffixIcon:
                                              Icon(Icons.remove_red_eye),
                                        ),
                                        obscureText: true,
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Enter Your Password';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          WidgetAnimator(
                            incomingEffect:
                                WidgetTransitionEffects.incomingSlideInFromTop(
                              duration: const Duration(
                                seconds: 1,
                              ),
                            ),
                            atRestEffect: WidgetRestingEffects.dangle(),
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromRight(
                              duration: const Duration(
                                seconds: 1,
                              ),
                            ),
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Data Processing .............',
                                        ),
                                      ),
                                    );
                                  }
                                },
                                style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all(
                                    Colors.orange,
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.orange[900],
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                child: WidgetAnimator(
                                  atRestEffect: WidgetRestingEffects.wave(
                                    duration: const Duration(
                                      seconds: 5,
                                    ),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromBottom(
                              duration: const Duration(
                                seconds: 1,
                              ),
                            ),
                            atRestEffect: WidgetRestingEffects.dangle(),
                            child: const Text(
                              "Continue with social media",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: WidgetAnimator(
                                  incomingEffect: WidgetTransitionEffects
                                      .incomingSlideInFromLeft(
                                    duration: const Duration(
                                      seconds: 1,
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        shadowColor: MaterialStateProperty.all(
                                          Colors.orange,
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.blue[900],
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      child: WidgetAnimator(
                                        atRestEffect: WidgetRestingEffects.wave(
                                          duration: const Duration(
                                            seconds: 5,
                                          ),
                                        ),
                                        child: const Text(
                                          'Facebook',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            // fontStyle: FontStyle.italic,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: WidgetAnimator(
                                  incomingEffect: WidgetTransitionEffects
                                      .incomingSlideInFromRight(
                                    duration: const Duration(
                                      seconds: 1,
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        shadowColor: MaterialStateProperty.all(
                                          Colors.orange,
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.black,
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      child: WidgetAnimator(
                                        atRestEffect: WidgetRestingEffects.wave(
                                          duration: const Duration(
                                            seconds: 5,
                                          ),
                                        ),
                                        child: const Text(
                                          'Github',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            // fontStyle: FontStyle.italic,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
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
      ),
    );
  }
}



/**
 * 
 * 
 * import 'package:flutter/material.dart';

import 'fadeAnimation.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.red,
              Colors.orange,
              Colors.orange,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange[900],
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Continue with social media",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Facebook",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Github",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
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
    );
  }
}

 */