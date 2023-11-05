import 'package:doantotnghiep/data/model/add_date.dart';
import 'package:doantotnghiep/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final box = Hive.box<Add_data>('data');
  DateTime date = new DateTime.now();
  String? selectItem;
  String? selectItemi;
  final TextEditingController ghichu = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController sotien = TextEditingController();
  FocusNode sotien_ = FocusNode();
  final List<String> _item = [
    'Ăn uống',
    'Giao dịch',
    'Du lịch',
    'Học tập',
    'Hóa đơn nước',
    'Hóa đơn điện',
    'Mua sắm',
    'Sức khỏe'
  ];
  final List<String> _itemei = ['Thu nhập', 'Chi tiêu'];

  @override
  void initState() {
    ex.addListener(() {
      setState(() {});
    });
    sotien_.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          background_color_add(context),
          Positioned(
            top: 150,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              width: 340,
              height: 550,
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                name(),
                SizedBox(
                  height: 30,
                ),
                GhiChu(),
                SizedBox(
                  height: 30,
                ),
                SoTien(),
                SizedBox(
                  height: 30,
                ),
                How(),
                SizedBox(
                  height: 30,
                ),
                date_time(context),
                SizedBox(
                  height: 30,
                ),
                Spacer(),
                btnSave(),
                SizedBox(
                  height: 20,
                )
              ]),
            ),
          )
        ],
      )),
    );
  }

  GestureDetector btnSave() {
    return GestureDetector(
      onTap: () {
        var add =
            Add_data(selectItemi!, sotien.text, date, ghichu.text, selectItem!);
        box.add(add);
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColor.mainColor),
        width: 120,
        height: 50,
        child: Text(
          'Thêm',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }

  Container date_time(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffC5C5C5))),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2023),
              lastDate: DateTime(2100));
          if (newDate == Null) return;
          setState(() {
            date = newDate!;
          });
        },
        child: Text(
          'Ngày:   ${date.day} / ${date.month} / ${date.year}',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }

  Padding How() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Color(0xffC5C5C5))),
          child: DropdownButton<String>(
            value: selectItemi,
            onChanged: ((value) {
              setState(() {
                selectItemi = value!;
              });
            }),
            items: _itemei
                .map((e) => DropdownMenuItem(
                      child: Container(
                        child: Row(
                          children: [
                            Container(

                                // child: Image.asset('images/${e}.png'),
                                ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Text(
                              e,
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
            selectedItemBuilder: (BuildContext context) => _itemei
                .map((e) => Row(
                      children: [
                        Container(
                            // width: 42,
                            // child: Image.asset('images/${e}.png'),
                            ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(e)
                      ],
                    ))
                .toList(),
            hint: Text(
              'Chọn loại thu chi',
              style: TextStyle(color: Colors.grey),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            // onChanged: ((value) {
            //   setState(() {
            //     selectItemi = value!;
            //   });
            // }),
          )),
    );
  }

  Padding SoTien() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
          keyboardType: TextInputType.number,
          focusNode: sotien_,
          controller: sotien,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'Số tiền',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color(0xff368983))),
          )),
    );
  }

  Padding GhiChu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
          controller: ghichu,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              labelText: 'Ghi chú',
              labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2, color: Color(0xff368983))))),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Color(0xffC5C5C5))),
          child: DropdownButton<String>(
            value: selectItem,
            items: _item
                .map((e) => DropdownMenuItem(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              child: Image.asset('images/${e}.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              e,
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
            selectedItemBuilder: (BuildContext context) => _item
                .map((e) => Row(
                      children: [
                        Container(
                          width: 42,
                          child: Image.asset('images/${e}.png'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(e)
                      ],
                    ))
                .toList(),
            hint: Text(
              'Chọn chi tiêu',
              style: TextStyle(color: Colors.grey),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            onChanged: ((value) {
              setState(() {
                selectItem = value!;
              });
            }),
          )),
    );
  }

  Column background_color_add(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
              color: AppColor.mainColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Thêm thu chi',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.attach_file_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
