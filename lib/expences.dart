import 'package:flutter/material.dart';
import 'package:expence_tracker_app/models/expence.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});
  @override
  State<Expences> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expences> {
  final List<Expence> _registeredExpences = [
    Expence(
      amount: 15.59,
      date: DateTime.now(),
      title: 'Flutter Courses',
      category: Category.work,
    ),

      Expence(
      amount: 15.5900,
      date: DateTime.now(),
      title: 'North-East Sikim',
      category: Category.travel,
    ),

      Expence(
      amount: 1000,
      date: DateTime.now(),
      title: 'Books',
      category: Category.leisure,
    ),

      Expence(
      amount: 1000,
      date: DateTime.now(),
      title: 'Non-vej',
      category: Category.food,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [Text('The Chart'), Text('The Expences Lists')],
      ),
    );
  }
}
