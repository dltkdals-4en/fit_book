import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:fit_book/providers/home_provider.dart';
import 'package:fit_book/providers/server_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class RecommendBookList extends StatelessWidget {
  const RecommendBookList(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var server = Provider.of<ServerDataProvider>(context);
    var home =Provider.of<HomeProvider>(context);
    return Container(
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kHeaderTextStyle.copyWith(fontSize: 14),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: home.bookList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
                  child: Container(
                    width: 130,
                    height: 220,
                    decoration: BoxDecoration(
                      color: KColors.backgroundGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 150,
                            child: Image(
                              image: FirebaseImageProvider(
                                FirebaseUrl('gs://hyapp-3137e.appspot.com/${home.bookList[index].bookId}.png'),
                                options: CacheOptions(
                                  source: Source.server
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('${home.bookList[index].bookName}', style: kContentTextStyle.copyWith(fontSize: 12),overflow: TextOverflow.ellipsis,maxLines: 1,)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
