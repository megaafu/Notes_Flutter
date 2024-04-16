import 'package:isar/isar.dart';
part 'note_model.g.dart';

@collection
class NoteModel {
  final id = Isar.autoIncrement;
  final String title;
  final String description;

  const NoteModel({
    required this.title,
    required this.description,
  });
}
