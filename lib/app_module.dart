import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'modules/shearch/domain/useCases/search_by_text.dart';
import 'modules/shearch/extenal/datasource/github_datasource.dart';
import 'modules/shearch/infra/repositories/search_repositoy_impl.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDatasource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
      ];
  @override
  Widget get bootstrap => throw UnimplementedError();

  @override
  List get routers => throw UnimplementedError();
}
