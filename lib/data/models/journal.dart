import 'package:bible_journal/core/architecture.dart/architecture.dart';

class Journal extends BibleJournalModel {
  final int id;
  final String journalTitle;
  final String journalDescription;
  final String journalContent;

  Journal({
    this.id,
    this.journalTitle,
    this.journalDescription,
    this.journalContent,
  });
}
