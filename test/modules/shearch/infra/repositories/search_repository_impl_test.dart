import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/shearch/domain/entities/result_search.dart';
import 'package:github_search/modules/shearch/domain/errors/erros.dart';
import 'package:github_search/modules/shearch/infra/datasources/search_datasource.dart';
import 'package:github_search/modules/shearch/infra/models/result_search_model.dart';
import 'package:github_search/modules/shearch/infra/repositories/search_repositoy_impl.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test('deve retorna uma lista de Resultsource.', () async {
    when(datasource.getSearch(any)).thenAnswer((_)async => <ResultSearchModel>[]);
    final result = await repository.search("searchText");
    expect(result|null, isA<List<ResultSearch>>());
  });
  test('deve retorna um dataSourceError se o datasource falhar.', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());
    final result2 = await repository.search("searchText");
    expect(result2.fold(id,id), isA<DataSourceError>());
  });
}
