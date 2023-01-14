// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_providers.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {

    

    final moviesPovider = Provider.of<MoviesPovider>(context);

    // ignore: avoid_print
    print(moviesPovider.onDisplayMovies);


    return Scaffold(
      appBar:  AppBar(
        title: const Text('Peliculas en cines'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
        icon: const Icon (Icons.search_outlined),
        onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
           
           ),
        ],
        
      ),
      body:  SingleChildScrollView(
        child: Column(
        children: [

        //tarjetas principales  
         CardSwiper(movies: moviesPovider.onDisplayMovies),

        
        // Slider de peliculas
         MovieSlider(
          movies: moviesPovider.popularMovies,
          title: 'Populares',
          onNextPage: () => moviesPovider.getPopularMovies(),
         )
         
        


        ],
      ),
      )
    );
  }
}