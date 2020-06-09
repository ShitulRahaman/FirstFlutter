import 'package:flutter/material.dart';
import 'package:myfluttertest/Models/MovieModel.dart';

class MovieDetailsPage extends StatefulWidget {
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final MovieModel movieModel = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        width: 500,
        child: Card(
          semanticContainer: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(03, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            movieModel.name,
                            style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            movieModel.year,
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          SizedBox(height: 10,),
                          Text(
                           'Director',
                            style: TextStyle(fontSize: 10, color: Colors.black,),
                          ),
                          Text(
                            movieModel.director,
                            style: TextStyle(fontSize: 13, color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5,),
                          Text(
                           'Cast',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          Text(
                            movieModel.star,
                            style: TextStyle(fontSize: 13, color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'About',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          Text(
                            movieModel.description,
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                 Image.asset(
                    movieModel.movieUrl,
                  width: 248,
                    height: 310,
                  ),

                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'More Movies',
                style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 120,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: movieModel.genreMovieUrl
                        .map(
                          (e) => Padding(
                            child: Image.asset(e),
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          ),
                        )
                        .toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
