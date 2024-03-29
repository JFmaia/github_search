import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/shearch/domain/entities/result_search.dart';
import 'package:github_search/modules/shearch/domain/errors/erros.dart';

import 'package:github_search/modules/shearch/domain/repositories/search_repository.dart';
import 'package:github_search/modules/shearch/domain/useCases/search_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);
  test(
    'deve retorna uma lista de ResultSearch.',
    () async {
      when(repository.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
      final result = await usecase("jacobe");
      expect(result | null, isA<List<ResultSearch>>());
    },
  );
  test(
    'deve retorna uma exeception caso o texto seja invalido.',
    () async {
      when(repository.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
      var result = await usecase(null);
      expect(result.fold(id, id), isA<InvalidTextError>());
      var resulte = await usecase('');
      expect(resulte.fold(id, id), isA<InvalidTextError>());
    },
  );
}
