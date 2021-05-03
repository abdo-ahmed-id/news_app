import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/helper/constants.dart';
import 'package:news_app/modular/app/bloc/app.bloc.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _textEditingController = TextEditingController();

  AppBloc _appBloc = Modular.get<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AppBloc, AppState>(builder: (_, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(hintText: 'search'),
                onChanged: (value) {
                  setState(() {
                    _appBloc.search(value);
                    if (value.isEmpty) {
                      state.search.length = 0;
                    }
                    print(value);
                    print(state.search.length);
                  });
                },
              ),
            ),
            // IconButton(icon: Icon(Icons.search), onPressed: () {}),
            Expanded(child: NewsList(list: state.search, isSearch: true)),
          ],
        );
      }),
    );
  }
}
