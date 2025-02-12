import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/cubit/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/cubit/home_cubit/home_state.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeStateLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeStateSuccessful) {
              final banners = state.homeModel.data?.banners ?? [];
              final products = state.homeModel.data?.products ?? [];

              return ListView(
                children: [
                  SizedBox(height: 10),

                  // ====== Banner (Carousel) ======
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                    ),
                    items: banners.map((banner) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          banner.image ?? '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 20),

                  // ====== Flash Sale ======
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Flash Sale",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildHorizontalProductList(products, context),

                  // ====== Mega Sale ======
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Mega Sale",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildHorizontalProductList(products, context),
                ],
              );
            } else if (state is HomeStateError) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return Center(child: Text('Unknown state.'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildHorizontalProductList(
      List<dynamic> products, BuildContext context) {
    return SizedBox(
      height: 250, // Adjust height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      product.image ?? '',
                      fit: BoxFit.cover,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          product.name ?? 'No Name',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${product.price ?? 0} EGP',
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
