import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_doctor/service/global_variables.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({super.key});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  TextEditingController _controller = TextEditingController();
  List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffF3FBFF),
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "${globalVariables.patientName}'s Notes",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        physics: ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(12),
          height: 760,
          width: 500,
          child: Column(
            children: [
              Container(
                height: 570,
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue.shade50,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(notes[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 158,
                        width: 300,
                        // color: Colors.deepPurple,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FocusScope(
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type your note..."),
                                maxLines: null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (_controller.text != ""){
                            notes.add(_controller.text);
                          }

                          debugPrint("notes: $notes");
                          _controller.clear();
                          FocusScope.of(context).unfocus();
                          SystemChannels.textInput.invokeMethod('TextInput.hide');
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0xff1468B3),
                        maxRadius: 30,
                        child: Icon(
                          Icons.done,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
