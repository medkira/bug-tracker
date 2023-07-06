import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:frontend/blocks/categories_scroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocks/friends_list.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(237, 236, 236, 1),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 97, 98, 125),
                    height: 100,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Message"),
                          Text("Online"),
                          Text("Groups")
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 174, 241, 230),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    height: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // margin: const EdgeInsets.only(left: 15),
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Text(
                            "Favorite Contacts",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: const <Widget>[FriendsList()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(25),
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(237, 236, 236, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 97, 98, 125),
            forceMaterialTransparency: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) {
                return Container(
                  // decoration: const BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(40.0),
                  //     topRight: Radius.circular(40.0),
                  //   ),
                  // ),
                  // color: Color.fromRGBO(237, 236, 236, 1),
                  height: 1000,
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: const <Widget>[
                      CategoriesList(),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}







    // SliverStickyHeader(
        //   header: Container(
        //     decoration: const BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(40),
        //         topRight: Radius.circular(40),
        //       ),
        //       color: Colors.white,
        //     ),
        //     height: 60.0,
        //     padding: EdgeInsets.symmetric(horizontal: 16.0),
        //     alignment: Alignment.centerLeft,
        //   ),
        // ),









  // SliverToBoxAdapter(
  //           child: Container(
  //             color: Color(0xff5c63f1),
  //             height: 40,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: <Widget>[
  //                 Container(
  //                   height: 30,
  //                   decoration: const BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(50.0),
  //                       topRight: Radius.circular(50.0),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),