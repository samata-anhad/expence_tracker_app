import 'package:expence_tracker_app/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem(this.expence, {super.key});

  final Expence expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expence.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\${$expence.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                     Icon(categoryIcons[expence.category]),
                    const SizedBox(width: 8),
                    Text(expence.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
