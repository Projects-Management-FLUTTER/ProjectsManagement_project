import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:managementp_projects/core/colors.dart';
import 'package:managementp_projects/core/config/get_it.dart';
import 'package:managementp_projects/features/Auth/bloc/auth_bloc.dart';
import 'package:managementp_projects/features/Auth/login.dart';
import 'package:managementp_projects/features/Auth/signup.dart';
import 'package:managementp_projects/features/bloc/app_bloc.dart';
import 'package:managementp_projects/features/create_join.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Login();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'SignUp',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUp();
          },
        ),
        GoRoute(
          path: 'create_join',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateJoinPage();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (_) => AppBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.main_color),
          useMaterial3: true,
        ),
      ),
    );
  }
}
