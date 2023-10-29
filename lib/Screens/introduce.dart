import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class Introduce extends StatefulWidget {
  const Introduce({super.key});

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  final url = Uri.parse('https://github.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giới thiệu"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.grey[300],
            ),
            width: double.infinity,
            height: 500,
            child: Column(
              children: [
                Image.asset(
                  'assets/image/imageapp/logo.png',
                  width: 200,
                ),
                Text("Version 1.0.0"),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "by Long Vũ và Tấn Tài",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "SmartMoney là một ứng dụng quản lý tài chính, cho phép người dùng thêm, xóa các chi tiêu và thu nhập hàng ngày, tháng, năm của cá nhân. Hiện rõ tổng số tiền và các khoản thu chi, có biểu đồ để dễ kiểm soát chi tiêu của cá nhân một cách rõ ràng.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 200,
            // color: Colors.red,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          child: Link(
                              uri: Uri.parse(
                                  'https://github.com/lacvu2003/doantotnghiep_flutter'),
                              builder: (context, link) => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  onPressed: link,
                                  child: Text(
                                    'Github code',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
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
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
