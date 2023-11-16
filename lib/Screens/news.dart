import 'package:doantotnghiep/values/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher_string.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tin tức',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Chứng khoán có phiên tăng vọt, vì sao vẫn khó hi vọng phục hồi mạnh?',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => launchUrlString(
                                              'https://tuoitre.vn/chung-khoan-co-phien-tang-vot-vi-sao-van-kho-hi-vong-phuc-hoi-manh-20231105090132475.htm'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Báo Tuổi trẻ")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFE0E0E0)),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          'images/chungkhoan.jpg',
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Việt Nam đã làm câm lặng đám đông lịch sử ở Rizal Memorial',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => launchUrlString(
                                              'https://tuoitre.vn/viet-nam-da-lam-cam-lang-dam-dong-lich-su-o-rizal-memorial-20231116204809695.htm'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Báo Tuổi trẻ")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFE0E0E0)),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          'images/vietnam.webp',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Bán hơn nửa triệu tấn hạt điều, Việt Nam thu về 2,95 tỷ USD',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => launchUrlString(
                                              'https://vietnamnet.vn/ban-hon-nua-trieu-tan-hat-dieu-viet-nam-thu-ve-2-95-ty-usd-2214415.html'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Báo Vietnamnet")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFE0E0E0)),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          'images/tintucvnn.png',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Viettel ghi danh trên bản đồ bảo mật thế giới',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => launchUrlString(
                                              'https://tuoitre.vn/hacker-viettel-ghi-danh-len-ban-do-the-gioi-20231110102155982.htm'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Báo Tuổi trẻ")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFE0E0E0)),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          'images/viettel.webp',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Liên Hiệp Quốc muốn điều tra quốc tế về xung đột Israel - Hamas, Tel Aviv bác bỏ',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => launchUrlString(
                                              'https://tuoitre.vn/lien-hiep-quoc-muon-dieu-tra-quoc-te-ve-xung-dot-israel-hamas-tel-aviv-bac-bo-20231116210917182.htm'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Báo Tuổi trẻ")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFE0E0E0)),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          'images/chientranh.webp',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Khách quốc tế đến Việt Nam chơi golf, trung bình chi hơn 500 USD/ngày',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => launchUrlString(
                                              'https://tuoitre.vn/khach-quoc-te-den-viet-nam-choi-golf-trung-binh-chi-hon-500-usd-ngay-20231115161851979.htm'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Báo Tuổi trẻ")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFE0E0E0)),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          'images/goft.webp',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
