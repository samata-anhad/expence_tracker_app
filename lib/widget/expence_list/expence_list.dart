import 'package:expence_tracker_app/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  const ExpenceList(String title, {super.key, required this.expence});

  final List<Expence> expence;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expence.length,
      itemBuilder: (ctax, index) =>ExpenceList(expence[index].title, expence: [],),
    );
  }
}
