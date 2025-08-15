import 'package:flutter/material.dart';

class AppbarPokemon extends StatelessWidget {
  const AppbarPokemon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('lib/features/data/assets/logo.png', height: 40,),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          
        }, 
        icon: Icon(Icons.menu, color: Colors.white,)
        ),

        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.yellow.shade100,
              radius: 18,
              child: ClipOval(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfUjfHaxJwOzAeU5PnpDpzHE4DPEhPiPDz6Q&s',                  
                  height: 26,
                  ),
              ),
              
            ),
               onPressed: () {},
               )
        ],
      
      );
  }
}