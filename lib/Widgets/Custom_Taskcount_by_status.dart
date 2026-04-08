<<<<<<< HEAD
import 'package:flutter/material.dart';

class CustomTaskcountByStatus extends StatelessWidget {
  final String tittle;
  final int count;
  const CustomTaskcountByStatus({super.key, required this.tittle, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 8),
        child: Column(children: [
          Text(count.toString(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text(tittle,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),)
          
          ],
          ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

class CustomTaskcountByStatus extends StatelessWidget {
  final String tittle;
  final int count;
  const CustomTaskcountByStatus({super.key, required this.tittle, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 8),
        child: Column(children: [
          Text(count.toString(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text(tittle,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),)
          
          ],
          ),
      ),
    );
  }
}
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
