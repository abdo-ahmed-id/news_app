import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modular/app/bloc/app.bloc.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';
import 'package:news_app/modular/app/service/business.service.dart';
import 'package:news_app/modular/app/service/sport.service.dart';
import 'package:news_app/modular/business/buisness,page.dart';
import 'package:news_app/modular/science/science.page.dart';
import 'package:news_app/modular/sports/sport.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppBloc appBloc = Modular.get<AppBloc>();

  BusinessService _businessService = Modular.get<BusinessService>();

  SportService _sportService = Modular.get<SportService>();

  @override
  void initState() {
    appBloc.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        bloc: appBloc,
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "News App",
              ),
              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.brightness_4_outlined),
                    onPressed: () {
                      appBloc.themeMode();
                      print(state.isDark);
                    })
              ],
            ),
            body: listPage[state.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              items: listItems,
              onTap: (index) {
                appBloc.onChanged(index);
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                appBloc.businessGet();
                appBloc.scienceGet();
                appBloc.sportGet();
                print(state.business.length);
                print(_businessService.business.length);
                print(_sportService.sport.length);
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
