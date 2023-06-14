import 'package:fit_book/home/widgets/recommend_book_list.dart';
import 'package:fit_book/utils/colors.dart';
import 'package:fit_book/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 50,
                      color: KColors.grey,
                    ),
                    kSmW,
                    Text(
                      '홍길동 님',
                      style: kLabelTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                RecommendBookList('인사·노무 담당자의 추천도서'),
                SizedBox(
                  height: 45,
                ),
                RecommendBookList('우리 회사에서 많이 읽는 책'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
