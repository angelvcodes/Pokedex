import 'package:flutter/material.dart';
import 'package:pokedex/features/data/models/livebatlemodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'livebatleprovider.g.dart';


@riverpod
class Livebatle extends _$Livebatle {
  @override
  List<Livebatlemodel> build() => [
    Livebatlemodel(
        text: '+ 1000 Viewing',
        imageUrl1: 'lib/features/data/assets/bulba.png', 
        imageUrl2: 'lib/features/data/assets/pika.png',  
        avatarimage1: 'lib/features/data/assets/img1.jpeg', 
        avatarimage2: 'lib/features/data/assets/img2.jpeg', 
        avatarimage3: 'lib/features/data/assets/img3.jpg', 
        colorOne: Colors.purple, 
        colorTwo: Colors.green
        ),

      Livebatlemodel(
        text: '+ 568 Viewing',
        imageUrl1: 'lib/features/data/assets/chari.png', 
        imageUrl2: 'lib/features/data/assets/scue.png',  
        avatarimage1: 'lib/features/data/assets/img2.jpeg',
        avatarimage2: 'lib/features/data/assets/img3.jpg', 
        avatarimage3: 'lib/features/data/assets/img1.jpeg', 
        colorOne: Colors.yellow, 
        colorTwo: Colors.blue
        ),

        Livebatlemodel(
        text: '+ 10k Viewing',
        imageUrl1: 'lib/features/data/assets/pink.png', 
        imageUrl2: 'lib/features/data/assets/pshico.png',  
        avatarimage1: 'lib/features/data/assets/img3.jpg', 
        avatarimage2: 'lib/features/data/assets/img2.jpeg', 
        avatarimage3: 'lib/features/data/assets/img1.jpeg', 
        colorOne: Colors.pink.shade300, 
        colorTwo: Colors.yellow.shade300
        )

         
  ];
}
