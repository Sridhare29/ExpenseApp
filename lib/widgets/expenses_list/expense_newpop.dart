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
  final _amountControlller = TextEditingController();

void _presentDatePicker(){
  final now = DateTime.now();
  final firstDate = DateTime(now.year-1,now.month,now.day);
  showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);
}
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
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountControlller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text("Amount"),prefixText: '\$'),
                ),
              ),
               const SizedBox(height: 16,),
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Selected Date"),
              IconButton(onPressed: () {_presentDatePicker();}, icon: Icon(Icons.calendar_month))
            ],
          )),
            ],
          ),
                        const SizedBox(height: 20,),
          Row(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text("Cancel")),  
              const SizedBox(width: 20,),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountControlller.text);              
                  },
                  child: const Text("Save Expense"),),
            ],
          )
        ],
      ),
    );
  }
}
