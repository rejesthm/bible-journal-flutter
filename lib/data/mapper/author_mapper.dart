import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/models/author.dart';

class AuthorMapper extends BibleJournalMapper<Author> {
  @override
  fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Author(
      id: map['id'],
      authorName: map['authorName'],
      aboutAuthor: map['aboutAuthor'],
      address: map['address'],
      contactNumber: map['contactNumber']
    );
  }

  @override
  Map<String, dynamic> toMap(object) {
    return null;
  }
}
