import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotMesLoading extends StatelessWidget {
  const BotMesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: CircleAvatar(
                  child: FaIcon(
                    FontAwesomeIcons.robot,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              )),
          SizedBox(
            width: 8,
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: const SpinKitThreeBounce(
              color: Colors.grey,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
