import 'package:flutter/material.dart';
import 'package:myfluttertest/Models/LoginModel.dart';
import 'package:myfluttertest/Models/MovieModel.dart';
import 'package:myfluttertest/Tools/Card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentindex = 0;
  List<MovieModel> movieList = [
    MovieModel(
        name: "Titanic",
        year: '1997',
        director: 'Bapy Mamun',
        description: 'This My First English Movie',
        star: 'Jack & Rose',
        genreMovieUrl: [
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg',
          'assets/backGround.jpg'
        ],
        movieUrl: 'assets/backGround.jpg')
  ];
  List<MovieModel> favoriteList = [];
  List<MovieModel> lists=[];

  @override
  Widget build(BuildContext context) {
    final Login args = ModalRoute.of(context).settings.arguments;
    if(_currentindex==0)
    lists = movieList;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(args.userName),
        elevation: 10,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 20.0, right: 10.0),
              child: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/'),
                child: Text('Logout'),
              )),
        ],
      ),
      body: ListView(
        children: lists
            .map((e) => CardWidgets(
                  movieModel: e,
                  favorite: () {
                    setState(() {
                      if (_currentindex == 0) {
                        movieList.remove(e);
                        favoriteList.add(e);
                        lists=movieList;
                      } else {
                        movieList.add(e);
                        favoriteList.remove(e);
                        lists=favoriteList;
                      }
                      print(movieList.length );
                      print(favoriteList.length );

                    });
                  },
                ))
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(
            title: Text('Movies'),
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.favorite),
          ),
        ],
        onTap: (index) async {
          setState(() {
            _currentindex = index;

            if (index == 0) {
              lists = movieList;
            } else {
              lists = favoriteList;
            }
          });
        },
      ),
    );
  }
}
