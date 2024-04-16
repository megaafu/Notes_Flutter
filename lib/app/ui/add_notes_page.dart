import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/app/iterator/models/note_model.dart';

class AddNotePage extends HookWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
              NoteModel(
                title: titleController.text,
                description: descriptionController.text,
              ),
            );
          },
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                style: Theme.of(context).textTheme.titleLarge,
                controller: titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                minLines: 6,
                maxLines: null,
                controller: descriptionController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Description',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
