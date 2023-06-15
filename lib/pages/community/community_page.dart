import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
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
              height: 60,
            ),
            Text(
              '전체 커뮤니티',
              style: kBtnTextStyle.copyWith(fontSize: 14, color: KColors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: size.width,
              height: 200,
              decoration: BoxDecoration(
                color: KColors.backgroundGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '아직 등록된 커뮤니티가 없어요!',
                  style: kContentTextStyle.copyWith(
                      fontSize: 24, color: KColors.textGrey),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              '내 커뮤니티',
              style: kBtnTextStyle.copyWith(fontSize: 14, color: KColors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (size.width - 50) / 2,
                  height: 200,
                  decoration: BoxDecoration(
                    color: KColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: (size.width - 50) / 2,
                  height: 200,
                  decoration: BoxDecoration(
                    color: KColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
