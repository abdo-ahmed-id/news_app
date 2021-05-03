import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/data/providers/news.provider.dart';
import 'package:news_app/data/providers/toogle.mode.dart';
import 'package:news_app/modular/app/app.module.dart';
import 'package:news_app/modular/app/app.widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Builders.systemInjector(Modular.get);
  await ModeProvider.init();
  DioProvider.init();
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
