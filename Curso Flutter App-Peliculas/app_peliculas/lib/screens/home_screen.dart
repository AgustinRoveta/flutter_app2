import 'package:flutter/material.dart';
import 'package:app_peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cartelera'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.search_outlined)
            )
        ],
      ),

      body: SingleChildScrollView( 
        child:Column(
        children: const [
        //*tarjetas principales
         CardSwiper(),
        //*Listado horizontal de peliculas
           MovieSlider(),
           MovieSlider(),
           MovieSlider(),
        ],
      )
      ),
    );
  }
}