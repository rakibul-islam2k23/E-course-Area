import 'package:flutter/material.dart';
import 'package:task_sm/widgets/custom_elevated_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final String image;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    this.onButtonPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.03,
            horizontal: width * 0.05,
          ),
          constraints: BoxConstraints(
            maxHeight: height * 0.6,
            maxWidth: width * 0.9,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 3,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  width: width * 0.5,
                  height: height * 0.2,
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                flex: 2,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                  ),
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                flex: 2,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                    fontFamily: "Inter",
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomElevatedButton(title: buttonText, ontab: onButtonPressed!),
            ],
          ),
        ),
      ),
    );
  }
}
