import 'package:flutter/material.dart';

import 'Films.dart';

class DetailPage extends StatefulWidget {

Films film;

DetailPage({required this.film});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("photos/${widget.film.film_photo_name}"),
            Text(widget.film.film_name,style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
            Text("${widget.film.film_cost}\u{20BA}",style: TextStyle(fontSize: 16),),
            SizedBox(width:200 ,height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary:Colors.orange ),
                child: Text("Rent",style: TextStyle(color: Colors.white),),

                onPressed: (){
                  print("${widget.film.film_name} rented");
                },
              ),
            )
          ],


        ),

      ),
    );
  }
}
