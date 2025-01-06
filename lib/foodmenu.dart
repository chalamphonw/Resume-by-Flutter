import 'package:flutter/material.dart';

class FoodMenu extends StatefulWidget {
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'Steak',
      'price': '200',
      'ingredients': 'Beef, Salt, Pepper, Olive Oil, Garlic',
    },
    {
      'name': 'Burger',
      'price': '50',
      'ingredients': 'Bun, Beef Patty, Lettuce, Tomato, Cheese',
    },
    {
      'name': 'Pasta',
      'price': '100',
      'ingredients': 'Pasta, Olive Oil, Garlic, Parmesan, Basil',
    },
  ];

  double totalPrice = 0; // ตัวแปรเก็บยอดรวม
  List<Map<String, String>> orderList = []; // เก็บรายการอาหารที่สั่ง

  void _addToOrder(Map<String, String> foodItem) {
    setState(() {
      orderList.add(foodItem); // เพิ่มอาหารในลิสต์คำสั่งซื้อ
      totalPrice += double.parse(foodItem['price']!); // อัปเดตยอดรวม
    });
  }

  void _removeFromOrder(Map<String, String> foodItem) {
    setState(() {
      if (orderList.contains(foodItem)) {
        orderList.remove(foodItem); // ลบรายการจากลิสต์คำสั่งซื้อ
        totalPrice -= double.parse(foodItem['price']!); // อัปเดตยอดรวม
      }
    });
  }

  void _clearOrders() {
    setState(() {
      orderList.clear(); // ลบลิสต์คำสั่งซื้อทั้งหมด
      totalPrice = 0; // ตั้งยอดรวมเป็น 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Menu'),
        backgroundColor: const Color.fromARGB(255, 255, 60, 0),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepOrange[200],
                      child: Text(
                        foodItems[index]['name']![0],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 187, 127, 127),
                        ),
                      ),
                    ),
                    title: Text(
                      foodItems[index]['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price: \$${foodItems[index]['price']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Ingredients: ${foodItems[index]['ingredients']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _addToOrder(foodItems[index]);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('+'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            _removeFromOrder(foodItems[index]);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('-'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1, color: Colors.grey),
          Container(
            color: Colors.orange[50],
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order List:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 82, 34, 255),
                  ),
                ),
                SizedBox(height: 8),
                orderList.isEmpty
                    ? Center(
                        child: Text(
                          'No items added yet.',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: const Color.fromARGB(255, 182, 140, 140),
                          ),
                        ),
                      )
                    : Column(
                        children: orderList.map((item) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['name']!,
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '\$${item['price']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(255, 255, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _clearOrders,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Clear Orders'),
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
