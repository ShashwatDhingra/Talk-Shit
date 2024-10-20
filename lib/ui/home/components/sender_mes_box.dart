import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SenderMesBox extends StatelessWidget {
  const SenderMesBox({super.key, required this.messageText});

  final messageText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(),
            flex: 3,
          ),
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                messageText,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: 24)
        ],
      ),
    );
  }
}
