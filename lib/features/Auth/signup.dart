import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:managementp_projects/core/Domain/Model/AuthModel/SignUpModel.dart';
import 'package:managementp_projects/core/colors.dart';
import 'package:managementp_projects/core/components/defaultButton.dart';
import 'package:managementp_projects/features/Auth/bloc/auth_bloc.dart';
import 'package:managementp_projects/features/bloc/app_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController first_name = new TextEditingController();
    TextEditingController last_name = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController password = new TextEditingController();
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: AppColor.main_color,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 500,
                        width: 288,
                        decoration: BoxDecoration(
                          color: AppColor.auth_container_color,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 70, left: 31, right: 31, bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'First name',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.main_color),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: first_name,
                                cursorColor: AppColor.main_color,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.sub_color,
                                  focusColor: AppColor.main_color,
                                  contentPadding: EdgeInsets.only(
                                      left: 10, top: 15, bottom: 15, right: 30),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Last name',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.main_color),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: last_name,
                                cursorColor: AppColor.main_color,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.sub_color,
                                  focusColor: AppColor.main_color,
                                  contentPadding: EdgeInsets.only(
                                      left: 10, top: 15, bottom: 15, right: 30),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.main_color),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: email,
                                cursorColor: AppColor.main_color,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.sub_color,
                                  focusColor: AppColor.main_color,
                                  contentPadding: EdgeInsets.only(
                                      left: 10, top: 15, bottom: 15, right: 30),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Password',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.main_color),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: password,
                                cursorColor: AppColor.main_color,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.sub_color,
                                  focusColor: AppColor.main_color,
                                  suffixIcon:
                                      Icon(Icons.visibility_off_rounded),
                                  contentPadding: EdgeInsets.only(
                                      left: 10, top: 15, bottom: 15, right: 30),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: AppColor.gray_color,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Remember me',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.main_color),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is Success_auth) {
                            context.read<AppBloc>().add(SigendUp());
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'successfully registered',
                              style: TextStyle(
                                color: AppColor.main_color,
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            showCloseIcon: true,
                            closeIconColor: AppColor.main_color,
                            backgroundColor: Color.fromRGBO(217, 217, 217, 20),
                          ));
                          context.go('create_join');
                        },
                        child: InkWell(
                            onTap: () {
                              context.read<AuthBloc>().add(RegisterData(
                                  auth: SignUpModel(
                                      firstName: first_name.text,
                                      lastName: last_name.text,
                                      email: email.text,
                                      password: password.text,
                                      role: "USER")));
                            },
                            child: ButtonComponent(text: "Sign Up")),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account ?',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                context.go('/');
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(SnackBar(
                                //   content: Text(
                                //     'successfully registered',
                                //     style: TextStyle(
                                //       color: AppColor.main_color,
                                //       fontFamily: 'Inter',
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w400,
                                //     ),
                                //   ),
                                //   behavior: SnackBarBehavior.floating,
                                //   showCloseIcon: true,
                                //   closeIconColor: AppColor.main_color,
                                //   backgroundColor:
                                //       Color.fromRGBO(217, 217, 217, 20),
                                // ));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: AppColor.sub_color,
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 30,
                  left: 135,
                  child: Image.asset('assets/images/logo.png')),
            ],
          ),
        );
      }),
    );
  }
}
