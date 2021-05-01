import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/helper/constants.dart';
import 'package:news_app/modular/app/service/science.service.dart';

class SciencePage extends StatelessWidget {
  ScienceService _scienceService = Modular.get<ScienceService>();
  @override
  Widget build(BuildContext context) {
    return Constants.buildNewsList(list: _scienceService.science);
  }
}
