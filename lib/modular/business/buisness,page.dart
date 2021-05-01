import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/helper/constants.dart';
import 'package:news_app/modular/app/service/business.service.dart';

class BusinessPage extends StatelessWidget {
  BusinessService _businessService = Modular.get<BusinessService>();
  @override
  Widget build(BuildContext context) {
    return Constants.buildNewsList(list: _businessService.business);
  }
}
