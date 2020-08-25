import 'package:bible_journal/data/mapper/journals_mapper.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:sembast/sembast.dart';

import 'database.dart';

class JournalsDb extends Db {
  JournalsMapper _journalsMapper = JournalsMapper();

  JournalsDb(Database db)
      : super(
          db,
          intMapStoreFactory.store("activities_hub"),
        );

  Stream<List<Journals>> listenForActivities() {
    var query = store.query();
    return query.onSnapshots(db).map((snapshots) {
      return snapshots
          .map(
            (snapshot) => _journalsMapper.fromMap(snapshot.value),
          )
          .toList();
    });
  }

  Future<void> saveList(List<dynamic> journals) async {
    for (Map<String, dynamic> journal in journals) {
      this.save(journal);
    }
  }

  Future<void> save(Map<String, dynamic> journal) async {
    await store.record(journal['id']).put(db, journal);
  }
}
