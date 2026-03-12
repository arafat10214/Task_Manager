  
 import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Card(
        child: ListTile(
          title: Text('Task Title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
         subtitle: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Task Description'),
             Text('Date: 2024-06-30'),
             SizedBox(height: 8),
             Row(
               children: [
                 Chip(label: Text("New",),
                 backgroundColor: Colors.blue,
                 labelStyle: TextStyle(color: Colors.white),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                 ),),

                 Spacer(),
                 IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_rounded, color: Colors.orange,)),
                 IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,)),
               ],
             )
           ],
        ),
      ),
    )
    );
  }
}