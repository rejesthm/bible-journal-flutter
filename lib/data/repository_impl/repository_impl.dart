import 'package:bible_journal/data/local_db/journals_db.dart';
import 'package:bible_journal/domain/repository/repository.dart';
import 'package:sembast/sembast.dart';

class RepositoryImpl extends Repository {
  Database db;
  JournalsDb journalsDb;

  RepositoryImpl(this.db) {
    db = this.db;
  }

  @override
  Future<void> saveData(dynamic data) async {
    await journalsDb.saveList(data);
  }
}
