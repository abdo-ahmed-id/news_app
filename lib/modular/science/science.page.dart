import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modular/app/service/science.service.dart';

class SciencePage extends StatelessWidget {
  ScienceService _scienceService = Modular.get<ScienceService>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: _scienceService.science.length < 1
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _scienceService.science.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                  _scienceService.science[index]
                                              ['urlToImage'] !=
                                          null
                                      ? _scienceService.science[index]
                                          ['urlToImage']
                                      : _scienceService.science[0]
                                          ['urlToImage'],
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
                                    _scienceService.science[index]['title'],
                                    // state.business['articles'][index]['title'],
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Text(
                                  _scienceService.science[index]['publishedAt'],
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
                  );
                }));
  }
}
