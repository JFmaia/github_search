import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/app_module.dart';
import 'package:github_search/modules/shearch/domain/useCases/search_by_text.dart';


main() {
  initModule(AppModule());
  test('Deve recuperar o Usecase sem error', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });
}