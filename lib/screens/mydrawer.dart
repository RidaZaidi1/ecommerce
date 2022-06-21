import 'package:ecommerce_app/allcolors.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              "images/image_logo.png",
            ),
            decoration: BoxDecoration(),
          ),
          drawercategorylist("Home",Icon(Icons.home,color: Colors.white,),),
          drawercategorylist("Logout",Icon(Icons.logout,color: Colors.white,),),
          drawercategorylist("profile",Icon(Icons.person,color: Colors.white,),),
          drawercategorylist("Categories",Icon(Icons.category,color: Colors.white,),),
        ],
      ),
      backgroundColor: AllColors.primarycolor.withOpacity(0.8),
    );
  }

  ListTile drawercategorylist(String title1,Icon icon1) {
    return ListTile(
          title: Text(
            title1,
            style: const TextStyle(color: Colors.white,fontSize: 20),
          ),
          trailing: icon1,
        );
  }
}
