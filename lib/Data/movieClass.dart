import 'package:flutter/material.dart';

class Movie {
  Movie(
      {this.title,
      this.image,
      this.rating,
      this.categories,
      this.actors,
      this.description,
      this.director});

  String title;
  List<String> categories;
  double rating;
  Image image;
  List<String> actors;
  String director;
  String description;
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
      description: 'jhgcvhbjnklbjackjncalkjas,ncaclk ',
      director: 'x',
      categories: ['comedy', 'action', 'drama']),
  Movie(
      title: 'Good Boys',
      image: Image(
        fit: BoxFit.cover,
        image: AssetImage('Images/2.jpg'),
      ),
      rating: 8.0,
      actors: ['Lisa', 'Carla'],
      description: 'jhgcvhbjnklbjackjncalkjas,ncaclk ',
      director: 'x',
      categories: ['comedy', 'action', 'drama']),
  Movie(
      title: 'Hustle',
      image: Image(
        fit: BoxFit.cover,
        image: AssetImage('Images/3.jpg'),
      ),
      rating: 8.9,
      actors: ['Kids'],
      description: 'jhgcvhbjnklbjackjncalkjas,ncaclk ',
      director: 'x',
      categories: ['comedy', 'action'])
];
