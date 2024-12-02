import 'package:flutter/material.dart';

class TabBarIItem extends StatelessWidget {
  const TabBarIItem({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width*0.3,
      decoration: BoxDecoration(
          color: const Color(0xff14213D),
          borderRadius: BorderRadius.circular(22)
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
