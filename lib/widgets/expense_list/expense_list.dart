import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {required this.onRemoveExpese, required this.expenses, super.key});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpese;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext context, int index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                vertical: Theme.of(context).cardTheme.margin!.vertical),
          ),
          onDismissed: (direction) {
            onRemoveExpese(expenses[index]);
          },
          child: ExpenseItem(expense: expenses[index])),
    );
  }
}
