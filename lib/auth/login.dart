import 'package:ecommerce_app/allcolors.dart';
import 'package:ecommerce_app/auth/custoum_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey _formkey = GlobalKey<FormState>();

  FocusNode myfocusnode2 = FocusNode();
  FocusNode myfocusnode3 = FocusNode();
  TextEditingController nameC = TextEditingController();
  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: AllColors.primarycolor,
      //   title: Text("Login"),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.07,
            ),
            Image.asset(
              "images/ecom-cart.gif",
              height: height * 0.3,
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: textfields(
                        height,
                        width,
                        "Email",
                        Icon(
                          Icons.email,
                          color: AllColors.primarycolor,
                        ),
                        emailc,
                        "please enter valid email",
                        myfocusnode2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: textfields(
                        height,
                        width,
                        "Password",
                        Icon(
                          Icons.lock,
                          color: AllColors.primarycolor,
                        ),
                        passwordc,
                        "password should be greater then 6 charac",
                        myfocusnode3),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: height * 0.06,
                      width: width * 0.4,
                      child: CustomButton(
                          name: "Signin",
                          onpress: () {
                             Navigator.pushNamed(context, "/home");
                          },
                          backgroundcolor: AllColors.primarycolor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding textfields(double height, double width, String title, Icon icon,
      var conterollers, var check,
      [FocusNode? focusnode]) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 10,
      ),
      child: SizedBox(
        height: height * 0.07,
        child: TextFormField(
          enabled: true,
          focusNode: focusnode,
          controller: conterollers,
          validator: (val) {
            if (val == null) {
              return "fields can not be empty";
            } else if (val == null && check == val.contains("@")) {
              return check;
            } else if (val == null && check > 6) {
              return check;
            }
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AllColors.primarycolor),
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: title,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w900,
              color: focusnode!.hasFocus ? AllColors.primarycolor : Colors.grey,
              fontSize: 15,
            ),
            prefixIcon: icon,
            prefixIconColor: AllColors.primarycolor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
