import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/modular/app/bloc/app.bloc.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';
import 'package:news_app/modular/app/service/business.service.dart';

class BusinessPage extends StatelessWidget {
  BusinessService _businessService = Modular.get<BusinessService>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        cubit: Modular.get<AppBloc>(),
        builder: (_, state) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: state.business.length < 1
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: state.business.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        state.business[index]['urlToImage'] !=
                                                null
                                            ? state.business[index]
                                                ['urlToImage']
                                            : state.business[0]['urlToImage'],
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          state.business[index]['title'],
                                          // state.business['articles'][index]['title'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      Text(
                                        state.business[index]['publishedAt'],
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }));
        });
  }
}
