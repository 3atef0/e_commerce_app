import 'package:ecommerce_app/cubit/categorie_details/categorie_details_cubit.dart';
import 'package:ecommerce_app/cubit/categorie_details/categorie_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final int categoryId;
  final String categoryName;

  CategoryDetailsScreen({required this.categoryId, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryDetailsCubit()..getCategoryDetails(categoryId),
      child: Scaffold(
        appBar: AppBar(title: Text(categoryName)),
        body: BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
          builder: (context, state) {
            if (state is CategoryDetailsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoryDetailsSuccessState) {
              return GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1 / 1.4,
                ),
                itemCount: state.categoryDetailsModel.products.length,
                itemBuilder: (context, index) {
                  var product = state.categoryDetailsModel.products[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            product.image.toString(),
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${product.price} EGP',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                              if (product.discount != null)
                                Text(
                                  '${product.oldPrice} EGP',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is CategoryDetailsErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
