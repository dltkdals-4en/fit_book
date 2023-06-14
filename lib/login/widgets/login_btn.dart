import 'package:fit_book/providers/fb_helper.dart';
import 'package:fit_book/providers/login_provider.dart';
import 'package:fit_book/routes/routes.dart';
import 'package:fit_book/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var login = Provider.of<LoginProvider>(context);
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            // if(login.id=='admin'&&login.pw == 'admin'){
            //   Navigator.of(context).pushNamed(Routes.root);
            // }
            if(login.id !=null && login.pw != null) {
              await FbHelper().fbLogin(login.id!, login.pw!).then((value) => Navigator.of(context).pushNamed(Routes.root));
            }
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(size.width/3,32),
            backgroundColor: KColors.lightPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text('로그인'),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size(size.width/3,32),
            backgroundColor: KColors.lightPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text('회원가입'),
        ),
      ],
    );
  }
}
