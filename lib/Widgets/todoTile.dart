import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
   String? title;
   String? description;
   VoidCallback? deleteCallBack;

   TodoTile({Key? key, required this.title,
     required this.description,
   required this.deleteCallBack,

   })
      : super(key: key);

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool _isElevated = true;


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      height: h * 0.1,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isElevated ? const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ] : null
      ),
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),

            IconButton(onPressed: widget.deleteCallBack, icon: Icon(Icons.delete),),

            GestureDetector(
              onTap: (){
                setState(() {
                  _isElevated = !_isElevated;
                });
              },
              child: Icon(Icons.star),
            ),

          ],
        ),
        title: Text(
          this.widget.title ?? "",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          this.widget.description
          ?? "",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  } }
