import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
        ],
      ),
    );
  }
}
