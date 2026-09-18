import 'package:flutter/material.dart';
import 'package:expence_tracker_app/models/expence.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key, required this.onAddExpence});

  final void Function(Expence expence) onAddExpence;

  @override
  State<NewExpence> createState() {
    return _NewExpenceState();
  }
}

class _NewExpenceState extends State<NewExpence> {
  //Method One To Save The Titles In Input Files By The User.
  //We Wont Use Use State Here As We Doesnot need Any Ui Update In The Page so Stiore In The Memory and it is for
  // Manual Way To Save Data
  // var _enTitledValue='';

  //  void _saveTitleInput(String inputValue){
  //        _enTitledValue= inputValue;
  //   }

  //Method Two Using Controller

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  //The Selected Date
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //Modal Box Shows
  void _subMittedExpenceData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountInvalid ||
        _selectedDate == null) {
      //show error message dialouge
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
            'Please Make Sure A Valid Title, Amount, date and category is emtered ',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okey'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpence(
      Expence(
        amount: enteredAmount,
        date: _selectedDate!,
        title: _titleController.text,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  //Selected Title
  @override //Using Dispose When The Widget Is Destroid It Will Be removed From Memory
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  // ignore: strict_top_level_inference
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            //  onChanged: _saveTitleInput, (Under Method One)
            //method two
            controller: _titleController,
            // controller:_amountController,
            // keyboardType: TextInputType.number,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),

          Expanded(
            child: Row(
              children: [
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text("Amount"),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _selectedDate == null
                      ? "no date selected"
                      : formatter.format(_selectedDate!),
                ),
                IconButton(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toLowerCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    }
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _subMittedExpenceData,
                // print(_enTitledValue); //method 1
                // print(_titleController.text);
                // print(_amountController..text);
                //Method two Without Manual Way

                child: const Text('Save Expence'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
