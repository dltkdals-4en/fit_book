import 'package:fit_book/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/book_details/book_details_page.dart';
import '../pages/login/login_page.dart';
import '../pages/mypage/mypage.dart';
import '../pages/root/root.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (context) => Root(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case Routes.bookDetails:
        return MaterialPageRoute(
          builder: (context) => BookDetailsPage(),
        );
      // case Routes.splash:
      //   return MaterialPageRoute(
      //     builder: (context) => SplashPage(),
      //   );
      case Routes.mypage:
        return MaterialPageRoute(
          builder: (context) => Mypage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
