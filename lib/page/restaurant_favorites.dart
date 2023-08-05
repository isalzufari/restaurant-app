import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/enum/result_state.dart';
import 'package:restaurant_app/provider/database.dart';
import 'package:restaurant_app/widget/card_list.dart';

class RestaurantFavoritesPage extends StatelessWidget {
  static const routeName = '/restaurant_favorites';

  const RestaurantFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: Consumer<DatabaseProvider>(
        builder: (_, provider, __) {
          if (provider.state == ResultState.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              itemCount: provider.favorites.length,
              itemBuilder: (_, index) {
                final restaurant = provider.favorites[index];
                return CardList(restaurant: restaurant);
              },
            );
          } else {
            return Center(
              child: Text(provider.message),
            );
          }
        },
      ),
    );
  }
}
