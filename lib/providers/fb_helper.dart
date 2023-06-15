import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FbHelper {
  FbHelper._();

  static final FbHelper _fb = FbHelper._();

  factory FbHelper() => _fb;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  Future<QuerySnapshot<Map<String, dynamic>>> getUserInfo() async {
    return await _firestore.collection('user').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getBookInfo() async {
    return await _firestore.collection('book').get();
  }

  Future<void> insertBookComment() async {}

  Future<void> fbLogin(String email, String pw) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pw);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void login(String? id, String? pw) {}

  Future<void> tryLogin(String? id, String? pw) async {
    print('$id ++ $pw');
    var i = _firestore
        .collection('user')
        .where('userId', isEqualTo: id)
        .where('userPw', isEqualTo: pw);
    print(i);
  }

  Future<void> updateBookTag(String seletedBook, String selectedTag) async {
    await _firestore.collection('book').doc(seletedBook).update({'keywordId': selectedTag});
  }
}
