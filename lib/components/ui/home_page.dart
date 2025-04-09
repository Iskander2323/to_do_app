import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/components/ui/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.goNamed('to_do_form_page');
                },
                icon: Icon(Icons.add)),
            CustomButton(title: 'GET TO DO', onTap: () {})
          ],
        ),
      ),
    );
  }
}
