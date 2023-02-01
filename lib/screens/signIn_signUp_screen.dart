import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../widgets/custom_text_field.dart';

class SignInSignUpScreen extends StatefulWidget {
  const SignInSignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignInSignUpScreen> createState() => _SignInSignUpScreenState();
}

class _SignInSignUpScreenState extends State<SignInSignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isLoginSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc0c0c0),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xfffe0000),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: Row(
                    children: [
                      const Text(
                        "Social",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "assets/cross.png",
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      border: Border.all(color: Color(0xfffe0000))),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoginSelected = true;
                            });
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: isLoginSelected
                                  ? const Color(0xfffe0000)
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: isLoginSelected
                                      ? Colors.white
                                      : Color(0xff797979),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLoginSelected = false;
                            });
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: isLoginSelected
                                  ? Colors.white
                                  : const Color(0xfffe0000),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: isLoginSelected
                                        ? const Color(0xff797979)
                                        : Colors.white),
                              ),
                            ),
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
      ),
      body: isLoginSelected
          ? Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 15, right: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "SignIn into your\nAccount",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xffee0604),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              customTextField(
                                labelText: "Email",
                                controller: emailController,
                                hintText: "johndoe@gmail.com",
                                suffixIcon: const Icon(
                                  Icons.mail,
                                  color: Color(0xffee0604),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              customTextField(
                                labelText: "Password",
                                controller: passwordController,
                                hintText: "Password",
                                suffixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color(0xffee0604),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Spacer(),
                                  Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                        color: Color(0xffee0604),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Center(
                                  child: Text(
                                    "Login With",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                        "assets/google.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff4b76bd),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                        "assets/facebook.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLoginSelected = false;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Don't have an account?",
                                        style: TextStyle(
                                          color: Color(0xffa9a9a9),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          "Register Now",
                                          style: TextStyle(
                                            color: Color(0xffee0604),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 15, right: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Create an\nAccount",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xffee0604),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              customTextField(
                                labelText: "Name",
                                controller: nameController,
                                hintText: "John Doe",
                                suffixIcon: const Icon(
                                  Icons.mail,
                                  color: Color(0xffee0604),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              customTextField(
                                labelText: "Email",
                                controller: emailController,
                                hintText: "johndoe@gmail.com",
                                suffixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color(0xffee0604),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Contact Number",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              IntlPhoneField(
                                controller: phoneController,
                                decoration: const InputDecoration(
                                  labelText: '9876543210',
                                  suffixIcon: Icon(
                                    Icons.call,
                                    color: Color(0xffee0604),
                                  ),
                                ),
                                initialCountryCode: 'IN',
                                onChanged: (phone) {
                                  setState(() {
                                    phoneController.text = phone.completeNumber;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              customTextField(
                                labelText: "Password",
                                controller: passwordController,
                                hintText: "*********",
                                suffixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color(0xffee0604),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLoginSelected = true;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Already have an account?",
                                        style: TextStyle(
                                          color: Color(0xffa9a9a9),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                            color: Color(0xffee0604),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xffee0604),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: isLoginSelected
            ? const Center(
                child: Text(
                "LOGIN",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
            : const Center(
                child: Text(
                  "REGISTER",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
      ),
    );
  }
}
