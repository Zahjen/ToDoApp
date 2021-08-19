import 'package:flutter/material.dart';

class StructurePage extends StatelessWidget {
  final List<Widget> children;
  
  const StructurePage({ 
    Key? key,
    required this.children
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}