import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:fit_book/pages/home/widgets/user_header_widget.dart';
import 'package:fit_book/providers/home_provider.dart';
import 'package:fit_book/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var home = Provider.of<HomeProvider>(context);
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            UserHeaderWidget(),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 45,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    size: 25,
                    color: KColors.lightPrimary,
                  ),
                  contentPadding: EdgeInsets.only(top: 15, left: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: KColors.lightPrimary,
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: KColors.lightPrimary,
                      width: 1.5,
                    ),
                  ),
                  hintText: '도서 검색',
                  hintStyle: kContentTextStyle.copyWith(
                      fontSize: 24, color: KColors.lightGrey),
                ),
                onChanged: (value) {
                  home.changeSearchText(value);
                  home.sortBookList();
                },
                onEditingComplete: () {
                  home.searchBook();
                  home.sortBookList();
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: home.searchBookList.length,
              itemBuilder: (context, index) {
                var book = home.searchBookList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        color: KColors.backgroundGrey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image(
                            width: 100,
                            height: 150,
                            image: FirebaseImageProvider(
                              FirebaseUrl('gs://hyapp-3137e.appspot.com/${home.bookList[index].bookId}.png'),
                              options: CacheOptions(
                                  source: Source.server
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width:  size.width-(200),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${book.bookName}',
                                  style: kHeaderTextStyle.copyWith(fontSize: 20),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${book.bookAuthor}',
                                  style: kHeaderTextStyle.copyWith(fontSize: 20),
                                ),
                                Text(
                                  '${book.bookPublisher}',
                                  style: kHeaderTextStyle.copyWith(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
