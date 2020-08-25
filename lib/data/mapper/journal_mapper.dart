import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/models/journal.dart';

class JournalMapper extends BibleJournalMapper<Journal> {
  @override
  fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Journal(
      id: map['id'],
      journalTitle: map['id'],
      journalDescription: map['id'],
      journalContent: map['id'],
    );
  }

  @override
  Map<String, dynamic> toMap(object) {
    return null;
  }
}
