import 'package:flutter/material.dart';
import 'package:pr_appmania/utils/product_utils.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff50623A),
          centerTitle: true,
          title: Text(
            "Cart Item",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: (Navigator.of(context).pop),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        backgroundColor: Color(0xffADBC9F),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  ...cartItem.map(
                    (e) => Container(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                image: NetworkImage(e['image']),
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
                                  e['name'],
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                ),
                                Text(
                                  e['unit'],
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                ),
                                Text(
                                  "\$ ${e['price'].toString()}",
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
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 130,
          color: Color(0xff50623A),
        ),
      ),
    );
  }
}
