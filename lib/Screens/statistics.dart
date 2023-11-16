import 'package:doantotnghiep/data/model/add_date.dart';
import 'package:doantotnghiep/data/top.dart';
import 'package:doantotnghiep/data/utlity.dart';
import 'package:doantotnghiep/values/app_colors.dart';
import 'package:doantotnghiep/widgets/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

ValueNotifier kj = ValueNotifier(0);

class _StatisticsState extends State<Statistics> {
  List day = ['Ngày', 'Tuần', 'Tháng', 'Năm'];
  List f = [today(), week(), month(), year()];
  List<Add_data> a = [];
  int index_color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (BuildContext context, dynamic value, Widget? child) {
            a = f[value];
            return custum();
          }),
    ));
  }

  CustomScrollView custum() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Biểu đồ thu chi",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          index_color = index;
                          kj.value = index;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index_color == index
                                ? AppColor.mainColor
                                : Colors.white),
                        alignment: Alignment.center,
                        child: Text(day[index],
                            style: TextStyle(
                                color: index_color == index
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                      ),
                    );
                  })
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Chi phí',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.grey,
                          )
                        ]),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Chart(indexx: index_color),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chi tiêu nhiều nhất',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.swap_vert,
                    size: 25,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ]),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              leading: Image.asset('images/${a[index].name}.png'),
              title: Text(a[index].name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              subtitle: Text(
                  ' ${a[index].datetime.day}-${a[index].datetime.month}-${a[index].datetime.year}',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: Text(a[index].amount,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: a[index].IN == 'Thu nhập'
                          ? Colors.green
                          : Colors.red)),
            );
          },
          childCount: a.length,
        ))
      ],
    );
  }
}
