import 'package:bible_journal/data/local_db/journals_db.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/domain/repository/repository.dart';
import 'package:sembast/sembast.dart';

class RepositoryImpl extends Repository {
  Database db;
  JournalsDb journalsDb;

  RepositoryImpl(this.db) {
    db = this.db;
    journalsDb = JournalsDb(db);
  }

  @override
  Future<void> saveData(dynamic data) async {
    await journalsDb.saveList(data);
  }

  @override
  Stream<List<Journals>> listenForActivities() {
    return journalsDb.listenForActivities();
  }
}
