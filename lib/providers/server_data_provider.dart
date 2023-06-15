import 'package:firebase_storage/firebase_storage.dart';
import 'package:fit_book/models/book_model.dart';
import 'package:fit_book/models/user_model.dart';
import 'package:fit_book/providers/fb_helper.dart';
import 'package:flutter/cupertino.dart';

class ServerDataProvider with ChangeNotifier {
  final storageRef = FirebaseStorage.instance.ref();
  List<BookModel> bookList = [];
  UserModel? user;
  bool getBooks = false;
  bool getUsers =false;

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
  Future<void> getUser() async {
    if(user != null)user = null;
    await FbHelper().getUserInfo().then((value) {
      user= UserModel.fromJson(value.docs[0].data(),value.docs[0].id);
    }).then((value) {
      getUsers = true;
      notifyListeners();
    });
  }
}
