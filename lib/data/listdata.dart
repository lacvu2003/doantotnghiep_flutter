import 'package:doantotnghiep/data/1.dart';

//tạo list geter gồm tên, hình ảnh, thu nhập, chi tiêu, thời gian thu chi
List<money> geter() {
  money upwork = money();
  upwork.name = 'dạy thêm';
  upwork.fee = '\đ 1,450,000';
  upwork.time = 'Hôm nay';
  upwork.image = 'Education.png';
  upwork.buy = false;
  money starbucks = money();
  starbucks.buy = true;
  starbucks.fee = '\đ 100,000';
  starbucks.image = 'Food.png';
  starbucks.name = 'starbucks';
  starbucks.time = 'Hôm nay';
  return [upwork, starbucks];
}
