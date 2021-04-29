import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modular/app/app.module.dart';
import 'package:news_app/modular/app/app.widget.dart';

void main() {
  Builders.systemInjector(Modular.get);
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
