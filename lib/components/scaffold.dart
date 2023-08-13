import 'package:flutter/material.dart';

class WScaffold extends StatelessWidget {
  const WScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.bottom = true,
    this.right = true,
    this.left = true,
    this.top = true,
  });

  final Widget child;
  final AppBar? appBar;
  final bool top;
  final bool left;
  final bool bottom;
  final bool right;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        left: left,
        top: top,
        bottom: bottom,
        right: right,
        child: child,
      ),
    );
  }
}
