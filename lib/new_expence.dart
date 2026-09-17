
import 'package:flutter/material.dart';

class NewExpence extends StatefulWidget{
  const NewExpence({super.key});

  @override
  State<NewExpence> createState() {
    return _NewExpenceState();
  }

  
}

class _NewExpenceState extends State<NewExpence>{

//Method One To Save The Titles In Input Files By The User. 
//We Wont Use Use State Here As We Doesnot need Any Ui Update In The Page so Stiore In The Memory and it is for
// Manual Way To Save Data
// var _enTitledValue='';


//  void _saveTitleInput(String inputValue){
//        _enTitledValue= inputValue;
//   }

//Method Two Using Controller

final _titleController=TextEditingController();

@override   //Using Dispose When The Widget Is Destroid It Will Be removed From Memory
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(context){
return Padding(
  padding: EdgeInsets.all(16),
  child: Column(
    children: [
      TextField(
      //  onChanged: _saveTitleInput, (Under Method One)
      //method two
      controller: _titleController, //Method 2
        maxLength: 50,
        decoration:const InputDecoration(
        label: Text("Title")
        )
      ),

      Row(
        children: [
          ElevatedButton(onPressed: 
          (){
            // print(_enTitledValue); //method 1 
            print(_titleController.text); //Method two Without Manual Way
          }, child: const Text('Save Expence'), )
        ],
      ),
    ],
  )
);

  }
}