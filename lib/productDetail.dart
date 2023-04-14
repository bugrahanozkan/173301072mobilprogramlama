import 'package:flutter/material.dart';
import 'package:vizesinav/components/bottomNavigation.dart';
import 'components/header.dart';


// ignore: must_be_immutable
class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color selectedColor;
  int selectedCapacity = 64;
  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];
  List<int> capacities = [64, 256, 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //header
            header(widget.productTitle, context),
            SizedBox(height: 32),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: [
                    //NEW ETİKETİ
                    //label("New"),
                    SizedBox(height: 0),
                    //ÜRÜN FOTOĞRAFI
                    Center(child: Image.asset("assets/images/iphone11.jpg")),
                    SizedBox(height: 30),

                    //RENK SEÇENEKLERİ
                    Text(
                      "Color",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A103)),
                    ),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: colors
                            .map((Color color) => colorOption(
                                color: color,
                                selected: selectedColor == color,
                                onTap: () {
                                  setState(() {
                                    selectedColor = color;
                                  });
                                }))
                            .toList()),
                    //KAPASİTE SEÇENEKLERİ
                    SizedBox(height: 32),
                    Text(
                      "Capacity",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A103)),
                    ),

                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: capacities
                          .map((int number) => capacityOption(
                              capacity: number,
                              selected: selectedCapacity == number,
                              onTap: () {
                                setState(() {
                                  selectedCapacity = number;
                                });
                              }))
                          .toList(),
                    ),
                    SizedBox(height: 32),
                    //SEPETE EKLE BUTONU

                    GestureDetector(
                      onTap: () {
                        print("Pruduct addes to card.");
                        print("Product Name:" + widget.productTitle);
                        print("Product Color:" + selectedColor.value.toString());
                        print("Product Capacity:" +
                            selectedCapacity.toString() +
                            "GB");
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFF1F53E4),
                        ),
                        child: Text(
                          "Add to Basket",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ])),
      bottomNavigationBar("home"),
    ])));
  }
}

Widget colorOption({Color color, bool selected, Function onTap}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border:
                Border.all(color: Color(0xFF0001FC), width: selected ? 3 : 0)),
        width: 23,
        height: 23,
      ));
}

Widget capacityOption({int capacity, bool selected, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        "$capacity GB",
        style: TextStyle(
            color: Color(selected ? 0xFF0001FC : 0xFFA7A9BE), fontSize: 16),
      ),
    ),
  );
}
