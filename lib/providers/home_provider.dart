import 'package:fit_book/models/book_model.dart';
import 'package:fit_book/providers/fb_helper.dart';

import 'package:flutter/material.dart';

import '../pages/community/community_page.dart';
import '../pages/home/home.dart';
import '../pages/mypage/mypage.dart';
import '../pages/search/search_page.dart';

class HomeProvider with ChangeNotifier {
  List<BookModel> bookList = [];
  List<BookModel> searchBookList =[];
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

  Future<void> fbSaveTag() async {}

  Future<void> updateBookTag() async {
    await FbHelper().updateBookTag(seletedBook, selectedTag).then((value) {
      selectedTag = '';
      seletedBook = '';
      searchText = '';
      notifyListeners();
    });
  }

  void sortBookList() {
    searchBookList = bookList.where((element) => element.bookName!.contains(searchText)).toList();
    notifyListeners();
  }
}
