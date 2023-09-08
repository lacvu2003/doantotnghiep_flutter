import 'dart:convert';
import 'package:doantotnghiep/LandingPage/dangnhap.dart';
import 'package:doantotnghiep/values/app_colors.dart';
import 'package:doantotnghiep/values/app_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();

  Future register() async {
    var url = "http://192.168.1.224/doantotnghiep/register";
    var response = await http.post(Uri.parse(url), body: {
      "username": user.text,
      "password": password.text,
    });

    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "User Already",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 220,
                      height: 50,
                      child: TextField(
                        controller: user,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Container(
                      width: 220,
                      height: 50,
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 220,
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainColor,
                      ),
                      onPressed: () {
                        register();
                      },
                      child: Text(
                        "Đăng ký",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Đã có tài khoản ?",
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: Text(
                                "Đăng nhập",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.mainColor),
                              ))
                        ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "Or",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(children: [
                Container(
                  width: 150,
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      )),
                    ),
                    onPressed: () {},
                    label: Text(
                      "Facebook",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: ElevatedButton.icon(
                    icon: new Image.asset(
                      "assets/icon/gmail.png",
                      width: 20,
                      height: 20,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red),
                      )),
                    ),
                    onPressed: () {},
                    label: Text(
                      "Email",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: ElevatedButton.icon(
                    icon: new Image.asset(
                      "assets/icon/github.png",
                      width: 30,
                      height: 30,
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        )),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    label: Text(
                      "Github",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
