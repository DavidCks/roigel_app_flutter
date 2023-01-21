import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roigel_app_flutter/styles/app_bar_style.dart';

class RoigelAppBar extends StatefulWidget {
  const RoigelAppBar({super.key});

  @override
  State<RoigelAppBar> createState() => _RoigelAppBarState();
}

class _RoigelAppBarState extends State<RoigelAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(appBarSvgPadding),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(150, 255, 0, 0),
                        offset: Offset(0, appBarShadowBlurRadius),
                        blurRadius: appBarShadowBlurRadius,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(150, 255, 238, 0),
                        offset: Offset(
                            appBarShadowBlurRadius, -appBarShadowBlurRadius),
                        blurRadius: appBarShadowBlurRadius,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(150, 0, 0, 0),
                        offset: Offset(
                            -appBarShadowBlurRadius, -appBarShadowBlurRadius),
                        blurRadius: appBarShadowBlurRadius,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    "icons/Zirkel.svg",
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(13),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(150, 71, 71, 71),
                          offset: Offset(0.0, 0.0),
                          blurRadius: appBarShadowBlurRadius,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 20.0,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
