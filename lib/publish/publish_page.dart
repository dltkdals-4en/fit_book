import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:fit_book/providers/home_provider.dart';
import 'package:fit_book/utils/colors.dart';
import 'package:fit_book/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublishPage extends StatelessWidget {
  const PublishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var home = Provider.of<HomeProvider>(context);
    return Container(
      height: size.height * 5 / 6,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '도서명 검색',
                hintStyle: kTagTextStyle.copyWith(
                  color: KColors.textGrey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: KColors.lightPrimary,
                    width: 1.5,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: KColors.lightPrimary,
                    width: 1.5,
                  ),
                ),
              ),
              onChanged: (value) {
                home.changeSearchText(value);
              },
              onEditingComplete: () {
                home.searchBook();
              },
            ),
            kSmH,
            (home.seletedBook == '')
                ? Container(
                    width: 100,
                    height: 150,
                    color: KColors.grey,
                  )
                : Image(
                    width: 100,
                    height: 150,
                    image: FirebaseImageProvider(
                      FirebaseUrl(
                          'gs://hyapp-3137e.appspot.com/${home.seletedBook}.png'),
                      options: CacheOptions(
                        source: Source.server,
                      ),
                    ),
                  ),
            kNorH,
            Text(
              '키워드 선택',
              style: kContentTextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
            kNorH,
            Container(
                height: 60,
                width: size.width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 3 / 1,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: GestureDetector(
                        onTap: () {
                          home.changeselectedTag(index);
                        },
                        child: (home.selectedTag == home.tagList[index])
                            ? Container(
                                decoration: BoxDecoration(
                                    color: KColors.lightPrimary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    '${home.tagList[index]}',
                                    style: kTagTextStyle.copyWith(fontSize: 9),
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: KColors.darkGrey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    '${home.tagList[index]}',
                                    style: kTagTextStyle.copyWith(fontSize: 9),
                                  ),
                                ),
                              ),
                      ),
                    );
                  },
                )),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: TextFormField(
                expands: true,
                minLines: null,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: '책에 대한 코멘트를 달아주세요!',
                  hintStyle: kTagTextStyle.copyWith(
                    color: KColors.textGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: KColors.lightPrimary,
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: KColors.lightPrimary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width, 35),
                  backgroundColor: KColors.lightPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: Text('발행'),
            )
          ],
        ),
      ),
    );
  }
}
