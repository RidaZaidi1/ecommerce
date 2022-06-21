import 'package:ecommerce_app/allcolors.dart';
import 'package:ecommerce_app/auth/custoum_button.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  FocusNode myfocusnode1 = FocusNode();
  FocusNode myfocusnode2 = FocusNode();
  FocusNode myfocusnode3 = FocusNode();
  TextEditingController nameC = TextEditingController();
  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();

  int groupvalue = 0;
  // int val = -1;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text(
            "Customer",
            // style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          value: "Customer"),
      const DropdownMenuItem(child: Text("Vander"), value: "Vander"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String? selectedValue;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: AllColors.primarycolor,
      //   title: Text("Register"),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            Image.asset(
              "images/ecom-cart.gif",
              height: height * 0.3,
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
                        "Name",
                        Icon(
                          Icons.person,
                          color: AllColors.primarycolor,
                        ),
                        nameC,
                        "this field can not be empty",
                        myfocusnode1),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: height * 0.075,
                      width: width * 0.5,
                      child: DropdownButtonFormField(
                          hint: const Text("Select"),
                          disabledHint: Text("Select"),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 1),
                            ),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // filled: true,
                            // fillColor: AllColors.primarycolor,
                          ),
                          validator: (value) =>
                              value == null ? "Select a country" : null,
                          // dropdownColor: AllColors.primarycolor,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: dropdownItems),
                    ),
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
                          name: "Register",
                          onpress: () {
                            Navigator.pushNamed(context, "/login");
                            // if (_dropdownFormKey.currentState!.validate()) {
                            //   //valid flow
                            // }
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
          focusNode: focusnode,
          controller: conterollers,
          // onChanged: (value) {
          //   setState(() {
          //     nameC == value;
          //   });
          // },
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
            labelText: title,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w900,
              color: focusnode!.hasFocus ? AllColors.primarycolor : Colors.grey,
              fontSize: 15,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AllColors.primarycolor),
              borderRadius: BorderRadius.circular(15),
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
