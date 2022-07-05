// ignore_for_file: unnecessary_const, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_element, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas_mobpro/pages/category1.dart';
import 'package:uas_mobpro/pages/category2.dart';
import 'package:uas_mobpro/pages/category3.dart';
import 'package:uas_mobpro/pages/category4.dart';
import 'package:uas_mobpro/pages/login/main_page.dart';
import 'dart:convert';

import '../models/products.dart';
import '../models/popular_product.dart';
import '../style.dart';
import '../widgets/bottom_navbar_item.dart';
import '../widgets/product_card.dart';
import '../widgets/recomended_products.dart';

class HomePage extends StatelessWidget {
  final String apiUrl = "https://dummyjson.com/products?skip=10&limit=20";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['products'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Image.asset(
            'assets/images/EShop.png',
            height: 80,
            width: 80,
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.logout, color: colorPrimary),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
            ),
          ],
          backgroundColor: whiteColor),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Shoping Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Temukan Barang Kebutuhan Anda',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Kategori Produk',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        //padding: const EdgeInsets.all(16.0),
                        primary: Colors.blue,
                        textStyle: const TextStyle(fontSize: 8)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Category1();
                      }));
                    },
                    child: ProductCard(
                      PopularProduct(
                        id: 1,
                        name: 'FRAGRANCES',
                        imageUrl: 'assets/images/parfume1.jpg',
                        category: 'fragrances',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        //padding: const EdgeInsets.all(16.0),
                        primary: Colors.blue,
                        textStyle: const TextStyle(fontSize: 8)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Category2();
                      }));
                    },
                    child: ProductCard(
                      PopularProduct(
                        id: 2,
                        name: 'SKINCARE',
                        imageUrl: 'assets/images/skincare1.png',
                        category: 'skincare',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        //padding: const EdgeInsets.all(16.0),
                        primary: Colors.blue,
                        textStyle: const TextStyle(fontSize: 8)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Category3();
                      }));
                    },
                    child: ProductCard(
                      PopularProduct(
                        id: 3,
                        name: 'GROCERIES',
                        imageUrl: 'assets/images/groseri1.jpg',
                        isPopular: true,
                        category: 'groceries',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        //padding: const EdgeInsets.all(16.0),
                        primary: Colors.blue,
                        textStyle: const TextStyle(fontSize: 8)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Category4();
                      }));
                    },
                    child: ProductCard(
                      PopularProduct(
                        id: 4,
                        name: 'HOME-DECO',
                        imageUrl: 'assets/images/deco1.jpg',
                        category: 'home-decoration',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: Recomended Space
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Rekomendasi Produk',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder<List<dynamic>>(
                future: _fecthDataUsers(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> data = snapshot.data;
                    int index = 0;
                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 10),
                          child: RecommendedProducts(Products.fromJson(item)),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: greyColor,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
