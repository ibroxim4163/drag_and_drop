import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../models/item_model.dart';

abstract class AppVariables {
  static const List<Item> items = [
    Item(
      name: 'Spinach Pizza',
      totalPriceCents: 1299,
      uid: '1',
      imageProvider: NetworkImage(
        'https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
      ),
    ),
    Item(
      name: 'Veggie Delight',
      totalPriceCents: 799,
      uid: '2',
      imageProvider: NetworkImage(
        'https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg',
      ),
    ),
    Item(
      name: 'Chicken Parmesan',
      totalPriceCents: 1499,
      uid: '3',
      imageProvider: NetworkImage(
        'https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg',
      ),
    ),
  ];

  static final List<Customer> people = [
    Customer(
      name: 'Makayla',
      imageProvider: const NetworkImage(
        'https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg',
      ),
    ),
    Customer(
      name: 'Nathan',
      imageProvider: const NetworkImage(
        'https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg',
      ),
    ),
    Customer(
      name: 'Emilio',
      imageProvider: const NetworkImage(
        'https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg',
      ),
    ),
  ];
}
