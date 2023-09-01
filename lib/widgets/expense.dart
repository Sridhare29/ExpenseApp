// ignore_for_file: unused_field

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

import '../models/expense_model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "American Tourist",
        amount: 1999.0,
        date: DateTime.now(),
        category: Category.travel),
        Expense(
        title: "Flutter Course",
        amount: 899.0,
        date: DateTime.now(),
        category: Category.work),
        Expense(
        title: "Italian pasta",
        amount: 349.0,
        date: DateTime.now(),
        category: Category.food),
        
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense App",),
        actions:  [
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ const Text("the Chart"),
           Expanded(child: ExpensesList(expenses: _registeredExpenses))],
        ),
    );
  }
}
