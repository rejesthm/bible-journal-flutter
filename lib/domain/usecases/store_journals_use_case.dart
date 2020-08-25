import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/domain/repository/repository.dart';

class StoreJournalsUseCase extends BibleJournalUseCase {
  final Repository repository;

  StoreJournalsUseCase(this.repository);

  Future<void> execute(data) {
    return repository.saveData(data);
  }
}
