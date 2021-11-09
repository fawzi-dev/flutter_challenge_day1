import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        textTheme: const TextTheme(
            headline2: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(
              fontWeight: FontWeight.w500,
            ),
            caption: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white)),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.filter_list),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Find',
                      style: textTheme.bodyText1,
                    ),
                    Text(
                      'Inspiration',
                      style: textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'What are you looking for?',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.black.withOpacity(0.7),
                            )),
                        cursorColor: Colors.black12,
                        cursorHeight: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Promo',
                  style: textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: screenSize.height * .35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Cards(screenSize: screenSize, img: 'images/poster.png', caption: 'Best Design',),
                      Cards(screenSize: screenSize, img: 'images/icy.jpg', caption: 'Best Design',),
                      Cards(screenSize: screenSize, img: 'images/kk.png', caption: 'Best Design',),
                      Cards(screenSize: screenSize, img: 'images/icy.jpg', caption: 'Best Design',),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: screenSize.height * .28,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                              'images/kk.png'
                            ),
                            fit: BoxFit.cover
                          ),
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    required this.screenSize,
    required this.caption,
    required this.img,
  }) : super(key: key);

  final Size screenSize;
  final String caption;
  final String img;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            height: screenSize.height * .35,
            width: screenSize.width * .4,
            decoration: BoxDecoration(
              image:DecorationImage(
                  image: AssetImage(img), fit: BoxFit.cover),
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                caption,
                style: textTheme.caption,
              ),
            ),
            height: screenSize.height * .35,
            width: screenSize.width * .4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                    colors: [Colors.transparent, Colors.black54],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        ],
      ),
    );
  }
}
