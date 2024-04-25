import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

import 'new_expence.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void _addShowModelOverlay() {
    showModalBottomSheet(
      useSafeArea: true,  
        isScrollControlled: true,
        context: context,
        builder: (cxt) => NewExpense(onAddExpense: _onAddExpense));
  }

  void _onAddExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'flutter course',
        amount: 19.00,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'cenima',
        amount: 150.00,
        date: DateTime.now(),
        category: Category.leisure)
  ];
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Deleted'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('The expense list is empty add some'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
          expenses: _registeredExpenses, onRemoveExpese: _removeExpense);
    }

    return Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker'), actions: [
          IconButton(
              onPressed: _addShowModelOverlay, icon: const Icon(Icons.add))
        ]),
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(child: mainContent),
                ],
              ));
  }
}
