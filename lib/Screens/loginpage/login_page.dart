import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/page_view_screen.dart';
import 'package:healtether_clinic_app/Screens/loginpage/bloc/login_bloc.dart';
import 'package:healtether_clinic_app/utils/CustomTextField.dart';
import 'package:healtether_clinic_app/utils/customButton.dart';
import 'package:healtether_clinic_app/utils/global.dart';
import 'package:healtether_clinic_app/utils/snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginBloc bloc = LoginBloc();
  bool isPasswordVisible = false;


  @override
  void dispose() {
    super.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is LoginActionState ? true : false,
      listener: (context, state) {
        if (state is LoginFailState) {
          showSnackbar(state.error, context);
          bloc.add(LoginRestartEvent());
        } else if (state is LoginSuccessfulState) {
          Navigator.of(context).pushReplacement(createRoute(HomePageView(selectedIndex: 0)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Enter your mobile number *",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    hintText: "Mobile number",
                    numberLength: 10,
                    controller: _mobileController,
                    validator: (number) => (number!.isEmpty)
                        ? "The mobile number is incorrect, please try again!"
                        : null,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Password *",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    controller: _passwordController,
                    validator: (password) => (password!.isEmpty)
                        ? "Please enter the password"
                        : null,
                    obscureText: !isPasswordVisible,
                    suffIcon:  InkWell(
                      onTap: (){
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "By continuing, you agree to our ",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff5351C7),
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Text("Forgot Password?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ))),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is LoginInitial) {
                        return GestureDetector(
                          onTap: () {
                            bool ans = _formkey.currentState!.validate();
                            if (ans) {
                              bloc.add(LogingProcessEvent(
                                  number: _mobileController.text,
                                  password: _passwordController.text,
                                  context: context
                              ));
                            }
                          },
                          child: CustomButton(
                            data: "Log me in",
                            color: const Color(0xff03BF9C),
                            height: 54,
                            Textsize: 16,
                            Textcolor: Colors.white,
                          ),
                        );
                      } else {
                        return CustomButton(
                          data: "Logging you in..",
                          color: const Color(0xff03BF9C),
                          height: 54,
                          Textsize: 16,
                          Textcolor: Colors.white,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

