import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/welcome.png'),
              SizedBox(
                height: 120.0,
              ),
              Text(
                // 'Ultra Fitness Nutrition',
                'One Stop Shop For Your Fitness and Nutrition Needs',
                style: TextStyle(
                  // color: primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    child: Text(
                      "Continue".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    color: primaryColor,
                    action: () {
                      print('button pressed');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function action;
  const Button(
      {@required this.child, @required this.action, @required this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: new RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        color: Theme.of(context).primaryColor,
        child: this.child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: action,
      ),
    );
  }
}
