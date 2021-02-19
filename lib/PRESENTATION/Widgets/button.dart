import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Color color;
  final Function action;
  const Button(
      {@required this.label, @required this.action, @required this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: new RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 17.0),
          color: color,
          child: Text(
            '$label'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: action,
        ),
      ),
    );
  }
}
