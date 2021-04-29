import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/helper/app_routes.dart';
import 'package:news_app/modular/app/bloc/app.bloc.dart';
import 'package:news_app/modular/home/home.page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppBloc()),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.home, child: (_, __) => HomePage()),
  ];
}
