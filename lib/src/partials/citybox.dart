import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  const CityBox({super.key,  required this.data, required this.onTap });

  final data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: GestureDetector(
        onTap: () {
          onTap( data );
        },
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1/1,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)
                  ),
                ), 
              ),

              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    data['places'][0]['img'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black
                      ]
                    )
                  ),
                ), 
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Text(
                  data['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}