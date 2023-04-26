import 'package:flutter/material.dart';

import 'icon.dart';

class MyTabBar extends StatefulWidget {
  final List<IconData> ll;
  final isBorder;
  final indicatorColor;
  final backgroundColor;
  final iconSize;
  final topMargin;
  MyTabBar({
    this.topMargin = 18.74,
    this.iconSize = 27.0,
    this.backgroundColor = Colors.white,
    required this.ll,
    this.isBorder = false,
    this.indicatorColor = Colors.white,
  });
  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.ll.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var ll = widget.ll;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 104,
        //  padding: const EdgeInsets.all(16),
        margin: EdgeInsets.only(
          top: widget.topMargin,
        ),
        decoration: BoxDecoration(
          border: (widget.isBorder == true) ? Border.all() : null,
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor,
        ),
        child: Column(
          children: [
            TabBar(
              indicatorColor: widget.indicatorColor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              tabs: <Widget>[
                for (int i = 0; i < ll.length; i++) ...[
                  Tab(
                    icon: UikIcon(
                      valIcon: ll[i],
                      iconSize: widget.iconSize,
                      // iconColor: Colors.red,
                    ),
                  ),
                ],
              ],
            ),
            Container(
              width: 100,
              height: 4,
              color: Colors.grey.shade300,
              margin: EdgeInsets.only(top: 10),
            ),
          ],
        ),
      ),
    );
  }
}
