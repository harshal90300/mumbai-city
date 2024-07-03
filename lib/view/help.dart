import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12)
          ),
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("HELP:-Are you finding it difficult to access/navigate through the content/pages of this Portal? This section attempts to help you have a pleasant experience while browsing this Portal."),
          
              )
            ]
    )
        )
        )
    );
  }
}