import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_providers.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp( const AppState());



class AppState extends StatelessWidget {
  const AppState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> MoviesPovider(), lazy: true,),
    ],

    child: const MyApp(),
    
    );


  }
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes:{
        'home' : (_) => const HomeScreen(),
        'details' : (_) => const DetailsScreen(),

      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.black
        )
      )
    );
  }
}