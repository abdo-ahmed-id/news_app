import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/helper/app_routes.dart';

class Constants {
  static Widget buildNewsList({List list, bool isSearch = false}) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: list.length < 1
            ? isSearch
                ? null
                : Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Modular.to.pushNamed(AppRoutes.webPage,
                            arguments: list[index]['url']);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    list[index]['urlToImage'] != null
                                        ? list[index]['urlToImage']
                                        : list[3]['urlToImage'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      list[index]['title'],
                                      // state.business['articles'][index]['title'],
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                    list[index]['publishedAt'],
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }));
  }
}
