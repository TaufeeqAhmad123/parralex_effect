import 'dart:math';

import 'package:flutter/material.dart';
import 'package:parralex_effect/model/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  double pageOffset = 0;
  @override
  void initState() {
    pageController = PageController(viewportFraction: 1)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page!;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Vintage Classic!',
                  style: TextStyle(
                      color: Colors.black, fontSize: 46, letterSpacing: 2),
                ),
                SizedBox(height: 5),
                Text(
                  '30 March 1853',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                padding: const EdgeInsets.only(bottom: 30),
                child: PageView.builder(
                    controller: pageController,
                    itemCount: paintings.length,
                    itemBuilder: (context, index) {
                      return Transform.scale(
                        scale: 1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  paintings[index]['image'],
                                  fit: BoxFit.cover,
                                  height: 370,
                                  alignment:
                                      Alignment(-pageOffset.abs() + index, 0),
                                ),
                              ),
                              Positioned(
                                 bottom: 20,
                                left: 10,
                                right: 10,
                                child: Text(
                                  paintings[index]['name'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal),
                                ),
                               
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          )
        ],
      ),
    ));
  }
}
