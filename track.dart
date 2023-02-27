import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Track extends StatefulWidget {
  const Track({super.key});

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '~WELCOME~',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 214, 14, 14),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Track Report!',
                textAlign: TextAlign.center,
              ),
              backgroundColor: Color.fromARGB(255, 73, 9, 9),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 20, 20),
              child: Container(
                width: 364.5,
                height: 850,
                decoration: BoxDecoration(
                  color: const Color(0x71D9D9D9),
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
