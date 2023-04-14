import 'package:flutter/material.dart';
import 'package:vizesinav/components/bottomNavigation.dart';
import 'package:vizesinav/components/header.dart';
import 'package:vizesinav/productDetail.dart';

// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  String categoryTitle;

  CategoryPage(this.categoryTitle, {Key key}) : super(key: key);


  List<Map> products=[
    {"İsim":"Surface Laptop 3","fotograf":"assets/images/laptop.png","fiyat":"999"},
    {"İsim":"Headphone","fotograf":"assets/images/speaker.png","fiyat":"1999"},
    {"İsim":"Phone ","fotograf":"assets/images/smartphone.png","fiyat":"2999"},
    {"İsim":"Surface Keyboard","fotograf":"assets/images/keyboard.webp","fiyat":"3999"},
    {"İsim":"Iphone 11","fotograf":"assets/images/iphone11.jpg","fiyat":"4999"},
    {"İsim":"Surface Laptop 8","fotograf":"assets/images/laptop.png","fiyat":"5999"},


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //header
          header(categoryTitle, context),
          const SizedBox(height: 32),
          //içerikler
       Expanded(
         child: GridView.count(
           crossAxisCount: 2,
           mainAxisSpacing: 15,
           crossAxisSpacing: 10,
           children: products.map((Map product)
           {
           return buildContent(product["İsim"], product["fotograf"], product["fiyat"],context);

         }).toList(),
         ),
       )

        ]),
      ),

              bottomNavigationBar("home"),
    ])));
  }
}
Widget buildContent(String title,  String photoUrl, String price, context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, 16))
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Image.asset(photoUrl),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF0A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "USD $price",
                  style: const TextStyle(
                    color: Color(0xFF0001FC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
