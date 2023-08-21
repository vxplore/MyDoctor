/*
int _currentstep = 0;
Widget build(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Expanded(
          child: Stepper(
            type: StepperType.horizontal,
            physics: ScrollPhysics(),
            currentStep: _currentstep,
            onStepTapped: (step) => tapped(step),
            onStepContinue:  continued,
            onStepCancel: cancel,
            steps: <Step>[
              Step(
                title: new Text(''),
                content: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'email address1'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'password1'),
                    ),
                  ],
                ),
                isActive: _currentstep >= 0,
                state: _currentstep >= 0 ?
                StepState.complete : StepState.disabled,
              ),
              Step(
                title: new Text(''),
                content: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'email address2'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'password2'),
                    ),
                  ],
                ),
                isActive: _currentstep >= 0,
                state: _currentstep >= 0 ?
                StepState.complete : StepState.disabled,
              ),
              Step(
                title: new Text(''),
                content: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'email address3'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'password3'),
                    ),
                  ],
                ),
                isActive: _currentstep >= 0,
                state: _currentstep >= 0 ?
                StepState.complete : StepState.disabled,
              ),
              Step(
                title: new Text(''),
                content: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'email address4'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'password4'),
                    ),
                  ],
                ),
                isActive: _currentstep >= 0,
                state: _currentstep >= 0 ?
                StepState.complete : StepState.disabled,
              ),
            ],
          ),
        ),
      ],
    ),
  );



}


tapped(int step){
  setState(() => _currentstep = step);
}

continued(){
  _currentstep < 3 ?
  setState(() => _currentstep += 1): null;
}
cancel(){
  _currentstep > 0 ?
  setState(() => _currentstep -= 1) : null;
}*/
