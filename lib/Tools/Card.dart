import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfluttertest/Models/MovieModel.dart';

class CardWidgets extends StatefulWidget {
 MovieModel movieModel;
 Function favorite;
  CardWidgets({this.movieModel,this.favorite });

  @override
  _CardWidgets createState() => _CardWidgets();
}

class _CardWidgets extends State<CardWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/details',arguments: widget.movieModel),
            child: Row(
              children: <Widget>[
                Image.asset(
                  widget.movieModel.movieUrl,
                  width: 80,
                  height: 100,
                ),
                Container(
                  width: 250,
                  child: Column(
                    children: [

                      Text(widget.movieModel.name),
                      Text(widget.movieModel.description)],
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    color: Colors.white,
                    child:Container(
                        child: Icon(Icons.favorite)),
                    onPressed: widget.favorite,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
