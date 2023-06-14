class BookModel{
  String? bookId;
  String? bookName;
  String? bookAuthor;
  String? bookPublisher;
  String? keywordId;

  BookModel({
    this.bookId,
    this.bookName,
    this.bookAuthor,
    this.bookPublisher,
    this.keywordId,
});
  Map<String, dynamic> toMap(){
    return
      {'bookId' : this.bookId,
        'bookName' : this.bookName,
        'bookAuthor' : this.bookAuthor,
        'bookPublisher' : this.bookPublisher,
        'keywordId' : this.keywordId,

    };
  }
  BookModel.fromJson(Map<String,dynamic> json, id){
    bookId = id;
    bookName = json['bookName'];
    bookAuthor = json['bookAuthor'];
    bookPublisher =json['bookPublisher'];
    keywordId = json['keywordId'];
  }
}
