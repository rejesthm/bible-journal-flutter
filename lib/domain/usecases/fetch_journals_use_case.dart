import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/domain/repository/repository.dart';

class FetchJournalsUseCase extends BibleJournalUseCase {
  final Repository repository;

  FetchJournalsUseCase(this.repository);

  Future<List<Journals>> execute() {
    return repository.getJournals();
  }
}
