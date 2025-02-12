import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/custom_divider.dart';
import 'package:ecommerce_app/components/custom_row.dart';
import 'package:ecommerce_app/components/custom_text_button.dart';
import 'package:ecommerce_app/components/custom_text_form_field.dart';
import 'package:ecommerce_app/components/social_login_button.dart';
import 'package:ecommerce_app/cubit/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/layout_screen.dart';
import 'package:ecommerce_app/features/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObsured = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is SignInSuccessful) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Login Succeeded")));
          // Navigate to home screen after a small delay to avoid UI issues
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LayoutScreen()),
            );
          });
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error: ${state.error}")));
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
                    CustomButton(
                      text: 'Sign In',
                      isLoading: state is SignInLoading,
                      onPressed: state is SignInLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                final email = emailController.text;
                                final password = passwordController.text;
                                BlocProvider.of<LoginCubitCubit>(context)
                                    .userLogin(
                                        email: email, password: password);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Form is not valid")));
                              }
                            },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CustomDivider(titleDivider: 'OR'),
                    const SizedBox(height: 16),
                    SocialLoginButton(
                      icon: 'assets/images/google.png',
                      text: "Login with Google",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    SocialLoginButton(
                      icon: 'assets/images/facebook.png',
                      text: "Login with Facebook",
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextButton(
                      text: 'Forgot Password',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomRow(
                      text: "Don't have an account?",
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      textButton: 'Register',
                    ),
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
