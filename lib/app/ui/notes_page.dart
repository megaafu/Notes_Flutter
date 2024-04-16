import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/app/iterator/actions/note_actions.dart';
import 'package:notes/app/iterator/atoms/note_atom.dart';
import 'package:notes/app/ui/add_notes_page.dart';
import 'package:notes/app/iterator/models/note_model.dart';

class NotesPage extends HookWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteModel = useState<NoteModel?>(null);
    final allNotes = useState<List<NoteModel>>([]);
    useEffect(() {
      fetchNotes();
      return;
    }, [noteModel]);
    noteAtom.addListener(() {
      allNotes.value = noteAtom.value;
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            noteModel.value = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddNotePage(),
              ),
            );
            if (noteModel.value!.title.isNotEmpty ||
                noteModel.value!.description.isNotEmpty) {
              saveNote(noteModel.value!);
            }
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(10.0),
          child: HookBuilder(builder: (context) {
            return ListView.builder(
              itemCount: allNotes.value.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    titleTextStyle: Theme.of(context).textTheme.titleMedium,
                    title: Text(allNotes.value[index].title),
                    subtitle: Text(allNotes.value[index].description),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
