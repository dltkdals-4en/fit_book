import 'package:fit_book/providers/home_provider.dart';
import 'package:fit_book/providers/server_data_provider.dart';
import 'package:fit_book/publish/publish_page.dart';
import 'package:fit_book/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var home = Provider.of<HomeProvider>(context);
    var server = Provider.of<ServerDataProvider>(context);
    if (server.getBooks == false) {
      server.getBookList();
      server.bookList = home.bookList;
    }
    return Scaffold(
      body: home.pageWidget.elementAt(home.pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: home.pageIndex,
        onTap: (value) {
          if (value == 2) {
            showModalBottomSheet(
              isDismissible: false,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              context: context,
              builder: (context) {
                return PublishPage();
              },
            );
          } else {
            home.changePage(value);
          }
        },
        unselectedIconTheme: const IconThemeData(
          color: KColors.black,
        ),
        selectedIconTheme: IconThemeData(
          color: KColors.lightPrimary,
        ),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
              label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30,
            ),
            label: 'community',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outlined,
              size: 30,
            ),
            label: 'publish',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'mypage',
          ),
        ],
      ),
    );
  }
}
