import 'dart:convert';
import 'dart:ui';

import 'package:api_call/Modal/todo.dart';
import 'package:api_call/Widgets/todoTile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getTodos();
  } // initState()

  final String url = "https://6087dddba6f4a30017425143.mockapi.io/api/todos";

  getTodos() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.get(Uri.parse(url));

      setState(() {
        todos = Todo.fromJsonList(jsonDecode(response.body) as List<dynamic>);
      });
    } catch (e) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  } // callApi

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.only(top: 60),
        child: !isLoading
            ? ListView.builder(
                itemCount: todos.length,
                itemBuilder: todoItem,

              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  } // build
  Widget todoItem(BuildContext context, int index) =>
      TodoTile(
          title: todos[index].title,
          description: todos[index].description,
          deleteCallBack: () => onDelete(context, index),
      );

  void onDelete(BuildContext context, int index) async {

    setState(() {
      todos.removeAt(index);
    });
  } // onDelete

} // _HomeState

