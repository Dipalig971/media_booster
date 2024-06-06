import 'package:flutter/material.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_outlined),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Container(
              height: 70,
              width: 550,
              decoration: BoxDecoration(
                color: const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              height: 150,
              width: 550,
              decoration: BoxDecoration(
                color: const Color(0xff3B97DA),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      'Top 100 \n Weekly',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          letterSpacing: 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Popular Song',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             children:List.generate(5, (index) => SongContainer()),

           ),
         ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              'By Genre',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
         // GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCr
          // ossAxisCount(crossAxisCount: 3), itemBuilder: (context, index) =>  MusicContainer(),itemCount: 3,),
        ],
      ),
    );
  }

  Padding MusicContainer() {
    return Padding(
          padding: const EdgeInsets.only(left: 20,top: 10,right: 10),
          child: Container(
            height: 150,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
  }

  Padding SongContainer() {
    return Padding(
          padding: const EdgeInsets.only(left: 20,top: 10,right: 10),
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
  }
}
