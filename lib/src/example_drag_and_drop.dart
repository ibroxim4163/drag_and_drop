import 'package:flutter/material.dart';

import 'constants/app_variables.dart';
import 'models/customer.dart';
import 'models/item_model.dart';
import 'widgets/custom_cart.dart';
import 'widgets/dragging_list_item.dart';
import 'widgets/menu_list_item.dart';

class ExampleDragAndDrop extends StatefulWidget {
  const ExampleDragAndDrop({super.key});

  @override
  State<ExampleDragAndDrop> createState() => _ExampleDragAndDropState();
}

class _ExampleDragAndDropState extends State<ExampleDragAndDrop> {
  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
    required Item item,
    required Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }

  final List<Item> _items = AppVariables.items;
  final List<Customer> _people = AppVariables.people;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFF64209)),
        title: Text(
          'Order Food',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 36,
                color: const Color(0xFFF64209),
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: _items.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12,
                      );
                    },
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return LongPressDraggable<Item>(
                        data: item,
                        dragAnchorStrategy: pointerDragAnchorStrategy,
                        feedback: DraggingListItem(
                          dragKey: _draggableKey,
                          photoProvider: item.imageProvider,
                        ),
                        child: MenuListItem(
                          name: item.name,
                          price: item.formattedTotalItemPrice,
                          photoProvider: item.imageProvider,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 20,
                  ),
                  child: Row(
                    children: _people
                        .map((customer) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: DragTarget<Item>(
                                  builder:
                                      (context, candidateItems, rejectedItems) {
                                    return CustomerCart(
                                      hasItems: customer.items.isNotEmpty,
                                      highlighted: candidateItems.isNotEmpty,
                                      customer: customer,
                                    );
                                  },
                                  onAccept: (item) {
                                    _itemDroppedOnCustomerCart(
                                      item: item,
                                      customer: customer,
                                    );
                                  },
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
