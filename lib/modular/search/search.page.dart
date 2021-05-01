import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/helper/constants.dart';
import 'package:news_app/modular/app/service/search.service.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _textEditingController = TextEditingController();

  SearchService _searchService = Modular.get<SearchService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(hintText: 'search'),
              onChanged: (value) {
                setState(() {
                  _searchService.get(value);
                  if (value.isEmpty) {
                    _searchService.search.length = 0;
                  }
                  print(value);
                  print(_searchService.search.length);
                });
              },
            ),
          ),
          // IconButton(icon: Icon(Icons.search), onPressed: () {}),
          Expanded(
              child: Constants.buildNewsList(
                  list: _searchService.search, isSearch: true)),
        ],
      ),
    );
  }
}
