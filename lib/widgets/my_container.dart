import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget? child;
  const MyContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.25),
                Colors.white.withOpacity(0.3),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd)),
      child: child,
    );
  }
}
