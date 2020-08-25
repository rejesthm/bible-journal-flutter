import 'package:bible_journal/core/architecture.dart/architecture.dart';

class Author extends BibleJournalModel {
  final String id;
  final String authorName;
  final String aboutAuthor;
  final String address;
  final String contactNumber;

  Author(
      {this.id,
      this.authorName,
      this.aboutAuthor,
      this.address,
      this.contactNumber});
}
