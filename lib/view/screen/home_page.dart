import 'package:flutter/material.dart';
import 'package:pr_appmania/utils/product_utils.dart';
import 'package:pr_appmania/utils/route_utils.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff50623A),
        leading: GestureDetector(
          child: const Icon(Icons.person_rounded),
        ),
        centerTitle: true,
        title: Text(
          "Home Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.shopping_cart,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
          SizedBox(
            width: size.width * 0.05,
          )
        ],
      ),
      backgroundColor: Color(0xffADBC9F),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Groceries ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    ...allGroceries
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                MyRoutes.detiaalpage,
                                arguments: e,
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.4,
                                  width: double.infinity,
                                  margin: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Color(0xffF2EFE5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3,
                                        offset: Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size.height * 0.3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.red,
                                          image: DecorationImage(
                                              image: NetworkImage(e['image']),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(2),
                                            ),
                                            Text(
                                              e["name"],
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              e["unit"],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "\$ ${e['price']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
