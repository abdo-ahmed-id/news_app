import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/helper/constants.dart';
import 'package:news_app/modular/app/service/sport.service.dart';

class SportPage extends StatelessWidget {
  SportService _sportService = Modular.get<SportService>();
  @override
  Widget build(BuildContext context) {
    return Constants.buildNewsList(list: _sportService.sport);
  }
}
