import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/custom_row.dart';
import 'package:ecommerce_app/components/custom_text_form_field.dart';
import 'package:ecommerce_app/cubit/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/features/authentication/sign_in.dart';
import 'package:ecommerce_app/features/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObsured = true;
  bool isObsuredConfirm = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
      listener: (context, state) {
        if (state is SignUpSuccessful) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("register Succeed")));
          // Navigate to home screen after a small delay to avoid UI issues
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LayoutScreen()),
            );
          });
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error :${state.error} ")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Let's Get Started",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff272f54),
                      ),
                    ),
                    const Text(
                      'Create an new account',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9f9da8),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextFormField(
                      prefixIconColor: Colors.grey.shade400,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name.';
                        }
                        return null;
                      },
                      controller: fullnameController,
                      hintText: 'Full Name',
                      prefix: Icons.person,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextFormField(
                      prefixIconColor: Colors.grey.shade400,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email address.';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      controller: emailController,
                      hintText: 'Your Email',
                      prefix: Icons.email,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextFormField(
                      prefixIconColor: Colors.grey.shade400,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a password.';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long.';
                        }
                        if (!RegExp(
                                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                            .hasMatch(value)) {
                          return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character.';
                        }
                        if (passwordController.text !=
                            passwordCheckController.text) {
                          return 'Passwords do not match.';
                        }
                        return null;
                      },
                      isPassword: isObsured ? true : false,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsured = !isObsured;
                          });
                        },
                        icon: Icon(isObsured
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      controller: passwordController,
                      hintText: 'Password',
                      prefix: Icons.lock,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextFormField(
                      prefixIconColor: Colors.grey.shade400,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please confirm your password.';
                        }
                        if (passwordController.text !=
                            passwordCheckController.text) {
                          return 'Passwords do not match.';
                        }
                        return null;
                      },
                      isPassword: isObsuredConfirm ? true : false,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsuredConfirm = !isObsuredConfirm;
                          });
                        },
                        icon: Icon(isObsuredConfirm
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      controller: passwordCheckController,
                      hintText: 'Password Again',
                      prefix: Icons.lock,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final fullname = fullnameController.text;
                          final email = emailController.text;
                          final password = passwordController.text;
                          BlocProvider.of<RegisterCubit>(context).userRegister(
                              name: fullname, email: email, password: password);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Form is not valid")));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomRow(
                      text: 'Do you have an Account?',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
                      textButton: 'Sign In',
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
