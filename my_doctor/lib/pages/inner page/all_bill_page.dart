import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllBillPage extends StatefulWidget {
  const AllBillPage({super.key});

  @override
  State<AllBillPage> createState() => _AllBillPageState();
}

class _AllBillPageState extends State<AllBillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        shape: CircleBorder(),
        // isExtended: true,
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Color(0xff1468B3),
        onPressed: () {
          // NavigationService().navigateToScreen(AddPatientPage());
        },
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("No Transaction Avliable !!!"),
      ),
    );
  }
}
