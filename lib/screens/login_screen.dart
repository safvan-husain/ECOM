import 'package:e_com/cubit/application_cubit.dart';
import 'package:e_com/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: "8547541134");
  final TextEditingController _passwordController =
      TextEditingController(text: "12345678");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Text(
                              "Skip",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 29,
                            ),
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: _emailController,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              label: Text(
                                "Email",
                                style: TextStyle(color: Colors.white),
                              ),
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                label: Text(
                                  "Password",
                                  style: TextStyle(color: Colors.white),
                                ),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.white,
                                ),
                                suffixIcon: Icon(Icons.password_outlined,
                                    color: Colors.white)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.white),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          BlocBuilder<ApplicationCubit, ApplicationState>(
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<ApplicationCubit>().login(
                                      _emailController.text,
                                      _passwordController.text);
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  alignment: Alignment.center,
                                  child: state.authState == AuthState.loading
                                      ? const CircularProgressIndicator()
                                      : const Text("Login"),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Center(
                            child: Text(
                              "Don't have account? Create Account",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .25,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
