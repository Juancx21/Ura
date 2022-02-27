import 'package:flutter/material.dart';
import 'package:ura/ui/pages/home/widgets/draggablesheet.dart';

import 'package:ura/ui/shared/utils/uisizing.dart';
import 'package:ura/ui/shared/utils/uispacing.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _fradius = 30;
    double _getstatusbar = UiSizing.hStatusbar(context);
    return Scaffold(
      body: Stack(
        children: [
          DraggableScrollableSheet(
            snap: true,
            initialChildSize:
                1 - UiSizing.pheight(context, 300 + _getstatusbar),
            minChildSize: 1 - UiSizing.pheight(context, 300 + _getstatusbar),
            maxChildSize: 1 - UiSizing.pheight(context, 64 + _getstatusbar),
            builder: ((context, scrollController) => Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFEEECF4),
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: const Text(
                        "Events today",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: UiSizing.wScreen(context),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(_fradius),
                                topRight: Radius.circular(_fradius))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(_fradius),
                              topRight: Radius.circular(_fradius)),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: const [
                                Text("data"),
                                Text("data"),
                                Text("data"),
                                Text("data"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))),
          ),
          // DraggableSheet(
          //   minheight: UiSizing.hScreen(context) - 300 + _getstatusbar,
          //   maxheight: UiSizing.hScreen(context) - 64 + _getstatusbar,
          // )
        ],
      ),
    );
  }
}
