import 'package:flutter/material.dart';

import 'package:restaurant_app/data/model/restaurant_list.dart';
import 'package:restaurant_app/page/restaurant_list.dart';
import 'package:restaurant_app/page/restaurant_detail.dart';
import 'package:restaurant_app/page/restaurant_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: Colors.green,
            ),
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (_) => const RestaurantListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
        RestaurantSearchPage.routeName: (_) => const RestaurantSearchPage(),
      },
    );
  }
}
