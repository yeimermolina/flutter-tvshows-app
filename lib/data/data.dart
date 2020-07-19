import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/show.dart';

const CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Action',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Comedy',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Terror',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Thrillers',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Romantic',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Documentaries',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Suspense',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'International',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Anime',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Sify',
    color: Colors.teal,
  ),
];

const SHOWS = const [
  Show(
    id: 's1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Dark',
    imageUrl:
        'https://www.eluniverso.com/sites/default/files/styles/powgallery_1024/public/fotos/2020/06/donde-se-rodo-dark.jpg?itok=VRnPB0Rw',
    episodes: [
      'Episode 1',
      'Episode 2',
      'Episode 3',
    ],
    cast: [
      'Test 1',
      'Test 2',
      'Test 3'
    ],
    audience: Audience.AllPublic,
    isOnNetflix: false
  ),
  Show(
    id: 's2',
    categories: [
      'c1',
      'c2',
      'c3'
    ],
    title: 'Friends',
    imageUrl:
        'https://as01.epimg.net/epik/imagenes/2019/07/10/portada/1562758044_573047_1562758158_noticia_normal_recorte1.jpg',
    episodes: [
      'Episode 1',
      'Episode 2',
      'Episode 3',
      'Episode 4',
      'Episode 5',
    ],
    cast: [
      'Test 1',
      'Test 2',
      'Test 3'
    ],
    audience: Audience.AllPublic,
    isOnNetflix: true,
    isOnPrime: true
  ),
  Show(
    id: 's3',
    categories: [
      'c1',
      'c2',
      'c3'
    ],
    title: 'Friends 2',
    imageUrl:
        'https://as01.epimg.net/epik/imagenes/2019/07/10/portada/1562758044_573047_1562758158_noticia_normal_recorte1.jpg',
    episodes: [
      'Episode 1',
      'Episode 2',
      'Episode 3',
      'Episode 4',
      'Episode 5',
    ],
    cast: [
      'Test 1',
      'Test 2',
      'Test 3'
    ],
    audience: Audience.AllPublic,
    isOnNetflix: true,
    isOnPrime: true
  )
];
