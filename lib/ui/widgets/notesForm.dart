import 'dart:ffi';

import 'package:flutter/material.dart';

class NotesForm extends StatefulWidget {
  final String title;
  final String description;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onDescriptionChanged;

  const NotesForm({
    Key key,
    this.title = '',
    this.description = '',
    this.onTitleChanged,
    this.onDescriptionChanged,
  }) : super(key: key);

  @override
  _NotesFormState createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            titleWidget(),
            SizedBox(height: 8),
            descriptionWidget(),
          ],
        ),
      ),
    );
  }

  Widget titleWidget() {
    return TextFormField(
      initialValue: widget.title,
      style: TextStyle(
           fontWeight: FontWeight.bold, fontSize: 25),
      decoration: InputDecoration(
        hintText: 'Title',
        border: InputBorder.none,
      ),
      validator: (val) => val.isEmpty && val == null ? 'Enter a title' : null,
      onChanged: widget.onTitleChanged,
      maxLines: 2,
    );
  }

  Widget descriptionWidget() {
    return TextFormField(
      initialValue: widget.description,
      style: TextStyle(fontSize: 18 ),
      decoration: InputDecoration(
          hintText: 'Description',
          border: InputBorder.none),
      validator: (val) =>
          val.isEmpty && val == null ? 'Enter a description' : null,
      onChanged: widget.onDescriptionChanged,
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }
}
