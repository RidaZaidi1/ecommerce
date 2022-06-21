import 'package:ecommerce_app/allcolors.dart';
import 'package:ecommerce_app/screens/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isfav = false;
  bool isdelete = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: AllColors.primarycolor,
        title: const Text("Home"),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.clear_all_rounded,
              size: 40,
            ),
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.3,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AllColors.primarycolor.withOpacity(0.5)),
              child: ImageSlideshow(
                initialPage: 0,
                indicatorBackgroundColor: Colors.grey,
                indicatorColor: AllColors.primarycolor,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image.asset(
                    "images/image_logo.png",
                    height: height * 0.01,
                    width: width * 0.8,
                  ),
                  Image.asset(
                    "images/image_logo.png",
                    height: height * 0.01,
                    width: width * 0.8,
                  ),
                  Image.asset(
                    "images/image_logo.png",
                    height: height * 0.01,
                    width: width * 0.8,
                  ),
                  Image.asset(
                    "images/image_logo.png",
                    height: height * 0.01,
                    width: width * 0.8,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  listofcategories(height, width, "images/images.png", "Shoes"),
                  listofcategories(height, width, "images/images.png", "Shoes"),
                  listofcategories(height, width, "images/images.png", "Shoes"),
                  listofcategories(height, width, "images/images.png", "Shoes"),
                  listofcategories(height, width, "images/images.png", "Shoes"),
                  listofcategories(height, width, "images/images.png", "Shoes"),
                  listofcategories(height, width, "images/images.png", "Shoes"),
                  listofcategories(height, width, "images/images.png", "Shoes"),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(8, (index) {
                return gridviewlists(
                    height,
                    width,
                    "images/images.png",
                    "Shoes",
                    Icon(
                      isfav == true ? Icons.favorite : Icons.favorite_border,
                    ));
              }),
            )
          ],
        ),
      ),
    );
  }

  Padding listofcategories(
      double height, double width, String images, String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 10, bottom: 5),
      child: Stack(
        children: [
          Container(
            height: height * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Card(
                color: AllColors.primarycolor.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  images,
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 97,
              left: 5,
            ),
            child: Container(
              height: height * 0.04,
              width: width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Padding gridviewlists(
      double height, double width, String images, String name, Icon icon1) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AllColors.primarycolor.withOpacity(0.2),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isfav = !isfav;
                        });
                      },
                      icon: icon1,
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Image.asset(
                images,
                height: height * 0.12,
                width: width * 0.32,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              name,
              style: const  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
