import 'package:flutter/material.dart';


class SearchField extends StatefulWidget {


  final Function onSubmit;

  SearchField({this.onSubmit});

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: _controller,
      onSubmitted: widget.onSubmit,
      decoration: InputDecoration(
        labelText: "Search For News",
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        ),
        suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: (){
          _controller.clear();
        },)
      ),



    );
  }
}
