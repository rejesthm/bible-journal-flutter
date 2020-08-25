import 'package:bible_journal/dependency_injection.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TestDataInstantiator extends DataInstantiator {
  @override
  Future<Database> getDatabase(Map<String, String> env) async {
    String dpPath = env['LOCAL_DB'];
    DatabaseFactory dbFactory = databaseFactoryIo;
    return await dbFactory.openDatabase(dpPath);
  }
}
