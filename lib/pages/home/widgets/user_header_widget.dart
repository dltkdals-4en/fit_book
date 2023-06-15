import 'package:fit_book/providers/server_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var server = Provider.of<ServerDataProvider>(context);
    return Row(
      children: [
        Icon(
          Icons.account_circle,
          size: 50,
          color: KColors.grey,
        ),
        kSmW,
        Text(
          '${server.user?.userName??''}',
          style: kLabelTextStyle.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
