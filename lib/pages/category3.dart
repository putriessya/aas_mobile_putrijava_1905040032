// ignore_for_file: unnecessary_const, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_element, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas_mobpro/pages/login/main_page.dart';
import 'dart:convert';

import '../models/products.dart';
import '../models/popular_product.dart';
import '../style.dart';
import '../widgets/bottom_navbar_item.dart';
import '../widgets/product_card.dart';
import '../widgets/recomended_products.dart';

class Category3 extends StatelessWidget {
  final String apiUrl = "https://dummyjson.com/products/category/groceries";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['products'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          leading: BackButton(
            color: colorPrimary,
          ),
          title: Text(
            'GROCERIES',
            style: TextStyle(color: colorPrimary),
          ),
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
                'Explore Now',
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
                'Beli Produk Yang Anda Sukai',
                style: greyTextStyle.copyWith(
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
