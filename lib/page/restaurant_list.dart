import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_list.dart';
import 'package:restaurant_app/data/enum/result_state.dart';
import 'package:restaurant_app/widget/card_list.dart';
import 'restaurant_search.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantListProvider>(
      create: (_) => RestaurantListProvider(apiService: ApiService()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, RestaurantSearchPage.routeName);
              },
            ),
          ],
        ),
        body: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return Consumer<RestaurantListProvider>(
      builder: (_, provider, __) {
        switch (provider.state) {
          case ResultState.loading:
            return Center(
              child: CircularProgressIndicator(
                color: Colors.grey[400],
              ),
            );
          case ResultState.hasData:
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              itemCount: provider.result.count,
              itemBuilder: (_, index) {
                final restaurant = provider.result.restaurants[index];
                return CardList(restaurant: restaurant);
              },
            );
          case ResultState.noData:
            return const Center(child: Text('Data Kosong'));
          case ResultState.error:
            return const Center(child: Text('Koneksi Terputus'));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
