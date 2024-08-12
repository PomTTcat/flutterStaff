import 'package:flutter/material.dart';
import 'package:recruit/app/data/model/staffgriditem_model.dart';
import 'package:recruit/app/theme/ui/widget/staffdetaiL_griditem_widget.dart';

class StaffDetailTreatmentWidget extends StatelessWidget {
  // 创建一个模型数组
  final List<StaffGridItemModel> items = [
    StaffGridItemModel(icon: Icons.home, text: '交通費支給'),
    StaffGridItemModel(icon: Icons.star, text: '高校生歓迎'),
    StaffGridItemModel(icon: Icons.settings, text: '車通勤可'),
    StaffGridItemModel(icon: Icons.info, text: '未経験者歓迎'),
    StaffGridItemModel(icon: Icons.contact_mail, text: '制服あり'),
    StaffGridItemModel(icon: Icons.help, text: 'バイク\n自転車通勤可'),
    StaffGridItemModel(icon: Icons.camera, text: 'シニア歓迎'),
    StaffGridItemModel(icon: Icons.map, text: 'ネイルOK'),
    StaffGridItemModel(icon: Icons.alarm, text: '髪色自由'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        shrinkWrap: true, // 允许GridView根据其内容调整大小
        physics: NeverScrollableScrollPhysics(), // 禁止GridView自身滚动
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 每行4个元素
          childAspectRatio: 1 / 1, // 宽高比为1:0.8
          crossAxisSpacing: 8.0, // 列间距
          mainAxisSpacing: 8.0, // 行间距
        ),
        itemCount: items.length, // 根据数据项的数量生成相应的网格项
        itemBuilder: (context, index) {
          return StaffDetailGridItemWidget(
            model: items[index],
          );
        },
      ),
    );
  }
}
