import 'package:bible_journal/data/models/journals.dart';

abstract class Repository {
  Future<void> saveData(dynamic data);

  Stream<List<Journals>> listenForJournals();

  Future<List<Journals>> getJournals();
}
