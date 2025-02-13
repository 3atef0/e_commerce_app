import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/components/custom_category_body.dart';
import 'package:ecommerce_app/components/custom_row_text_button.dart';
import 'package:ecommerce_app/model/api_categorie.dart';
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
            if (state is HomeLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeSuccessState) {
              final banners = state.homeModel.data?.banners ?? [];
              final products = state.homeModel.data?.products ?? [];

              return ListView(
                children: [
                  SizedBox(height: 10),

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

                  Padding(
                    padding: EdgeInsets.all(4),
                    child: CustomRowTextButton(
                        firstText: "Categories", secondText: "See more"),
                  ),
                  Container(
                    width: double.infinity,
                    height: 130,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8,
                      ),
                      itemCount: state.categoriesModel.categories.length,
                      itemBuilder: (context, index) {
                        var category = state.categoriesModel.categories[index];
                        return CategoryCircle(
                          name: category.name,
                          id: category.id,
                          img: category.image,
                          text: category.name,
                        );
                      },
                    ),
                  ),

                  // ====== Flash Sale ======
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: CustomRowTextButton(
                        firstText: "Flash Sale", secondText: "See more"),
                  ),
                  _buildHorizontalProductList(products, context),

                  // ====== Mega Sale ======
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CustomRowTextButton(
                        firstText: "Mega Sale", secondText: "See more"),
                  ),
                  _buildHorizontalProductList(products, context),
                ],
              );
            } else if (state is HomeErrorState) {
              return Center(child: Text('Error: ${state.error}'));
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

          String productName = product.name ?? 'No Name';
          if (productName.length > 30) {
            productName = productName.substring(0, 30) + "...";
          }

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
                          productName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow
                              .ellipsis, // إضافة النقاط في حال زاد الطول
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
