import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bonjour Nécromancien',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    print("size : $size");
    print("platform : $platform");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bonjour Nécromancien"),
          leading: const Icon(Icons.favorite),
          actions: const [
            Icon(Icons.handyman),
            Icon(Icons.border_color),
          ],
          centerTitle: true,
          elevation: 7.5,
        ),
        body: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            //margin: const EdgeInsets.all(10),
            //padding: const EdgeInsets.all(15),
            child: Center(
              child: Card(
                elevation: 10,
                margin: EdgeInsets.all(10),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            const Text("Test de la colonne"),
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                fromAsset(height: 200, width: size.width),
                                Padding(
                                  padding: const EdgeInsets.only(top: 150),
                                  child: profilePicture(),
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.favorite),
                                    Icon(Icons.height),
                                    Spacer(),
                                    Text(
                                        "Un autre élémént",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 20,
                              thickness: 1,
                            ),
                            Container(
                              margin: const EdgeInsets.all(20),
                              height: 200,
                              width: size.width,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/gnome.png"),
                                      fit: BoxFit.cover
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(2, 2),
                                        blurRadius: 3,
                                        spreadRadius: 5
                                    )
                                  ],
                                  //shape: BoxShape.circle,
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child: const Text("Container"),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    profilePicture(),
                                    Expanded(
                                      child: simpleText("Gudule"),
                                    )
                                  ]),
                            ),
                            fromNetwork(size),
                            fromAsset(height: 160, width: 160)
                          ]),
                    )
                ),
              ),
            )
        )
    );
  }


  CircleAvatar profilePicture() {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.blue,
      foregroundImage: NetworkImage(
        'https://images.pexels.com/photos/5601140/pexels-photo-5601140.jpeg?cs=srgb&dl=pexels-a-koolshooter-5601140.jpg&fm=jpg',
      ),
    );
  }

  /// widget texte simple
  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text spanDemo() {
    return const Text.rich(
      TextSpan(
          text: "Salut",
          style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
          children: [
            TextSpan(
                text: "second style",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange)
            ),
            TextSpan(
                text: "A l'infini",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color:  Colors.blue
                )
            )
          ]
      ),
    );
  }

  Image fromAsset({required double height, required double width}) {
    return Image.asset(
      "images/gnome.png",
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

  Image fromNetwork(Size size) {
    return Image.network(
        'https://images.pexels.com/photos/5601140/pexels-photo-5601140.jpeg?cs=srgb&dl=pexels-a-koolshooter-5601140.jpg&fm=jpg',
        height: 200,
        fit: BoxFit.cover
    );
  }
}