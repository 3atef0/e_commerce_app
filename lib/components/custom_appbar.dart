import 'package:ecommerce_app/components/custom_text_form_field.dart';
import 'package:ecommerce_app/features/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomTextFormField(
              hintText: 'Search Product',
              prefix: Icons.search,
              prefixIconColor: Colors.blue,
            ),
          ),
          IconButton(
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.grey,
              ),
              onPressed: () {}),
          Stack(
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.notifications_none_sharp,
                    color: Colors.grey,
                    size: 30,
                  ),
                  onPressed: () {}),
              Positioned(
                right: 12,
                top: 10,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          IconButton(
              icon: const Icon(
                Icons.output,
                color: Colors.grey,
              ),
              onPressed: () async {
                SharedPreferences pres = await SharedPreferences.getInstance();
                await pres.remove('user_token');

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
              }),
        ],
      ),
    );
  }
}
