import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerAnimation extends StatefulWidget {
  final Widget navigateToWidget;
  final Widget widget;
  final double raduisBorder;
  final Color color;

  const OpenContainerAnimation({
    super.key,
    required this.widget,
    required this.raduisBorder,
    required this.color,
    required this.navigateToWidget,
  });

  @override
  State<OpenContainerAnimation> createState() => _OpenContainerAnimationState();
}

class _OpenContainerAnimationState extends State<OpenContainerAnimation> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: widget.color,
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 390),
      closedBuilder: (_, openContainer) {
        return widget.widget;
      },
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.raduisBorder),
      ),
      openBuilder: (_, closeContainer) {
        return widget.navigateToWidget;
      },
    );
  }
}
// Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.blue,
//             title: const Text('Go back'),
//             leading: IconButton(
//               onPressed: closeContainer,
//               icon: const Icon(Icons.arrow_back, color: Colors.white),
//             ),
//           ),
//         );