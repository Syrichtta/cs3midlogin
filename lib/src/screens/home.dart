import 'package:cs3midlogin/src/widgets/weather.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF6218AB),
        body: Container(
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/logo.png', // Replace with your image asset
                  fit: BoxFit.contain, // Adjusts the image fit
                  width: 100, // Optional: specify a width
                  height: 100, // Optional: specify a height
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Day!",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFfffffff),
                              ),
                            ),
                            Text(
                              "25 Sept, 2024",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(200, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.account_circle,
                                size: 50,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // WeatherWidget(),
                    // WeatherWidget(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
