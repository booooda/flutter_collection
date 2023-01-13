import 'package:flutter/material.dart';
import 'package:flutter_collection/shared_data.dart';

class TransitionScreen extends StatefulWidget {
  TransitionScreen({super.key});

  @override
  State<TransitionScreen> createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen> {
  double imageHeight = 400;
  double titleHeight = 180;
  double actorsHeight = 120;
  double albumHeight = 60;

  bool titleEx = false;
  bool actorsEx = false;
  bool albumEx = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: width,
              height: titleEx || actorsEx || albumEx ? 300 : height * .8,
              child: Image.asset(
                'assets/img/trans/movie.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.all(20),
                width: width,
                height: titleHeight,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Wednesday (TV series)",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (titleEx) {
                                    setState(() {
                                      titleHeight = 180;
                                      titleEx = false;
                                    });
                                  } else {
                                    setState(() {
                                      titleHeight = height * .7;
                                      titleEx = true;
                                    });
                                  }
                                });
                              },
                              child: Icon(
                                  titleEx
                                      ? Icons.keyboard_arrow_down_rounded
                                      : Icons.keyboard_arrow_up_rounded,
                                  size: 30)),
                        )
                      ],
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                "Wednesday Addams is expelled from her school after dumping live piranhas into the school's pool in retaliation for the boys' water polo team bullying her brother, Pugsley. Consequently, her parents, Gomez and Morticia Addams, enroll her at their high school alma mater, Nevermore Academy, a private school for monstrous outcasts, in the town of Jericho, Vermont. Wednesday's cold, emotionless personality and her defiant nature make it difficult for her to connect with her schoolmates and cause her to run afoul of the school's principal. However."),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.all(20),
                width: width,
                height: actorsHeight,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 27, 1, 57),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cast and characters",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (actorsEx) {
                                    setState(() {
                                      actorsHeight = 120;
                                      titleHeight = 180;
                                      actorsEx = false;
                                    });
                                  } else {
                                    setState(() {
                                      titleHeight = height * .7 + 10;
                                      actorsHeight = height * .7;
                                      actorsEx = true;
                                    });
                                  }
                                });
                              },
                              child: Icon(
                                  actorsEx
                                      ? Icons.keyboard_arrow_down_rounded
                                      : Icons.keyboard_arrow_up_rounded,
                                  size: 30,
                                  color: Colors.white)),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: actorsEx ? height * .5 : 0,
                        width: width,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: actors.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        actorsImages[index],
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      actors[index],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              );
                            })),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: width,
                height: albumHeight,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Album",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (albumEx) {
                                    setState(() {
                                      actorsHeight = 120;
                                      titleHeight = 180;
                                      albumHeight = 60;
                                      albumEx = false;
                                    });
                                  } else {
                                    setState(() {
                                      titleHeight = height * .7 + 20;
                                      actorsHeight = height * .7 + 10;
                                      albumHeight = height * .7;
                                      albumEx = true;
                                    });
                                  }
                                });
                              },
                              child: Icon(
                                  albumEx
                                      ? Icons.keyboard_arrow_down_rounded
                                      : Icons.keyboard_arrow_up_rounded,
                                  size: 30,
                                  color: Colors.white)),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: albumEx ? height * .5 : 0,
                            width: width,
                            child: GridView.count(
                              crossAxisCount: 3,
                              childAspectRatio: 1.0,
                              padding: const EdgeInsets.all(4.0),
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: album.map((url) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        url,
                                        fit: BoxFit.cover,
                                      )),
                                );
                              }).toList(),
                            )))
                  ],
                ),
              ),
            ),
            Positioned(top: 10, left: 10, child: backIcon(context))
          ],
        ),
      ),
    );
  }
}

List actors = [
  'Jenna Ortega',
  'Christina Ricci',
  'Catherine Zeta-Jones',
  'Luis Guzmán',
  'Emma Myers',
  'Hunter Doohan',
  'Percy Hynes White',
  'Joy Sunday',
];

List actorsImages = [
  'assets/img/trans/jenna.jpg',
  'assets/img/trans/ricci.jpg',
  'assets/img/trans/catherine.jpg',
  'assets/img/trans/luis.jpg',
  'assets/img/trans/emma.jpg',
  'assets/img/trans/hunter.jpg',
  'assets/img/trans/percy.jpg',
  'assets/img/trans/joy.jpg',
];

List album = [
  'assets/img/trans/1.jpg',
  'assets/img/trans/2.jpg',
  'assets/img/trans/3.jpg',
  'assets/img/trans/4.jpg',
  'assets/img/trans/5.jpg',
  'assets/img/trans/6.jpg',
  'assets/img/trans/7.jpg',
  'assets/img/trans/8.jpg',
  'assets/img/trans/9.jpg',
  'assets/img/trans/10.jpg',
];
