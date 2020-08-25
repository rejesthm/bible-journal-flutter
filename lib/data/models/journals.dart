import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/models/journal.dart';

import 'author.dart';

class Journals extends BibleJournalModel {
  final int id;
  final Journal journal;
  final Author authorProfile;
  final String imageUrl;

  Journals({
    this.id,
    this.journal,
    this.authorProfile,
    this.imageUrl,
  });
}
