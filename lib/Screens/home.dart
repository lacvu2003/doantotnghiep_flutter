import 'package:doantotnghiep/data/listdata.dart';
import 'package:doantotnghiep/data/model/add_date.dart';
import 'package:doantotnghiep/data/utlity.dart';
import 'package:doantotnghiep/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var history;

  final box = Hive.box<Add_data>('data');

  final List<String> day = [
    'Thứ hai',
    "Thứ ba",
    "Thứ tư",
    "Thứ năm",
    'Thứ sáu',
    'Thứ bảy',
    'Chủ nhật'
  ];

  String name = "";
  Future getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString('username')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, value, child) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                        height: 350,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 240,
                                  decoration: BoxDecoration(
                                      color: AppColor.mainColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Stack(children: [
                                    Positioned(
                                        top: 35,
                                        left: 345,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            color: Color.fromRGBO(
                                                250, 250, 250, 0.1),
                                            child: Icon(
                                              Icons.notification_add_outlined,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Chào mừng bạn trở lại',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    225, 224, 223, 223)),
                                          ),
                                          Row(
                                            children: [
                                              Center(
                                                child: name == ''
                                                    ? Text('')
                                                    : Text(
                                                        name,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 35,
                                                            color:
                                                                Color.fromARGB(
                                                                    225,
                                                                    224,
                                                                    223,
                                                                    223)),
                                                      ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 160,
                              left: 31,
                              child: Container(
                                width: 350,
                                height: 170,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(47, 125, 121, 0.3),
                                        offset: Offset(0, 6),
                                        blurRadius: 12,
                                        spreadRadius: 6,
                                      ),
                                    ],
                                    color:
                                        const Color.fromARGB(255, 20, 88, 20),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Tổng số dư',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Colors.white)),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Text('\đ ${total()}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 22,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor: Color.fromARGB(
                                                  255, 85, 145, 141),
                                              child: Icon(
                                                Icons.arrow_downward,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text('Thu nhập',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 216, 216, 216))),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor: Color.fromARGB(
                                                  255, 85, 145, 141),
                                              child: Icon(
                                                Icons.arrow_upward,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text('Chi tiêu',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 216, 216, 216))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 23),
                                        child: Text('\đ ${income()}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text('\đ ${expenses()}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.white)),
                                      )
                                    ],
                                  )
                                ]),
                              ),
                            )
                          ],
                        )),
                  ),
                  //tạo dòng chữ lịch sử giao dịch
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Lịch sử giao dịch",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  color: Colors.black)),
                          Text("See all",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  // gọi lại list geter để show thông tin
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      history = box.values.toList()[index];
                      return getList(history, index);
                    },
                    childCount: box.length,
                  ))
                ],
              );
            }),
      ),
    );
  }

  Widget getList(Add_data history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: get(index, history));
  }

  ListTile get(int index, Add_data history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          'images/${history.name}.png',
          height: 40,
        ),
      ),
      title: Text(
        history.name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${day[history.datetime.weekday - 1]}  ${history.datetime.day}-${history.datetime.month}-${history.datetime.year}',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(history.explain)
        ],
      ),
      trailing: Text(history.amount,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color:
                  history.IN == 'Thu nhập' ? AppColor.mainColor : Colors.red)),
    );
  }

  //widget head gồm phần đầu cho tới hết card
  // Widget _head() {
  //   return Stack(
  //     children: [
  //       Column(
  //         children: [
  //           Container(
  //             width: double.infinity,
  //             height: 240,
  //             decoration: BoxDecoration(
  //                 color: Color(0xff368983),
  //                 borderRadius: BorderRadius.only(
  //                     bottomLeft: Radius.circular(20),
  //                     bottomRight: Radius.circular(20))),
  //             child: Stack(children: [
  //               Positioned(
  //                   top: 35,
  //                   left: 345,
  //                   child: ClipRRect(
  //                     borderRadius: BorderRadius.circular(7),
  //                     child: Container(
  //                       height: 40,
  //                       width: 40,
  //                       color: Color.fromRGBO(250, 250, 250, 0.1),
  //                       child: Icon(
  //                         Icons.notification_add_outlined,
  //                         size: 30,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   )),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 30, left: 10),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       'Chào mừng bạn trở lại',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 16,
  //                           color: Color.fromARGB(225, 224, 223, 223)),
  //                     ),
  //                     Text(
  //                       '',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 22,
  //                           color: Colors.white),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ]),
  //           ),
  //         ],
  //       ),
  //       Positioned(
  //         top: 160,
  //         left: 31,
  //         child: Container(
  //           width: 350,
  //           height: 170,
  //           decoration: BoxDecoration(
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Color.fromRGBO(47, 125, 121, 0.3),
  //                   offset: Offset(0, 6),
  //                   blurRadius: 12,
  //                   spreadRadius: 6,
  //                 ),
  //               ],
  //               color: Color.fromARGB(255, 47, 125, 121),
  //               borderRadius: BorderRadius.circular(15)),
  //           child: Column(children: [
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 15),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text('Tổng số dư',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 16,
  //                           color: Colors.white)),
  //                   Icon(
  //                     Icons.more_horiz,
  //                     color: Colors.white,
  //                   )
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: 7,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 15),
  //               child: Row(
  //                 children: [
  //                   Text('\đ ${total()}',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 22,
  //                           color: Colors.white))
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: 17,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 15),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       CircleAvatar(
  //                         radius: 13,
  //                         backgroundColor: Color.fromARGB(255, 85, 145, 141),
  //                         child: Icon(
  //                           Icons.arrow_downward,
  //                           color: Colors.white,
  //                           size: 19,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: 7,
  //                       ),
  //                       Text('Thu nhập',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.w500,
  //                               fontSize: 16,
  //                               color: Color.fromARGB(255, 216, 216, 216))),
  //                     ],
  //                   ),
  //                   Row(
  //                     children: [
  //                       CircleAvatar(
  //                         radius: 13,
  //                         backgroundColor: Color.fromARGB(255, 85, 145, 141),
  //                         child: Icon(
  //                           Icons.arrow_upward,
  //                           color: Colors.white,
  //                           size: 19,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: 7,
  //                       ),
  //                       Text('Chi tiêu',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.w500,
  //                               fontSize: 16,
  //                               color: Color.fromARGB(255, 216, 216, 216))),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 23),
  //                   child: Text('\đ ${income()}',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 18,
  //                           color: Colors.white)),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 15),
  //                   child: Text('\đ ${expenses()}',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 18,
  //                           color: Colors.white)),
  //                 )
  //               ],
  //             )
  //           ]),
  //         ),
  //       )
  //     ],
  //   );
  // }
}
