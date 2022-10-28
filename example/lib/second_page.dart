/*
 * @Description: 
 * @Author: zhubiao
 * @Date: 2022-10-28 16:04:45
 */
import 'package:flutter/material.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第二个页面'),
      ),
      body: GestureDetector(
        child: const Center(
          child: Text('确定'),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
