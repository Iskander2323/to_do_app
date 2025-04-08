import 'package:flutter/material.dart';
import 'package:to_do_app/components/ui/widgets/custom_button.dart';

class ToDoFormPage extends StatefulWidget {
  const ToDoFormPage({super.key});

  @override
  State<ToDoFormPage> createState() => _ToDoFormPageState();
}

class _ToDoFormPageState extends State<ToDoFormPage> {
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
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
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
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
