// ignore_for_file: unused_field
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }
  //or
  final _titleController = TextEditingController();
@override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
           TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("title")),
          ),
          ElevatedButton(
              onPressed: () {
                print(_titleController.text);
              },
              child: const Text("Save Expense"))
        ],
      ),
    );
  }
}
