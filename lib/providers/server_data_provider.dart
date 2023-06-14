import 'package:firebase_storage/firebase_storage.dart';
import 'package:fit_book/models/book_model.dart';
import 'package:fit_book/providers/fb_helper.dart';
import 'package:flutter/cupertino.dart';

class ServerDataProvider with ChangeNotifier {
  final storageRef = FirebaseStorage.instance.ref();
  List<BookModel> bookList = [];
  bool getBooks = false;

  Future<void> getImage(String s) async {
    var url = FirebaseStorage.instance.refFromURL(s);
  }

  Future<void> getBookList() async {
    if(bookList.isNotEmpty)bookList.clear();
    await FbHelper().getBookInfo().then((value) {
      value.docs.forEach((element) {
        print(element.id);
        bookList.add(BookModel.fromJson(element.data(), element.id));
      });
    }).then((value) {
      getBooks = true;
      notifyListeners();
    });
  }
}
