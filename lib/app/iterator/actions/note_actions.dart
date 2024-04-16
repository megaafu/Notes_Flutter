import 'package:notes/app/injector.dart';
import 'package:notes/app/iterator/atoms/note_atom.dart';
import 'package:notes/app/iterator/models/note_model.dart';
import 'package:notes/app/iterator/repositories/note_repository.dart';

Future<void> saveNote(NoteModel noteModel) async {
  final repository = injector.get<NoteRepository>();
  await repository.saveNote(noteModel);
  fetchNotes();
}

Future<void> fetchNotes() async {
  final repository = injector.get<NoteRepository>();
  noteAtom.value = await repository.getAllNotes();
}
