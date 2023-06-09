import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import 'icon.dart';

class MySearchBar extends StatefulWidget {
  final rightElement;
  final label;
  final borderColor;
  final iconColor;
  MySearchBar(
      {this.rightElement,
      this.label = "Search",
      this.borderColor = Colors.black,
      this.iconColor});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar>
    with SingleTickerProviderStateMixin {
  int hastype = 0;
  late AnimationController controller;

  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.iconColor);
    return Scaffold(
      body: Container(
        width: 343,
        height: 48,
        // padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        // margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.borderColor,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFFF5F5F5),
        ),

        // height: 200,
        child: Row(
          children: [
            if (hastype > 0) ...[
              Container(
                // padding: EdgeInsets.fromLTRB(19, 23, 23, 0),

                // child: AnimatedIcon(
                //   icon: AnimatedIcons.menu_arrow,
                //   progress: controller,
                //   color: Colors.black,
                // ),
                margin: const EdgeInsets.fromLTRB(19, 0, 18, 0),

                child: UikIcon(
                  valIcon: Icons.arrow_back,
                  iconColor: widget.iconColor,
                  iconSize: 20.0,
                ),
              ),
            ],
            if (hastype == 0) ...[
              Container(
                margin: const EdgeInsets.fromLTRB(19, 0, 12, 0),
                child: UikIcon(
                  valIcon: Icons.search,
                  iconColor: widget.iconColor,
                  iconSize: 18.0,
                ),
              ),
            ],

            //..................................................TextField........................................//
            Flexible(
              child: Container(
                width: 231,
                height: 24,
                // color: Colors.red,
                margin: EdgeInsets.only(top: 12, bottom: 12),
                child: Container(
                  margin: EdgeInsets.only(top: 2),
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration.collapsed(
                      hintText: widget.label,
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (text) {
                      setState(() {
                        hastype = text.length;
                        // controller.forward();
                      });
                    },
                  ),
                ),
              ),
            ),
            //.............................................................Mic Icon...................................//

            if (widget.rightElement != null) ...[
              Container(
                child: UikIcon(
                  valIcon: widget.rightElement,
                  iconColor: widget.iconColor,
                  iconSize: 18,
                ),
                margin: EdgeInsets.fromLTRB(22, 14, 22, 14),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
