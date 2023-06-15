import 'package:fit_book/providers/login_provider.dart';
import 'package:fit_book/utils/colors.dart';
import 'package:fit_book/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputLoginInfo extends StatelessWidget {
  const InputLoginInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var login = Provider.of<LoginProvider>(context);
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID',
              style: kContentTextStyle.copyWith(
                fontSize: 14,
                color: KColors.textGrey,
              ),
            ),
            kSmH,
            Container(
              height: 50,
              child: TextField(
                controller: login.idController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: KColors.lightPrimary,
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: KColors.lightPrimary,
                      width: 1.5,
                    ),
                  ),
                ),
                onChanged: (value) {
                  login.saveId(value);
                },
              ),
            ),
          ],
        ),
        kNorH,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PW',
              style: kContentTextStyle.copyWith(
                fontSize: 14,
                color: KColors.textGrey,
              ),
            ),
            kSmH,
            Container(
              height: 50,
              child: TextField(
                controller: login.pwController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: KColors.lightPrimary,
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: KColors.lightPrimary,
                      width: 1.5,
                    ),
                  ),
                ),
                onChanged: (value) {
                  login.savePw(value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
