import 'package:fit_book/community/community_page.dart';
import 'package:fit_book/models/book_model.dart';
import 'package:fit_book/mypage/mypage.dart';
import 'package:fit_book/publish/publish_page.dart';
import 'package:fit_book/search/search_page.dart';
import 'package:fit_book/utils/colors.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class HomeProvider with ChangeNotifier {
  List<BookModel> bookList = [];

  List<Widget> pageWidget = [
    Home(),
    CommunityPage(),
    Home(),
    SearchPage(),
    Mypage(),
  ];
  List<String> tagList = [
    '개발',
    '경영 · 비즈니스',
    '마케팅 · 광고',
    'CS',
    '영업',
    'HR',
    '디자인',
    '고객영업',
    '금융',
    '무역',
  ];
  int pageIndex = 0;

  String seletedBook = '';
  String selectedTag = '';
  TextEditingController? _searchController = TextEditingController();
  String searchText = '';


  void changePage(int value) {
    pageIndex = value;
    notifyListeners();
  }

  void searchBook() {
    for (var value in bookList) {
      if (value.bookName!.contains(searchText)) {
        seletedBook = value.bookId!;
        print(seletedBook);
        notifyListeners();
      }
    }
  }

  void changeSearchText(String value) {
    searchText = value;
    notifyListeners();
  }

  void changeselectedTag(int index) {
    selectedTag = tagList[index];
    notifyListeners();
  }
  Future<void> fbSaveTag() async{

  }
}
