import 'dart:convert';
import 'dart:math';
// import 'package:doantotnghiep/AppPage/welcome.dart';
// import 'package:doantotnghiep/LandingPage/dangky.dart';
import 'package:doantotnghiep/Screens/home.dart';
import 'package:doantotnghiep/Screens/landing.dart';
import 'package:doantotnghiep/Screens/register.dart';
import 'package:doantotnghiep/values/app_colors.dart';
import 'package:doantotnghiep/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController fullname = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  Future login() async {
    var url = "http://lacvu2003.000webhostapp.com/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "fullname": fullname.text,
      "username": user.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data == "ok") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('username', user.text);
      Fluttertoast.showToast(
          msg: "Đăng nhập thành công",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.mainColor,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Bottom()));
    } else {
      Fluttertoast.showToast(
          msg: "Đăng nhập thất bại",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.mainColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  bool _validate = false;
  bool _validatePass = false;

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Đăng nhập',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColor.mainColor),
                        ),
                        Icon(
                          Icons.attach_file_outlined,
                          color: const Color.fromARGB(0, 255, 255, 255),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Container(
                      width: 320,
                      height: 80,
                      child: TextField(
                        controller: user,
                        decoration: InputDecoration(
                            labelText: 'Tài khoản',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            errorText: (_validate
                                ? "Tài khoản không được trống"
                                : null)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Container(
                      width: 320,
                      height: 80,
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Mật khẩu',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            errorText: (_validatePass
                                ? "Mật khẩu không được trống"
                                : null)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 320,
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainColor,
                      ),
                      onPressed: () {
                        setState(() {
                          if ((_validate = user.text.isEmpty) ||
                              (_validatePass = password.text.isEmpty)) {
                            // Fluttertoast.showToast(
                            //     msg: "Đăng ký không thành công",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.CENTER,
                            //     timeInSecForIosWeb: 1,
                            //     backgroundColor:
                            //         Color.fromARGB(255, 47, 125, 121),
                            //     textColor: Colors.white,
                            //     fontSize: 16.0);
                          } else {
                            login();
                          }
                        });
                      },
                      child: Text(
                        "Đăng nhập",
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
                            "Chưa có tài khoản ?",
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()));
                              },
                              child: Text(
                                "Đăng ký",
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
                  width: 320,
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 320,
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 320,
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
