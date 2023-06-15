import 'package:fit_book/providers/server_data_provider.dart';
import 'package:fit_book/utils/colors.dart';
import 'package:fit_book/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ServerDataProvider>(context);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 100,
              color: KColors.grey,
            ),
            Text(
              '${data.user?.userName ?? ""}',
              style: kHeaderTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              '@${data.user?.userNickname ?? ""}',
              style: kHeaderTextStyle.copyWith(
                  fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Text(
              '${data.user?.userPosition ?? ""}|${data.user?.userCompany ?? ""}',
              style: kContentTextStyle.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (size.width - 50) / 2,
                  height: 70,
                  decoration: BoxDecoration(
                    color: KColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    '읽고 싶은 책',
                    style: kBtnTextStyle.copyWith(color: KColors.black),
                  )),
                ),
                Container(
                  width: (size.width - 50) / 2,
                  height: 70,
                  decoration: BoxDecoration(
                    color: KColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    '읽고 있는 책',
                    style: kBtnTextStyle.copyWith(color: KColors.black),
                  )),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (size.width - 50) / 2,
                  height: 70,
                  decoration: BoxDecoration(
                    color: KColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    '평가한 책',
                    style: kBtnTextStyle.copyWith(color: KColors.black),
                  )),
                ),
                Container(
                  width: (size.width - 50) / 2,
                  height: 70,
                  decoration: BoxDecoration(
                    color: KColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    '스크랩한 리뷰',
                    style: kBtnTextStyle.copyWith(color: KColors.black),
                  )),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: size.width,
              height: 205,
              color: KColors.grey,
              child: Center(
                child: Text(
                  '신간 도서 광고 배너',
                  style: kBtnTextStyle.copyWith(color: KColors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
