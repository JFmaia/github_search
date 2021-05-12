import 'package:dartz/dartz.dart';
import 'package:github_search/modules/shearch/domain/entities/result_search.dart';
import 'package:github_search/modules/shearch/domain/errors/erros.dart';

abstract class SearchRepository{
  Future<Either<FailureSearch, List<ResultSearch>>> search (String searchText);
}