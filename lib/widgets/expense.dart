// ignore_for_file: unused_field

import 'package:expense_tracker/widgets/expenses_list/expense_newpop.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text("Expense deleted."),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(label: "Undo", onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseIndex, expense);
        });
      }),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);

    Widget mainContent = const Center(child: Text("No Expense found. Start adding some!"),);
    if(_registeredExpenses.isNotEmpty){
      mainContent =  ExpensesList(
            expenses: _registeredExpenses,
            onRemoveExpense: _removeExpense,
          );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense App",
        ),
        actions: [
          IconButton(
              onPressed: () {
                _openAddExpenseOverlay();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("the Chart"),
          Expanded(
              child:mainContent
          ),
        ],
      ),
    );
  }
}
