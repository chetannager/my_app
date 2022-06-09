import 'package:flutter/material.dart';

class JuceDetails extends StatefulWidget {
  dynamic juiceDetails;

  JuceDetails(this.juiceDetails);

  @override
  State<JuceDetails> createState() => _JuceDetailsState();
}

class _JuceDetailsState extends State<JuceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.juiceDetails["strCategory"]),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              CircleAvatar(
                child: Image.network(widget.juiceDetails["strDrinkThumb"]),
                radius: 45.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                widget.juiceDetails["strCategory"],
                style: const TextStyle(fontSize: 24.0),
              ),
              Text(widget.juiceDetails["strCategory"])
            ],
          ),
        ),
      ),
    );
  }
}
