import 'package:doantotnghiep/Screens/introduce.dart';
import 'package:doantotnghiep/Screens/landing.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String user = "";
  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      user = preferences.getString('username')!;
    });
  }

  Future logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(50),
            // width: double.infinity,
            // height: 150,
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(20),
            //         bottomRight: Radius.circular(20)),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.5),
            //         spreadRadius: 5,
            //         blurRadius: 7,
            //         offset: Offset(0, 3),
            //       )
            //     ]),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    child: Image.asset('images/user.png'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      user == ''
                          ? Text('')
                          : Text(
                              user,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                      Text('Thành viên bạc'),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 350,
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                width: double.infinity,
                height: 120,
                child: Column(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Introduce()));
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset('images/gioithieu.png'),
                          width: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Giới thiệu",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        Divider(
                          color: const Color.fromARGB(76, 0, 0, 0),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      logout();
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset('images/logout.png'),
                          width: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Đăng xuất",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
