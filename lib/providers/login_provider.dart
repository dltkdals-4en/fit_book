import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{
    TextEditingController? idController;
    TextEditingController? pwController;
    String? id;
    String? pw;

  void saveId(String value) {
      id= value;
      notifyListeners();
  }

  void savePw(String value) {
      pw = value;
      notifyListeners();
  }
}