import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/helper/app_routes.dart';
import 'package:news_app/helper/constants.dart';
import 'package:news_app/modular/app/bloc/app.bloc.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppBloc appBloc = Modular.get<AppBloc>();

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
          print('statelist${state.business.length}');
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "News App",
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Modular.to.pushNamed(AppRoutes.search);
                    }),
                IconButton(
                    icon: Icon(Icons.brightness_4_outlined),
                    onPressed: () {
                      appBloc.themeMode();
                    })
              ],
            ),
            body: IndexedStack(
              index: state.currentIndex,
              children: [
                NewsList(list: state.business),
                NewsList(list: state.sport),
                NewsList(list: state.science),
              ],
            ),
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
}
