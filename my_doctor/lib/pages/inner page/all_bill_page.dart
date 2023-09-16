import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/addReceipt_page.dart';

import '../../service/navigation_service.dart';

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
          NavigationService().navigateToScreen(AddReceiptPage());
        },
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("No Transaction Avliable !!!"),
      ),
    );
  }
}
