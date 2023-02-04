import 'package:flutter/material.dart';
import 'package:recipe_app/SecondRoute.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFF3030),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1.24),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 220, 0, 0),
                  child: Image.asset(
                    '../assets/images/restaurant.png',
                    width: 395.5,
                    height: 362.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.05),
                child: Text(
                  'Recipe Guide',
                  style: TextStyle(
                    fontFamily: 'Oregano',
                    color: Colors.white,
                    fontSize: 71,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.05, 0.61),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MySecondPage()),
                    );
                  },
                  child: const Text("Button"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
