import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  final String buttontitle;
  final Color buttonColor;
  final VoidCallback onPressed;
  const MyButton({
    Key? key,
    required this.buttontitle,
    this.buttonColor = Colors.grey,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: buttonColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                buttontitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            
          ),
        ),
      ),
    );
  }
}
