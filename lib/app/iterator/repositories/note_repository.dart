import 'package:notes/app/iterator/models/note_model.dart';

abstract interface class NoteRepository {
  Future<void> saveNote(NoteModel noteModel);
  Future<List<NoteModel>> getAllNotes();
  Future<void> updateNote(NoteModel noteModel);
  Future<void> deleteNote(int id);
}
