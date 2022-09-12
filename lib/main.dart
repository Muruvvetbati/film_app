import 'package:film_app/DetailPage.dart';
import 'package:film_app/Films.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 Future<List<Films>> filmsInsert()async{
   var filmsList =<Films>[];
   var f1 = Films(1, "Breking Bad", "breaking.jpg", 25.50);
   var f2 = Films(2, "The Crown", "crown.jpg", 24.50);
   var f3 = Films(3, "Harry Porter", "harry.jpg", 30.50);
   var f4 = Films(4, "Lupin", "lupin.jpg", 22.50);
   var f5 = Films(5, "Stranger Things", "stranger.jpg", 23.50);
   var f6 = Films(6, "The Lord of the Rings", "yuzuk.jpg", 35.50);

   filmsList.add(f1);
   filmsList.add(f2);
   filmsList.add(f3);
   filmsList.add(f4);
   filmsList.add(f5);
   filmsList.add(f6);

   return filmsList;


 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Films"),
      ),
      body: FutureBuilder<List<Films>>(
        future: filmsInsert(),
        builder: (context,snapshot){

    if(snapshot.hasData){
    var filmsList = snapshot.data;
      return GridView.builder(
    itemCount: filmsList!.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 2 / 3.5,
    ),
    itemBuilder: (context,indeks){
        var film =filmsList[indeks];
         return GestureDetector(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(film: film,)));
           },
           child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                         Image.asset("photos/${film.film_photo_name}"),
                         Text(film.film_name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                         Text("${film.film_cost}\u{20BA}",style: TextStyle(fontSize: 16),),
    ],
    ),
                  ),
    ),
         );

    },
    );
    }else{
      return Center();
    }

        }
      ),
          );
  }
}
