/*
 * @Description:  router_animations demo  
 * @Author: zhubiao
 * @Date: 2022-10-28 15:50:51
 */
import 'package:example/second_page.dart';
import 'package:flutter/material.dart';
import 'package:router_animations/router_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'router_animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'router_animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(AnimationsRoute(
                const SecondPage(),
                transitionsType: TransitionsType.transformY,
                currentPageContext: context,
                fontWidget: widget,
              )
              );
            },
            child: const ListTile(title: Text('跳转')),
          ),
        ],
      ),
    );
  }
}
