import 'package:flutter/material.dart';
import '../../Models/Style/someStyle.dart';

class StructurePage extends StatelessWidget {
  final List<Widget> children;
  
  const StructurePage({ 
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: paddingContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
