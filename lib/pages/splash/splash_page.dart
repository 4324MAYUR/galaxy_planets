import 'dart:async';
import 'package:flutter/material.dart';
import 'package:galaxy_planets/provider/json_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  loadData() async {
    await Provider.of<JsonProvider>(context, listen: false).loadJson();
  }
  @override
  void initState() {
    super.initState();
    loadData();
  }
    @override
  Widget build(BuildContext context) {
      Timer(
        const Duration(seconds: 8),
            () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
      );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/image.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "My Awesome App",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "The Best App for You!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ],
            ),
            const Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
