import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pr_appmania/utils/product_utils.dart';

class DetialPage extends StatefulWidget {
  const DetialPage({super.key});

  @override
  State<DetialPage> createState() => _DetialPageState();
}

class _DetialPageState extends State<DetialPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff50623A),
        title: Text(
          data['name'],
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color(0xffADBC9F),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: size.height * 0.6,
                width: double.infinity,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Color(0xffF2EFE5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(data['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                          ),
                          Text(
                            data['name'],
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2),
                          ),
                          Text(
                            data['unit'],
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2),
                          ),
                          Text(
                            "\$ ${data['price'].toString()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff50623A),
        onPressed: () {
          // !cartItem.contains(data) ? cartItem.add(data) : cartItem.remove(data);
          if (!cartItem.contains(data)) {
            cartItem.add(data);
            var snackBar = const SnackBar(
              content: Text("Add To Cart"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            cartItem.remove(data);
            var snackBar = const SnackBar(
              content: Text("Remove To Cart"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        icon: Icon(
          Icons.shopping_cart,
          color: Color(0xffF2EFE5),
        ),
        label: Text(
          'Add To Cart..',
          style: TextStyle(
            color: Color(0xffF2EFE5),
          ),
        ),
      ),
    );
  }
}
