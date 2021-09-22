import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key key}) : super(key: key);

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController _texttextController = TextEditingController();
  void dispose() {
    _texttextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Task"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [_addNewTaskWidget(), _divider()],
          ),
        ));
  }

  _addNewTaskWidget() {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.blueGrey.withOpacity(.2)),
      child: Scrollbar(
        thickness: 6,
        child: TextField(
          controller: _texttextController,
          maxLines: 4,
          decoration: InputDecoration(
              hintText: "e.g morning walk", border: InputBorder.none),
        ),
      ),
    );
  }

  _divider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 1.5,
        ),
        Divider(),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
