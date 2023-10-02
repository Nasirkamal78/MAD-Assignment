import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCartScreen(),
    );
  }
}

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<String> cartItems = [];
  final TextEditingController itemController = TextEditingController();

  void addItemToCart(String item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void viewCart() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Items in the Cart'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              cartItems.length,
              (index) => ListTile(
                title: Text(cartItems[index]),
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Shopping Cart App',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add Item to Cart'),
                      content: TextField(
                        controller: itemController,
                        decoration: InputDecoration(labelText: 'Item Name'),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            addItemToCart(itemController.text);
                            Navigator.of(context).pop();
                          },
                          child: Text('Add'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(40.0),
                  textStyle: TextStyle(fontSize: 30.0),
                  backgroundColor: Colors.blueGrey),
              child: Text('Add item to cart'),
            ),
            SizedBox(
              height: 50, // Adjust the height to create the desired space
            ),
            ElevatedButton(
              onPressed: viewCart,
              child: Text('View cart'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(40.0),
                  textStyle: TextStyle(fontSize: 30.0),
                  backgroundColor: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
