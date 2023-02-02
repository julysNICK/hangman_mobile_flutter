import 'package:flutter/material.dart';
import 'package:hangman/ui/colors.dart';
import 'package:hangman/ui/widgets/figure_image.dart';
import 'package:hangman/ui/widgets/letter.dart';
import 'package:hangman/utils/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String word = "Flutter";

  List<String> Alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    double heightRemaining = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: const Text('Hangman'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                figureImage(Game.tries >= 0, "assets/force.jpg"),
                Positioned(
                    top: 22,
                    left: 5,
                    child: figureImage(Game.tries >= 1, "assets/header.jpg")),
                Positioned(
                    top: 22,
                    left: 1,
                    child: figureImage(Game.tries >= 2, "assets/stick.jpg")),
                Positioned(
                    top: 22,
                    left: 25,
                    child: figureImage(Game.tries >= 3, "assets/arm1.jpg")),
                Positioned(
                    top: 22,
                    right: 40,
                    child: figureImage(Game.tries >= 4, "assets/arm2.jpg")),
                Positioned(
                    top: 50,
                    left: 25,
                    child: figureImage(Game.tries >= 5, "assets/leg1.jpg")),
                Positioned(
                    top: 48,
                    right: 40,
                    child: figureImage(Game.tries >= 6, "assets/leg2.jpg")),
              ],
            ),
          ),
          Text(
            Game.tries >= 6 ? "You lose" : "",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split("")
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedLetters.contains(e.toUpperCase())))
                .toList(),
          ),
          SizedBox(
            width: double.infinity,
            height: heightRemaining * 0.41,
            child: GridView.count(
              crossAxisCount: 6,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children: Alphabet.map((e) => ElevatedButton(
                    onPressed: Game.selectedLetters.contains(e)
                        ? null
                        : () {
                            setState(() {
                              Game.selectedLetters.add(e);

                              if (!word
                                  .toUpperCase()
                                  .contains(e.toUpperCase())) {
                                Game.tries++;
                              }
                            });
                          },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Game.selectedLetters.contains(e)
                          ? Colors.grey
                          : AppColor.primaryColorDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(e,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
