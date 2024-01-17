import 'package:dao_research/Models/question_text_model.dart';
import 'package:dao_research/Views/Question/Screens/check_box_screen.dart';
import 'package:dao_research/style.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> dataList = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //ホーム画面の背景画像の設定
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image001.jpg'),
                fit: BoxFit.cover, // 画像のフィットモードを指定
              ),
            ),
            child: Stack(
              children: [
                Container(decoration: Styles.homeImageDecoration),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //トップの説明文
                      Text(
                        "DAO(自立分散型組織)とあなたを最適なマッチングを行うために作成されたアンケートになっています",
                        style: Styles.textStyle,
                      ),
                      const SizedBox(height: 15),
                      // 注意事項やプライバシーに関する説明
                      Container(
                        height: size.height / 1.5,
                        decoration: Styles.baseColorFrame,
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            Text(
                              "注意事項,プライバシーについて",
                              style: Styles.textStyle,
                            ),
                            Text(
                              questionText,
                              style: Styles.buttonTextStyle,
                            ),
                          ],
                        )),
                      )
                    ],
                  ),
                ),
                // 同意してアンケートを開始するボタン
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckBoxScreen(
                        title: "_inputText",
                        dataList: dataList,
                      ),
                      fullscreenDialog: true,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("上記の内容に同意して\nアンケートを開始する"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
