import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/data/providers/news.provider.dart';
import 'package:news_app/helper/app_routes.dart';
import 'package:news_app/modular/app/bloc/app.bloc.dart';
import 'package:news_app/modular/app/service/business.service.dart';
import 'package:news_app/modular/app/service/science.service.dart';
import 'package:news_app/modular/app/service/sport.service.dart';
import 'package:news_app/modular/home/home.page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => NewsProvider()),
    Bind((i) => ScienceService(i.get<NewsProvider>())),
    Bind((i) => SportService(i.get<NewsProvider>())),
    Bind((i) => BusinessService(i.get<NewsProvider>())),
    Bind((i) => AppBloc(i.get<BusinessService>(), i.get<ScienceService>(),
        i.get<SportService>())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.home, child: (_, __) => HomePage()),
  ];
}
