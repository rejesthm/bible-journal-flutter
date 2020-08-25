import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/data/sources/mockdata.dart';
import 'package:bible_journal/domain/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'dart:io' as io;
import 'test_data_instantiator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  io.HttpOverrides.global = null;
  Repository repository;

  setUp(() async {
    BibleJournalDataInstantiator dataInstantiator = TestDataInstantiator();
    await dataInstantiator.init();
    repository = GetIt.I.get<Repository>();
  });

  tearDown(() async {
    GetIt.I.reset();
  });

  group('journals', () {
    test('save journals', () async {
      List<Journals> journals;
      //GIVEN THAT
      final data = MockData.getJournals();

      //WHEN
      await repository.saveData(data);
      repository.listenForActivities().listen((snapshot) {
        journals = snapshot;
      });

      await Future.delayed(Duration(milliseconds: 350));

      print(journals[0].authorProfile.authorName);

      expect(journals.length, isNot(0));
    });
  });
}
