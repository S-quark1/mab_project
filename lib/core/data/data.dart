import 'package:flutter/material.dart';

import '../constants/constants.dart';

import 'models/movies.dart';

final section1 = List.generate(
  16,
      (index) => Seat(
    isHidden: [0, 1, 4].contains(index),
    isOcuppied: [].contains(index),
  ),
);

final section2 = List.generate(
  16,
      (index) => Seat(
    isHidden: [4, 5, 6, 7].contains(index),
    isOcuppied: [12, 13].contains(index),
  ),
);

final section3 = List.generate(
  16,
      (index) => Seat(
    isHidden: [2, 3, 7].contains(index),
    isOcuppied: [13, 14, 15].contains(index),
  ),
);

final section4 = List.generate(
  20,
      (index) => Seat(
    isHidden: [].contains(index),
    isOcuppied: [1, 2, 3].contains(index),
  ),
);

final section5 = List.generate(
  20,
      (index) => Seat(
    isHidden: [].contains(index),
    isOcuppied: [].contains(index),
  ),
);

final section6 = List.generate(
  20,
      (index) => Seat(
    isHidden: [].contains(index),
    isOcuppied: [14].contains(index),
  ),
);

final seats = [
  section1,
  section2,
  section3,
  section4,
  section5,
  section6,
];

const seatTypes = [
  SeatType(name: 'Available', color: Colors.grey),
  SeatType(name: 'Booked', color: Colors.black),
  SeatType(name: 'Selection', color: AppColors.primaryColor),
];

const dates = [
  MovieDate(day: 11, month: 'OCT', hour: '6:00PM'),
  MovieDate(day: 11, month: 'OCT', hour: '8:00PM'),
  MovieDate(day: 11, month: 'OCT', hour: '9:00PM'),
  MovieDate(day: 11, month: 'OCT', hour: '10:00PM'),
];

final movies = [
  Movie(
    name: 'Batman',
    image: 'assets/image/batman.jpg',
    screenPreview: 'assets/image/batman.jpg',
    description:
    'The Batman is a 2022 American superhero film based on the DC Comics character Batman.'
        'Produced by Warner Bros.',
    type: 'Action',
    hours: 2,
    director: 'Matt Reeves',
    stars: 5,
    actors: [
    ],
    dates: dates,
    seats: seats,
  ),
  Movie(
    name: 'Kimetsu no Yaiba',
    image: 'assets/image/demon.jpg',
    screenPreview: 'assets/images/demon.jpg',
    description:
        'Tanjiro Kamado, who strives to become a demon slayer after his family was slaughtered'
        'and his younger sister Nezuko',
    type: 'Anime',
    hours: 2,
    director: 'Takahashi ',
    stars: 5,
    actors: [
      'Will Smith',
      'Joey Ansah',
      'Naomi Scott',
      'Marwan Kenzari',
      'Nasim Pedrad',
    ],
    dates: dates,
    seats: seats,
  ),
  Movie(
    name: 'Kelinka\nSabina',
    image: 'assets/image/sabina.jpg',
    screenPreview: 'assets/image/sabina.jpg',
    description:
    'The most famous Kelinka of the country - Karsybayeva Sabina - returns to the big screens!',
    type: 'Drama',
    hours: 2,
    director: 'Nurtas',
    stars: 5,
    actors: [
      'Will Smith',
      'Joey Ansah',
      'Naomi Scott',
      'Marwan Kenzari',
      'Nasim Pedrad',
    ],
    dates: dates,
    seats: seats,
  ),
];