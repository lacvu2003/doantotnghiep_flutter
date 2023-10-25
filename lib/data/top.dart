import 'package:doantotnghiep/data/1.dart';

List<money> geter_top() {
  money snap_food = money();
  snap_food.name = 'Đồ ăn nhanh';
  snap_food.image = 'Ăn uống.png';
  snap_food.time = '30/09/2023';
  snap_food.buy = true;
  snap_food.fee = '\đ 50,000';

  return [snap_food];
}
