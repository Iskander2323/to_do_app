import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/components/bloc/to_do_bloc.dart';
import 'package:to_do_app/components/data/model/to_do_model.dart';
import 'package:to_do_app/components/ui/widgets/custom_button.dart';

class ToDoFormPage extends StatefulWidget {
  const ToDoFormPage({super.key});

  @override
  State<ToDoFormPage> createState() => _ToDoFormPageState();
}

class _ToDoFormPageState extends State<ToDoFormPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create to do',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            return Column(
              children: [
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Title', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Description',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: 'Save',
                  onTap: () {
                    log('is this work');
                    final toDoModel = ToDoModel(
                        id: 0,
                        title: titleController.text,
                        description: descriptionController.text,
                        createdAt: DateTime.now(),
                        isDone: false);
                    context
                        .read<ToDoBloc>()
                        .add(CreateToDoEvent(toDoModel: toDoModel));
                    context.pop();
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
