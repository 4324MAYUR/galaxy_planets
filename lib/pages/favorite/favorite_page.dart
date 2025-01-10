import 'package:flutter/material.dart';
import 'package:galaxy_planets/provider/json_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  JsonProvider read = JsonProvider();
  JsonProvider watch = JsonProvider();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    read = (context).read<JsonProvider>();
    watch = (context).watch<JsonProvider>();
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: const Text(
          "Favorite Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
           ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: read.favoriteModel.favoriteList.isNotEmpty
                  ? ListView.builder(
                      itemCount: read.favoriteModel.favoriteList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white.withOpacity(0.8),
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            leading: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateY(_animationController.value *
                                        2 *
                                        math.pi),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      read.favoriteModel.favoriteList[index]
                                          .image,
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                );
                              },
                            ),
                            title: Text(
                              read.favoriteModel.favoriteList[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Text(
                              "Radius: ${read.favoriteModel.favoriteList[index].radius}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                read.removeFavoritePlanet(index);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text("Your Favorite Planets Page Is Empty !!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
