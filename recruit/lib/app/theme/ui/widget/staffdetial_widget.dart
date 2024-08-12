import 'package:flutter/material.dart';
import 'package:recruit/app/data/model/progrees_model.dart';
import 'package:recruit/app/theme/ui/button/countdown_button.dart';
import 'package:recruit/app/theme/ui/widget/fixed_divider.dart';
import 'package:recruit/app/theme/ui/widget/full_grey_divider.dart';
import 'package:recruit/app/theme/ui/widget/staffdetail_bottomwidget.dart';
import 'package:recruit/app/theme/ui/widget/staffdetail_prepare_button.dart';
import 'package:recruit/app/theme/ui/widget/staffdetail_titledesc_widget.dart';
import 'package:recruit/app/theme/ui/widget/staffdetail_top_image.dart';
import 'package:recruit/app/theme/ui/widget/staffdetail_treatment_widget.dart';
import 'package:recruit/app/theme/ui/widget/staffdetailevaluation_widget.dart';
import 'package:recruit/app/theme/ui/widget/stafffdetail_mapwidget.dart';
import 'package:recruit/app/theme/ui/widget/textDes_widget.dart';

class StaffDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProgressModel model = ProgressModel(
      title: "就業スタッフの評価",
      items: [
        ProgressItem(type: 5, value: 53),
        ProgressItem(type: 4, value: 11),
        ProgressItem(type: 3, value: 1),
        ProgressItem(type: 2, value: 0),
        ProgressItem(type: 1, value: 0),
      ],
      sum: 65,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 控件1：图片
              StaffDetailTopImage(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2017/08/30/17/26/please-2697951_1280.jpg', // 示例图片链接
              ),
              Padding(
                padding: EdgeInsets.all(15), // 设置水平内边距
                child: CountdownButton(
                    endTime: DateTime.now().add(Duration(minutes: 20))),
              ),
              // 控件3：字符串和图标
              TextDesWidget(
                title: '[未経験者歓迎！]スタッフ募集（仮）',
                iconTextPairs: [
                  [Icons.star, '10:00~11:00（休憩なし）'],
                  [Icons.home, '大阪市北区浪花町'],
                  [Icons.settings, '時給1,000円'],
                ],
              ),
              FixedDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                child: Text(
                  '待遇',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              StaffDetailTreatmentWidget(),
              FixedDivider(),
              // 控件4：两个字符串
              StaffDetailTitleDescWidget(
                title: '業務内容',
                description: '業務内容が入ります。\n'
                    'コンビニでの勤務スタッフです！\n'
                    '主にレジ業務をお願いします！\n'
                    '☆業務経験のある方は優遇します！\n'
                    '業務内容が入ります。',
              ),
              FixedDivider(),
              StaffDetailTitleDescWidget(
                title: '注意事項',
                description: '注意事項が入ります。\n'
                    '丁寧な言葉づかいができる方\n'
                    '注意事項が入ります。',
              ),
              FixedDivider(),
              StaffDetailTitleDescWidget(
                title: '備考',
                description: '備考欄に文章が入ります。\n'
                    '備考欄に文章が入ります。\n'
                    '備考欄に文章が入ります。',
              ),
              StaffDetailPrepareButton(
                title: '労働条件通知書を確認する',
                icon: Icons.drive_file_move_outline,
                isHighlight: true,
                onPressed: () {},
              ),
              Center(
                child: StaffDetailPrepareButton(
                  title: '  （添付書類）を確認する  ',
                  icon: Icons.drive_file_move_outline,
                  isHighlight: false,
                  onPressed: () {},
                ),
              ),
              Center(
                child: StaffDetailPrepareButton(
                  title: '  （添付書類）を確認する  ',
                  icon: Icons.drive_file_move_outline,
                  isHighlight: false,
                  onPressed: () {},
                ),
              ),
              FixedDivider(),
              StafffDetailMapWidget(
                title: 'アクセス',
                description: '大阪府大阪市北区OOO',
                imageUrl:
                    'https://i0.wp.com/suku3c.com/wp-content/uploads/2020/07/Google-map.jpg?w=768&ssl=1',
                onButtonPressed: () {
                  // 在这里处理按钮点击事件
                  print('按钮被点击');
                },
              ),
              FixedDivider(),
              StaffDetailEvaluationWidget(progressModel: model),
              FullGreyDivider(),
              StaffDetailBottomWidget(
                buttonText: '応募する',
                onMainButtonPressed: () {
                  // 主按钮点击事件
                  print('Main button pressed');
                },
                onFavoriteButtonPressed: () {
                  // 爱心按钮点击事件
                  print('Favorite button pressed');
                },
                onSettingsButtonPressed: () {
                  // 设置按钮点击事件
                  print('Settings button pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
