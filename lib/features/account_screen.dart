import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/cubit/profile_cubit/profile_cubit.dart';
import 'package:ecommerce_app/cubit/profile_cubit/profile_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Colors.grey.shade200,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: state.profileModel.data!.image,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomTextFormField(
                    isEnabled: true,
                    prefix: Icons.person,
                    prefixIconColor: Colors.grey.shade400,
                    hintText: state.profileModel.data!.name,
                  ),
                  const SizedBox(height: 25),
                  CustomTextFormField(
                    isEnabled: true,
                    prefix: Icons.email,
                    prefixIconColor: Colors.grey.shade400,
                    hintText: state.profileModel.data!.email,
                  ),
                  const SizedBox(height: 25),
                  CustomTextFormField(
                    isEnabled: false,
                    prefix: Icons.person,
                    prefixIconColor: Colors.grey.shade400,
                    hintText: state.profileModel.data!.phone,
                  ),
                  const SizedBox(height: 25),
                  CustomButton(text: 'Save Changed', onPressed: () {})
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }
          return const Center(child: Text("Unexpected state"));
        },
      ),
    );
  }
}
