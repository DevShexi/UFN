import 'package:UFN/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType keyType;
  final bool obscure;
  final String label;
  final String hint;
  final String error;
  final Function changeHandler;
  InputField({
    this.keyType,
    this.obscure,
    @required this.label,
    @required this.changeHandler,
    this.hint,
    this.error,
    // @required this.changeHandler,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        autofocus: false,
        keyboardType: keyType,
        onChanged: changeHandler,
        obscureText: obscure,
        // initialValue: "superadmin@admin.com",
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          // contentPadding: EdgeInsets.all(12),
          fillColor: Colors.grey[200],
          labelText: label,
          // labelStyle: entity['decoration']['labelText'],
          hintText: hint,
          errorText: error != "" ? error : null,
          // hintStyle: entity['decoration']['hintStyle'],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey[800]),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey[800]),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: red),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: red),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
