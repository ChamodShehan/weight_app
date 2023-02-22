import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  const RightBar({ Key? key,required this.batWidh }) : super(key: key);

  final double batWidh;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Container(
          height:25,
          width: batWidh,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)
            )
          ),
        )
      ],
    );
  }
}