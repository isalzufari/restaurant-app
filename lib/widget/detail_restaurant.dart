import 'package:flutter/material.dart';

import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/provider/restaurant_detail.dart';
import 'package:restaurant_app/widget/card_menu.dart';

class DetailRestaurant extends StatelessWidget {
  final RestaurantDetail restaurant;
  final RestaurantDetailProvider provider;

  const DetailRestaurant({
    super.key,
    required this.restaurant,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 18,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.city,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: const Color(0xFF616161)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${restaurant.rating}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: const Color(0xFF616161)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Description :',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          Text(
            restaurant.description,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          Text(
            'Foods :',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 4,
              ),
              children: restaurant.menus.foods.map((food) {
                return CardMenu(name: food.name);
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Drinks :',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 4,
              ),
              children: restaurant.menus.drinks.map((drink) {
                return CardMenu(name: drink.name);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
