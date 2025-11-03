import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback ontab;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.ontab,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * .9,
      child: ElevatedButton(
        onPressed: ontab,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1B6EF7),
          elevation: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 2,
              fontFamily: "Inter_Regular",
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
