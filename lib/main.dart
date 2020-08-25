import 'package:bible_journal/bible_journal_app.dart';
import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:flutter/material.dart';

import 'dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BibleJournalDataInstantiator dataInstantiator = DataInstantiator();
  await dataInstantiator.init();
  runApp(BibleJournalApp());
}
