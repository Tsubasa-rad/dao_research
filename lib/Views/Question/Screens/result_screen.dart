// ignore_for_file: deprecated_member_use, no_logic_in_create_state, prefer_const_constructors, avoid_unnecessary_containers

import 'package:dao_research/Models/question_text_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:dao_research/Widgets/generate_text.dart';
import 'package:dao_research/Widgets/template_card.dart';
import 'package:dao_research/style.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.title,
    required this.dataList,
    required this.myAnswer,
  });
  final String title;
  final List<Map<String, dynamic>> dataList;

  final List<List> myAnswer;

  @override
  State<ResultScreen> createState() => _ResultScreenState(dataList);
}

class _ResultScreenState extends State<ResultScreen> {
  final List<Map<String, dynamic>> dataList;
  String myAnswerText = "";
  _ResultScreenState(this.dataList);



  @override
  void initState() {
    super.initState();
    myAnswerText = generateText(widget.myAnswer);
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    String chatGPTURL = "https://chat.openai.com/";
    String bardURL = "https://bard.google.com/";
    String researchForm = "https://forms.gle/fD4K3cC8Ubh1NEFB9";

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            // 背景画像の設定
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/dao002.jpg'), 
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
                  TemplateCard(
                    title: "あなたのアンケート結果から入力データを作成",
                    templateText: tempText + myAnswerText,
                    topCard: true,
                    adviceText: "",
                  ),
                  Text(
                    "上記の内容をコピーしてテキスト生成AIへ入力お願いします",
                    style: Styles.textStyle,
                  ),
                  urlButton(
                      context, chatGPTURL, "ChatGPTサイトへ", "OpenAI社のサイトへ遷移します"),
                  urlButton(context, bardURL, "Google Bardサイトへ",
                      "GoogleのBardのサイトへ遷移します"),
                  SizedBox(height: 20),
                  Container(
                    decoration: Styles.redColorFrame,
                    padding: EdgeInsets.all(10),
                    child: urlButton(context, researchForm, "アンケート調査フォームへ",
                        "このシステムの評価にご協力ください"),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: Styles.baseColorFrame,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "アンケート調査フォームでの調査の協力が終了すると今回の調査は、終了です。\nお忙しい中ご対応していただきありがとうございました。",
                      style: Styles.TitleStyle,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
// URLが設定されているボタンの設定
// ボタンを押すとURL先へ画面遷移する
  Container urlButton(
      BuildContext context, String url, String text, String text2) {
    return Container(
      child: Column(
        children: [
          Text(
            text2,
            style: Styles.textStyle,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              try {
                if (await canLaunchUrlString(url)) {
                  await launch(url, forceSafariVC: true, forceWebView: true);
                } else {
                  throw 'このページは、開くことができませんでした';
                }
              } catch (e) {
                final snackBar = SnackBar(
                  content: Text(e.toString()),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
