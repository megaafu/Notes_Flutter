import 'package:notes/app/data/services/isar_service.dart';
import 'package:notes/app/iterator/models/note_model.dart';
import 'package:notes/app/iterator/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final IsarService isarService;
  NoteRepositoryImpl({required this.isarService});

  @override
  Future<List<NoteModel>> getAllNotes() async {
    return await isarService.getAllNotes();
  }

  @override
  Future<void> saveNote(NoteModel noteModel) async {
    await isarService.saveNote(noteModel);
  }

  @override
  Future<void> updateNote(NoteModel noteModel) async {
    await isarService.updateNote(noteModel);
  }

  @override
  Future<void> deleteNote(int id) async {
    await isarService.deleteNote(id);
  }
}
