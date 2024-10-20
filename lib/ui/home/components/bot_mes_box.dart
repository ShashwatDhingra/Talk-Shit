import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotMesBox extends StatelessWidget {
  const BotMesBox({super.key, required this.messageText});

    final messageText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: FaIcon(
                FontAwesomeIcons.robot,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Text(
                messageText,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          )
        ],
      ),
    );
  }
}
