// プロンプトテンプレートカードの設定
// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:dao_research/Widgets/text_copy_button.dart';
import 'package:dao_research/Widgets/text_length.dart';
import 'package:dao_research/style.dart';
import 'package:flutter/material.dart';

class TemplateCard extends StatefulWidget {
  const TemplateCard({
    super.key,
    required this.title,
    required this.templateText,
    required this.adviceText,
    this.topCard = false,
    this.tapCopy = true,
  });
  final String title, templateText, adviceText;
  final bool topCard, tapCopy;

  @override
  State<TemplateCard> createState() => _TemplateCardState();
}

class _TemplateCardState extends State<TemplateCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(20), // 角丸にする
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              getRandomColor().withOpacity(0.3),
              getRandomColor().withOpacity(1),
            ],
            stops: const [
              0.0,
              1.0,
            ],
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: white,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                    color: black,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: TextLength(
                caption: widget.templateText,
                count: 150,
              ),
            ),
            SizedBox(height: 10),
            widget.topCard
                ? widget.tapCopy
                    ? TextCopyButton(text: widget.templateText)
                    : SizedBox()
                : SizedBox(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Container showAdviceSheet() {
    return Container(
      decoration: BoxDecoration(
        color: baseColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Text(
            "やり方(アドバイス）",
            style: Styles.TitleStyle,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Text(widget.adviceText),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

// 背景の色をランダムに設定
  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}
