class UserModel {
  String? userId;
  String? userName;
  String? userNickname;
  String? userCompany;
  String? userPosition;
  List<String>? readingBookId;

  UserModel(
      {this.userId,
      this.userName,
      this.userCompany,
      this.userPosition,
      this.readingBookId});

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'userName': this.userName,
      'userNickname': this.userNickname,
      'userCompany': this.userCompany,
      'userPosition': this.userPosition,
      'readingBookId': this.readingBookId,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json, id) {
    this.userId = id;
    this.userName = json['userName'];
    this.userNickname = json['userNickname'];
    this.userCompany = json['userCompany'];
    this.userPosition = json['userPosition'];
    this.readingBookId = json['readingBookId'];
  }
}
