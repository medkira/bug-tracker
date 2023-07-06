import 'package:flutter/cupertino.dart';
import 'package:frontend/blocks/list_cards.dart';

class LongPress extends StatelessWidget {
  final Widget widget;
  const LongPress({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu.builder(
      enableHapticFeedback: true,
      actions: [
        CupertinoContextMenuAction(
          child: SizedBox(
            height: 150,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: const <Widget>[CardsList()],
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      builder: (BuildContext context, Animation<double> animation, ) {
           

        return widget;
      },
    );
  }
}
