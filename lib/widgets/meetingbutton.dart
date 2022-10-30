import 'package:flutter/material.dart';
import 'package:zoom_clone_app/constants.dart';

class MeetingButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final String text;

  const MeetingButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(children: [
        Container(
          width: 70,
          height: 70,
          child: Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ]),
    );
  }
}
