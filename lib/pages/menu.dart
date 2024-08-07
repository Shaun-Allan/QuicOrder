import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Menu extends StatefulWidget {
  final String shopName;

  const Menu({Key? key, required this.shopName}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // Track quantities of each food item
  final Map<int, int> _itemQuantities = {};

  @override
  Widget build(BuildContext context) {
    // Dummy list of food items with prices
    final foodItems = [
      {'name': 'Pizza', 'price': '12.99'},
      {'name': 'Burger', 'price': '9.99'},
      {'name': 'Pasta', 'price': '11.49'},
      {'name': 'Salad', 'price': '7.99'},
      {'name': 'Soda', 'price': '1.99'},
      // Add more items as needed
    ];

    // Get the list of ordered items
    List<Map<String, dynamic>> orderedItems = [];
    _itemQuantities.forEach((index, quantity) {
      if (quantity > 0) {
        final item = foodItems[index];
        orderedItems.add({'name': item['name'], 'quantity': quantity, 'price': item['price']});
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.shopName} Menu'),
      ),
      body: SlidingUpPanel(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        panel: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(80, 0, 0, 0),
                ),
                height: 4,
                width: 45,
              ),
              SizedBox(height: 16),
              Text(
                'Ordered Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: orderedItems.length,
                  itemBuilder: (context, index) {
                    final item = orderedItems[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text('Quantity: ${item['quantity']}'),
                      trailing: Text('\$${item['price']}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              final item = foodItems[index];
              final quantity = _itemQuantities[index] ?? 0;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item['name']!,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '\$${item['price']}',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (quantity > 0) {
                              _itemQuantities[index] = quantity - 1;
                            }
                          });
                        },
                      ),
                      Text(
                        '$quantity',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            _itemQuantities[index] = quantity + 1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
