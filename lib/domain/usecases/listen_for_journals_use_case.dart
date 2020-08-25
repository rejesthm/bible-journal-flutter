import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/domain/repository/repository.dart';

class ListenForJournalsUseCase extends BibleJournalUseCase {
  final Repository repository;

  ListenForJournalsUseCase(this.repository);

  Stream<List<Journals>> stream() {
    return repository.listenForJournals();
  }
}
