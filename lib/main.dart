import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

const d_green = const Color(0xFF54D3C2);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels Booking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchSection(),
            HotelSection(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(55);
  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
        onPressed: null,
      ),
      backgroundColor: d_green,
      title: Text(
        'Home',
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.white,
            size: 20,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.white,
            size: 20,
          ),
          onPressed: null,
        ),
      ],
      centerTitle: true,
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(1,1)
                    )
                  ],
                ),

                //Propriete du box de recherche
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Faites une recherche',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                  ),
                ),
                height: 50,
              ),
              ),

              SizedBox(width: 10),

              //Bouton de recherche

              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: d_green,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(1,1)
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: null,
                  child: Icon(
                    Icons.search,
                    size: 26,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 60,
                width: 100,
                color: Colors.blue,
                margin: EdgeInsets.all(10),
              ),
              Container(
                height: 60,
                width: 100,
                color: Colors.blue,
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
        ],
      ),
      color: Colors.grey[300],
    );
  }
}
//Listes des differentes videos disponibles
class HotelSection extends StatelessWidget {
  final List videoList = [
    {
      'title': 'Grand Royl Hotel',
      'place': 'wembley, London',
      'distance': 2,
      'review': 36,
      'picture': 'images/image1.jpg',
      'price': '180',
    },
    {
      'title': 'Queen Hotel',
      'place': 'wembley, London',
      'distance': 3,
      'review': 13,
      'picture': 'images/image2.jpg',
      'price': '220',
    },
    {
      'title': 'Grand Mal Hotel',
      'place': 'wembley, London',
      'distance': 6,
      'review': 88,
      'picture': 'images/image3.jpg',
      'price': '400',
    },
    {
      'title': 'Hilton',
      'place': 'wembley, London',
      'distance': 11,
      'review': 34,
      'picture': 'images/image1.jpg',
      'price': '910',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Text(
                  'Liste des videos :',
                ),
              ],
            ),
          ),
          Column(
              children: videoList.map((e) => VideoCard(e)
          ).toList(),
          ),
        ],
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final Map videoData;
  VideoCard(this.videoData);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
      child: Column(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(image: AssetImage(videoData['picture'],
              ),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      //child: Image.asset(videoData['picture'],)
    );
  }
}







