import 'package:flutter/material.dart';

import '../restaurant.dart';
import 'restaurant_detail.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurants(snapshot.data);

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return _ItemRestauranItem(context, restaurant);
            },
          );
        },
      ),
    );
  }
}

Widget _ItemRestauranItem(BuildContext context, Restaurant restaurant) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5, top: 5),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          restaurant.pictureId!,
          fit: BoxFit.cover,
          width: 100,
          errorBuilder: (ctx, error, _) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
      title: Text(restaurant.name!),
      subtitle: Row(
        children: [
          Icon(
            Icons.location_pin,
            size: 18,
            color: Colors.grey[400],
          ),
          const SizedBox(width: 4),
          Text(
            '${restaurant.city}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: const Color(0xFF616161)),
          ),
        ],
      ),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant);
      },
    ),
  );
}

Widget _itemList(BuildContext context, Restaurant restaurant) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        RestaurantDetailPage.routeName,
        arguments: restaurant,
      );
    },
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 100,
              width: 150,
              child: restaurant.pictureId == null
                  ? Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.grey[400],
                    )
                  : Image.network(
                      restaurant.pictureId!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.grey[400],
                            ),
                          );
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.broken_image,
                          size: 100,
                          color: Colors.grey[400],
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  '${restaurant.name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
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
                      '${restaurant.city}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: const Color(0xFF616161)),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
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
          ),
        ],
      ),
    ),
  );
}
