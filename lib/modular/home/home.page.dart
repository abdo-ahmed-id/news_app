import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modular/app/bloc/app.bloc.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';
import 'package:news_app/modular/business/buisness,page.dart';
import 'package:news_app/modular/science/science.page.dart';
import 'package:news_app/modular/sports/sport.page.dart';

class HomePage extends StatelessWidget {
  AppBloc appBloc = Modular.get<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        bloc: appBloc,
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                " App",
              ),
            ),
            body: listPage[state.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              items: listItems,
              onTap: (index) {
                appBloc.onChanged(index);
              },
            ),
          );
        });
  }

  List<BottomNavigationBarItem> listItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
  ];

  List<Widget> listPage = [
    BusinessPage(),
    SportPage(),
    SciencePage(),
  ];
}
