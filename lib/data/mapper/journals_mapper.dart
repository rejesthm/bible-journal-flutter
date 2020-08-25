import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/models/journals.dart';

import 'author_mapper.dart';
import 'journal_mapper.dart';

class JournalsMapper extends BibleJournalMapper<Journals> {
  JournalMapper journalMapper = JournalMapper();
  AuthorMapper authorMapper = AuthorMapper();
  @override
  fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Journals(
      id: map['id'],
      journal: map.containsKey("journal")
          ? journalMapper.fromMap(map['journal'])
          : null,
      authorProfile: map.containsKey("author")
          ? authorMapper.fromMap(map['author'])
          : null,
      imageUrl: map['imageUrl'],
    );
  }

  @override
  Map<String, dynamic> toMap(object) {
    return null;
  }
}
