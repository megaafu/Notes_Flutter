import 'package:auto_injector/auto_injector.dart';
import 'package:notes/app/data/repositories/note_repository_impl.dart';
import 'package:notes/app/data/services/isar_service.dart';
import 'package:notes/app/iterator/repositories/note_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add(IsarService.new);
  injector.add<NoteRepository>(NoteRepositoryImpl.new);
}
