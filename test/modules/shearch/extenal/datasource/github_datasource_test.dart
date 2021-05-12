import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/shearch/domain/errors/erros.dart';
import 'package:github_search/modules/shearch/extenal/datasource/github_datasource.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final dataSource = GithubDatasource(dio);
  test("Deve retornar uma lista de ResultSeachModel", () {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(githubResult), statusCode: 200));
    final future = dataSource.getSearch("searchText");
    expect(future, completes);
  });
  test("Deve retornar um error se o codigo não for 200", () {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));
    final future = dataSource.getSearch("searchText");
    expect(future, throwsA(isA<DataSourceError>()));
  });
}
