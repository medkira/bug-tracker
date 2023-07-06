import 'package:flutter/material.dart';
import 'package:frontend/blocks/categories_scroller.dart';
import 'package:frontend/animation/long_press_menu.dart';
import 'package:frontend/blocks/page_card.dart';
import 'package:frontend/blocks/list_cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          pinned: false,
          snap: false,
          floating: false,
          expandedHeight: 350,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LongPress(widget: PageCard()),
                SizedBox(
                  height: 150,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[CardsList()],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return SizedBox(
                height: 900,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: const <Widget>[CategoriesList()],
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
