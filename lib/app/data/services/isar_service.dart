import 'package:isar/isar.dart';
import 'package:notes/app/iterator/models/note_model.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;
  IsarService() {
    db = openDB();
  }
  Future<void> saveNote(NoteModel noteModel) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.noteModels.putSync(noteModel));
  }

  Future<List<NoteModel>> getAllNotes() async {
    var isar = await db;
    return await isar.noteModels.where().findAll();
  }

  Future<void> updateNote(NoteModel noteModel) async {
    var isar = await db;
    await isar.writeTxn(() async {
      await isar.noteModels.put(noteModel);
    });
  }

  Future<void> deleteNote(int id) async {
    var isar = await db;
    isar.writeTxn(() => isar.noteModels.delete(id));
  }

  Future<Isar> openDB() async {
    var dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return Isar.open(
        [NoteModelSchema],
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
