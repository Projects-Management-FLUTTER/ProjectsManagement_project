import 'package:flutter/material.dart';
import 'package:managementp_projects/core/colors.dart';
import 'package:managementp_projects/core/config/get_it.dart';
import 'package:managementp_projects/features/Auth/login.dart';
import 'package:managementp_projects/features/Auth/signup.dart';
import 'package:managementp_projects/features/create_join.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.main_color),
        useMaterial3: true,
      ),
      home: SignUp(),
    );
  }
}
