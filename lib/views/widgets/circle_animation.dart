import 'package:flutter/widgets.dart';

class CirculeAnimation extends StatefulWidget {
  final Widget child;
  const CirculeAnimation({super.key,required this.child});

  @override
  State<CirculeAnimation> createState() => _CirculeAnimationState();
}

class _CirculeAnimationState extends State<CirculeAnimation> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

          controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 50000,));

    controller.forward();
    controller.repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0,end: 1.0).animate(controller),
      child: widget.child,
    );
  }
}