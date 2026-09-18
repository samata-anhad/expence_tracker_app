import 'package:expence_tracker_app/models/expence.dart';
import 'package:expence_tracker_app/widget/expence_list/expence_item.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  const ExpenceList({
    super.key, 
    required this.expence,
    required this.onRemoveExpence,
    });

  final void Function (Expence expence)onRemoveExpence;

  final List<Expence> expence;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expence.length,
      itemBuilder: (ctax, index) => Dismissible(
      //Remove The Expence Item from The List by Swipe
      key: ValueKey(expence[index]),
      onDismissed:(direction) {
      onRemoveExpence(expence[index]);
      },
      child: ExpenceItem(expence[index])          
      ),
    );
  }
}
