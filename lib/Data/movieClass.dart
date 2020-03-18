import 'package:flutter/material.dart';

class Movie {
  Movie(
      {this.title,
      this.image,
      this.rating,
      this.categories,
      this.actors,
      this.description,
      this.director}) {
    for (String categ in categories) {
      children.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Text(
          categ,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1.0, color: Colors.grey)),
      ));
    }
  }

  String title;
  List<String> categories;
  double rating;
  Image image;
  List<String> actors;
  String director;
  String description;
  List<Container> children = [];
}

List<Movie> movies = [
  Movie(
      title: 'Joker',
      image: Image(
        fit: BoxFit.cover,
        image: AssetImage('Images/1cover.jpg'),
      ),
      rating: 9.0,
      actors: ['Juaquin', 'Robert Di Niro'],
      description:
          'Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he''s part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.',
      director: 'x',
      categories: ['comedy', 'action', 'drama']),
  Movie(
      title: 'Good Boys',
      image: Image(
        fit: BoxFit.cover,
        image: AssetImage('Images/2.jpg'),
      ),
      rating: 8.0,
      actors: ['Kids'],
      description:
          ' Après avoir été invités à leur première fête, Max, 12ans, panique complètement parce qu'
          'il ne sait pas comment embrasser. A la recherche de conseils, Max et ses meilleurs amis Thor et Lucas décident d'
          'utiliser le drone du père de Max - auquel il n'
          'a évidemment pas le droit de toucher',
      director: 'x',
      categories: ['comedy', 'action', 'drama']),
  Movie(
      title: 'Hustle',
      image: Image(
        fit: BoxFit.cover,
        image: AssetImage('Images/3.jpg'),
      ),
      rating: 8.9,
      actors: ['Lisa', 'Carla'],
      description: 'jhgcvhbjnklbjackjncalkjas,ncaclk ',
      director: 'x',
      categories: ['comedy', 'action'])
];
