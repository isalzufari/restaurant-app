import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';
import 'package:restaurant_app/provider/restaurant_detail.dart';
import 'package:restaurant_app/data/enum/result_state.dart';
import 'package:restaurant_app/widget/detail_restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (_) => RestaurantDetailProvider(
        apiService: ApiService(),
        restaurantId: restaurant.id,
      ),
      child: _buildContext(context),
    );
  }

  Widget _buildContext(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: heightScreen * 0.4,
                width: widthScreen,
                margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Consumer<RestaurantDetailProvider>(
                builder: (_, provider, __) {
                  switch (provider.state) {
                    case ResultState.loading:
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.grey[400],
                        ),
                      );
                    case ResultState.hasData:
                      return DetailRestaurant(
                        provider: provider,
                        restaurant: provider.result.restaurant,
                      );
                    case ResultState.error:
                      return const Text('Koneksi Terputus');
                    default:
                      return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
