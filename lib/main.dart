import 'package:e_com/cubit/application_cubit.dart';
import 'package:e_com/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ApplicationCubit(),
    child: const GetMaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
