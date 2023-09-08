import 'package:doantotnghiep/LandingPage/dangky.dart';
import 'package:doantotnghiep/LandingPage/dangnhap.dart';
import 'package:doantotnghiep/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List img = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
    "5.png",
  ];

  int _currentIndex = 0;
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //title welcome
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 20),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/image/imageapp/LOGO-SmartMoney.png',
                                  width: 60,
                                  height: 60,
                                ),
                                Text(
                                  "  SMARTMONEY",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: AppColor.mainColor),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                )),
            //image welcome
            Expanded(
              flex: 4,
              child: Container(
                  child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
                itemCount: img.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/image/imageapp/" + img[index]),
                          )),
                    ),
                  );
                },
              )),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 150),
              height: 12,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return buildIndicator(index == _currentIndex, size);
                  }),
            ),

            //button login and register
            Container(
              width: size.width * 0.8,
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.mainColor,
                                foregroundColor: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: Text(
                                "Đăng ký",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            )),
                      )),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: AppColor.mainColor),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Text("Đăng nhập",
                                      style: TextStyle(
                                        color: AppColor.mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      )),
                                )),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 12 : 12,
      decoration: BoxDecoration(
          color: isActive ? AppColor.mainColor : Colors.grey,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
