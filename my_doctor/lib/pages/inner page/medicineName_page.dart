import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utilites/getMedicineName_response_data.dart';
import '../../service/global_variables.dart';
import '../patient_complaints_page.dart';

class NamePage extends StatefulWidget {
  const NamePage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  List<Datum> _foundUsers = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    // _foundUsers = _allUsers;
    _searchController = TextEditingController();
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Datum> results = [];
    if (enteredKeyword.isEmpty) {
      // results = _allUsers;
    } else {
      results = globalVariables.getMedicineName!.data
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Medicine Name',
              style: TextStyle(color: Color(0xff0266D5), fontSize: 25),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 14, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xffDFD0D0), // Border color
                    width: 0.5, // Border width
                  ),
                ),
                // height: 70,
                width: 390,
                child: FocusScope(
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    controller: _searchController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 20.0, top: 15, bottom: 10),
                      isDense: true,
                      border: InputBorder.none,
                      labelStyle:
                          TextStyle(fontSize: 18, color: Color(0xffBBBBBB)),
                      labelText: 'Search for Medicine Name',
                      suffixIcon: _searchController.text == ""
                          ? Icon(Icons.search,
                              color: Color(0xffDFDFDF), size: 40)
                          : InkWell(
                              onTap: () {
                                _searchController.clear();
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(Icons.clear,
                                  color: Color(0xffDFDFDF), size: 40),
                            ),
                    ),
                  ),
                ),
              ),
            ),
            _searchController.text != ""
                ? Container(
                    height: 195,
                    width: 500,
                    child: _foundUsers.isNotEmpty
                        ? ListView.builder(
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                setState(() {
                                  globalVariables.names =
                                      _foundUsers[index].name;
                                  globalVariables.nameId =
                                      _foundUsers[index].id;
                                  widget.onNext();
                                });
                                print(
                                    "button pressed: ${globalVariables.names}");
                                print(
                                    "button pressed: ${globalVariables.nameId}");
                              },
                              title: Text(_foundUsers[index].name),
                            ),
                          )
                        : Align(
                            alignment: Alignment.topCenter,
                            child: const Text(
                              'No results found',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  color: Colors.red),
                            ),
                          ),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
            SizedBox(
              height: 25,
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 55),
              itemCount: globalVariables.getMedicineName!.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 70,
                  width: 500,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // globalVariables.names = "Paracetamol";
                        globalVariables.names =
                            globalVariables.getMedicineName!.data[index].name;
                        globalVariables.nameId =
                            globalVariables.getMedicineName!.data[index].id;
                        widget.onNext();
                      });
                      print("button pressed: ${globalVariables.names}");
                      print("button pressed: ${globalVariables.nameId}");
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          // padding: EdgeInsets.only(left: 7, right: 7),
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              // "Paracetamol",
                              globalVariables.getMedicineName!.data[index].name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              /* Container(
                height: 70,
                width: 500,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      globalVariables.names = "Paracetamol";
                      widget.onNext();
                    });
                    print("button pressed: ${globalVariables.names}");
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25))),
                      elevation: 5,
                      child: Container(
                        // padding: EdgeInsets.only(left: 7, right: 7),
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Paracetamol",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff5A88BB)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),*/
            ),
            /*for (var item in Experience.values)
              RadioListTile<Experience>(
                title: Text(_experienceTitles[item]!),
                value: item,
                groupValue: _experience,
                onChanged: (value) {
                  setState(() => _experience = value);
                },
              ),*/
            const Spacer(),
            /*  PrimaryButton(
              onPressed: _experience != null ? widget.onNext : null,
              text: 'Next',
            ),*/
          ],
        ),
      ),
    );
  }
}
