import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';


final sl = GetIt.instance;


class DataInstantiator extends BibleJournalDataInstantiator {
  Database database;

}
