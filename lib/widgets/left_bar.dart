import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({ Key? key,required this.batWidh }) : super(key: key);

  final double batWidh;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        Container(
          height:25,
          width: batWidh,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            )
          ),
        )
      ],
    );
  }
}