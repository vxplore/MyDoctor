import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_doctor/pages/patient_complaints_page.dart';

class AddMedicationStepsPage extends StatefulWidget {
  const AddMedicationStepsPage({Key? key}) : super(key: key);

  @override
  _AddMedicationStepsPageState createState() => _AddMedicationStepsPageState();
}

class _AddMedicationStepsPageState extends State<AddMedicationStepsPage>
    with SingleTickerProviderStateMixin {
  // We need a TabController to control the selected tab programmatically
  late final _tabController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1468B3),
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: InkWell(onTap: (){
              Navigator.pop(context);
            },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Text(
            'Add Medication',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        // Use TabBar to show the tabs
        /* bottom: ReadOnlyTabBar(
          child: TabBar(
            padding: EdgeInsets.only(left: 19),
            indicatorColor: Colors.transparent,
            isScrollable: true,
            labelPadding: EdgeInsets.only(left: 0),
            physics: AlwaysScrollableScrollPhysics(),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Container(
                  height: 50,
                  width: 190,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.green),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Dosage Form',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 50,
                  width: 130,
                  // color: Colors.cyan,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff0065D7),
                              border: Border.all(color: Color(0xff0065D7)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 50,
                  width: 130,
                  // color: Colors.cyan,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff0065D7),
                              border: Border.all(color: Color(0xff0065D7)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Dose',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Tab(
                text: 'Submit',
              ),
            ],
          ),
        ),*/
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.white, // Tab Bar color change
            child: ReadOnlyTabBar(
              child: TabBar(
                padding: EdgeInsets.only(left: 19),
                indicatorColor: Colors.transparent,
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 0),
                physics: AlwaysScrollableScrollPhysics(),
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      height: 50,
                      width: 190,
                      // color: Colors.red,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Dosage Form',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 50,
                      width: 130,
                      // color: Colors.cyan,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xff0065D7),
                                  border: Border.all(color: Color(0xff0065D7)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Name',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 50,
                      width: 130,
                      // color: Colors.cyan,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xff0065D7),
                                  border: Border.all(color: Color(0xff0065D7)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Dose',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    text: 'Submit',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TabBarView(
              // make sure we can't switch tabs with interactive drag gestures
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                ExperiencePage(
                  onNext: () => _tabController.index = 1,
                ),
                SkillsPage(
                  onNext: () => _tabController.index = 2,
                ),
                TestPage(
                  onNext: () => _tabController.index = 3,
                ),
                SubmitPage(
                  onSubmit: () => showCupertinoDialog(
                    context: context,
                    builder: (_) {
                      return CupertinoAlertDialog(
                        title: const Text('Thank you'),
                        content: const Text('Your application was submitted.'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('OK'),
                            onPressed: () {
                              // dismiss dialog
                              Navigator.of(context).pop();
                              _tabController.index = 0;
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// https://stackoverflow.com/a/57354375/436422
class ReadOnlyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar child;

  const ReadOnlyTabBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(child: child);
  }

  @override
  Size get preferredSize => child.preferredSize;
}

enum Experience {
  tablet,
  capsule,
  syrup,
}

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  String? _experience;

  final _experienceTitles = {
    Experience.tablet: 'Tablet',
    Experience.capsule: 'Capsule',
    Experience.syrup: 'Syrup',

  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Dosages Form',
              style: TextStyle(color: Color(0xff0266D5), fontSize: 25),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xffDFD0D0), // Border color
                    width: 0.5, // Border width
                  ),
                ),
                height: 70,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19),
                      child: Text(
                        "Search Dosages Form",
                        style:
                            TextStyle(fontSize: 21, color: Color(0xffA5A5A5)),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        // method to show the search bar
                        showSearch(
                            context: context,
                            // delegate to customize the search bar
                            delegate: CustomSearchDelegate());
                      },
                      icon: const Icon(Icons.search,
                          color: Color(0xffDFDFDF), size: 40),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 70,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap:(){
                    setState(() {
                      _experience = "Tablet";
                      widget.onNext();
                    });
                    print("button pressed: ${_experience}");
                  },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25))),
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
                              "Tablet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(onTap: (){
                    setState(() {
                      _experience = "Capsule";
                      widget.onNext();
                    });
                    print("button pressed: ${_experience}");
                  },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
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
                              "Capsule",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(onTap: (){
                       setState(() {
                         _experience = "Syrup";
                         widget.onNext();
                       });
                       print("button pressed: ${_experience}");
                  },
                    child: Container(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25))),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(left: 7, right: 7),
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
                              "Syrup",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5A88BB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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

class TestPage extends StatefulWidget {
  const TestPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Experience? _experiencess;

  final _experienceTitles = {
    Experience.tablet: 'Less than one year',
    Experience.capsule: 'One to three years',
    Experience.syrup: 'Three to five years',

  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const Text('Tset PAge'),
          const SizedBox(height: 16),
          for (var item in Experience.values)
            RadioListTile<Experience>(
              title: Text(_experienceTitles[item]!),
              value: item,
              groupValue: _experiencess,
              onChanged: (value) {
                setState(() => _experiencess = value);
              },
            ),
          const Spacer(),
          PrimaryButton(
            onPressed: _experiencess != null ? widget.onNext : null,
            text: 'Next',
          ),
        ],
      ),
    );
  }
}

enum Skill {
  flutter,
  dart,
  firebase,
  cloudFunctions,
}

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final Set<Skill> _skills = {};

  final _experienceTitles = {
    Skill.flutter: 'Flutter',
    Skill.dart: 'Dart',
    Skill.firebase: 'Firebase',
    Skill.cloudFunctions: 'Cloud Functions',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const Text('Which of these skills do you have?'),
          Text(
            'Select all that apply',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 16),
          for (var item in Skill.values)
            CheckboxListTile(
              title: Text(_experienceTitles[item]!),
              value: _skills.contains(item),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _skills.add(item);
                  } else {
                    _skills.remove(item);
                  }
                });
              },
            ),
          const Spacer(),
          PrimaryButton(
            onPressed: _skills.isNotEmpty ? widget.onNext : null,
            text: 'Next',
          ),
        ],
      ),
    );
  }
}

class SubmitPage extends StatefulWidget {
  const SubmitPage({Key? key, required this.onSubmit}) : super(key: key);
  final VoidCallback onSubmit;

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text('Please enter your email to submit your application.'),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              autocorrect: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.light,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Can\'t be empty';
                }
                return null;
              },
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Submit',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSubmit();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
