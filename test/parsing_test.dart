import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';

var json = {
  "id": "vfsqv0t48jkfw1e867",
  "name": "Gigitan Makro",
  "description":
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
  "pictureId": "04",
  "city": "Surabaya",
  "rating": 4.9
};

void main() {
  test("Test Json Parsing", () async {
    var result = Restaurant.fromJson(json).id;
    expect(result, "vfsqv0t48jkfw1e8671");
  });
}
