import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'package:network_image_search/network_image_search.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

const botBackgroundColor = Color(0xff444654);
bool dishClicked = false;
var input, recipetitle, loading = false;

Future<String> generateResponse(bool dishClicked) async {
  String aa = "";
  final response = dishClicked == false
      ? aa =
          "\n \n1.Tomato and Onion Salad\n 2.Salsa\n 3.Tomato and Onion Omelet\n 4.Tomato and Onion Soup"
      : aa =
          "Ingredients:\n-3-4 medium-sized tomatoes, sliced\n-1 medium-sized onion, sliced\n-2 tablespoons olive oil\n-1 tablespoon vinegar (white or red wine vinegar works well)\n-Salt and pepper to taste\n-Optional: fresh herbs like basil or parsley\nInstructions:\n\n1.Wash the tomatoes and slice them into bite-sized pieces.\n2.Peel and slice the onion into thin rings.\n3.In a small bowl, whisk together the olive oil, vinegar, salt, and pepper to make the dressing.\n4.In a large bowl, toss together the tomatoes and onions.";
  return aa;
}

class _DashBoardState extends State<DashBoard> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Welcome",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 214, 14, 14),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                 mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildInput(),
                  _buildSubmit(),
                ],
              ),
            ),
            Expanded(child: _buildList()),
            Visibility(
              visible: isLoading,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Ink(
        decoration: const ShapeDecoration(
          color: Color.fromARGB(255, 214, 14, 14),
          shape: CircleBorder(),
        ),
        child: IconButton(
          color: Colors.white,
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () async {
            setState(
              () {
                isLoading = true;
              },
            );
            var input = _textController.text;
            _textController.clear();

            generateResponse(dishClicked).then((value) {
              setState(() {
                isLoading = false;
                var list = value.split('\n');
                for (var i = 2; i < list.length; i++) {
                  _messages.add(
                    ChatMessage(
                      text: list[i],
                    ),
                  );
                }
              });
            });
            _textController.clear();
          },
        ),
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: Container(
        width: 200,
        child: TextFormField(
        controller: _textController,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          hintText: '[Enter Ingrediants....]',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF04030A),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF04030A),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        // style: FlutterFlowTheme.of(context).bodyText1,
      ),),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        var message = _messages[index];
        return MessageWidget(
          text: message.text,
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16),

      color: Color.fromARGB(47, 255, 255, 255),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: InkWell(
                    child: Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                    onTap: () {
                      dishClicked = true;
                      recipetitle = input = text.substring(3);
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Recipe()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<Recipe> {
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    Future.delayed(const Duration(milliseconds: 1500), () async {
      await generateResponse(dishClicked).then((value) {
        input = value;
      });

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipetitle),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16) ,
          child: Column(
            children: [
              Unsplash(
                width: '500',
                category: recipetitle,
                height: '300',
              ),
              Text(input,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],),),
          ),
        );
  }
}
