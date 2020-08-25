import 'package:sembast/sembast.dart';

abstract class Db {
  final Database db;
  final StoreRef store;

  Db(this.db, this.store);

  deleteAll() {
    store.delete(db);
  }
}
