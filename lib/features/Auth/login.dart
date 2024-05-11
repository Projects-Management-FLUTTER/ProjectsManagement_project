import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managementp_projects/core/colors.dart';
import 'package:managementp_projects/core/components/defaultButton.dart';
import 'package:managementp_projects/features/Auth/bloc/auth_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = new TextEditingController();
    TextEditingController password = new TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.main_color,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 360,
                  width: 288,
                  decoration: BoxDecoration(
                    color: AppColor.auth_container_color,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 87, left: 31, right: 31, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: AppColor.main_color),
                        ),
                        SizedBox(height: 8),
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
                        SizedBox(height: 20),
                        Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: AppColor.main_color),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: password,
                          cursorColor: AppColor.main_color,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off_sharp),
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
                        SizedBox(
                          height: 40,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
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
                  height: 96,
                ),
                //---------------------------------------------------------------------------
                InkWell(
                  onTap: () {
                    context.read<AuthBloc>().add(
                        LoginData(email: email.text, password: password.text));
                  },
                  child: ButtonComponent(text: "Login"),
                ),
                //---------------------------------------------------------------------------------
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
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
          Positioned(
              top: 70, left: 135, child: Image.asset('assets/images/logo.png')),
        ],
      ),
    );
  }
}
