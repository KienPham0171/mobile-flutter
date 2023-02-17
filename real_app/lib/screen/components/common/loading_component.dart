import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
        child: ShowcaseCard(
          child:
          Image.asset("assets/cupertino_activity_indicator_small.gif"),
          // width: double.infinity,
          // label: "Size ${i.round()}",
        ),

      ),
    );
  }
}


class ShowcaseCard extends StatelessWidget {
  final Widget child;
  final double width;
  final String? label;
  final String? caption;

  const ShowcaseCard({
    Key? key,
    required this.child,
    this.width = 200,
    this.label,
    this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (label != null)
          Container(
            width: width,
            margin: EdgeInsets.only(bottom: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label!,
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3A3A3C),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        Center(
          child: Container(
            width: width,
            height: width,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                child,
                if (caption != null)
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Container(
                          width: width,
                          height: 30,
                          color: Colors.white30,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              caption!,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8E8E93),
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Center(
          child: Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.withOpacity(0.3),
            child:  Image.asset(
              "assets/cupertino_activity_indicator_small.gif",
            ),
          ),
        ), );
    return Positioned.fill(
      child: Align(
        alignment: Alignment.centerRight,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            child: Image.asset("assets/cupertino_activity_indicator_small.gif",),
          ),
        ),
      ),
    );
  }
}

