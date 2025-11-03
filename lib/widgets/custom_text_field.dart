import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            textAlign: TextAlign.start,
            "Email Address",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Inter_Regular",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          maxLines: 1,
          maxLength: 25,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: "Inter_Regular",
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: "dummy@gmail.com",
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            hintStyle: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
              fontFamily: "Inter_Regular",
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Color(0xFFCBD5E1)),
            ),
          ),
        ),
      ],
    );
  }
}
