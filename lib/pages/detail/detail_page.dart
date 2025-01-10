import 'package:flutter/material.dart';
import 'package:galaxy_planets/modals/json_modal.dart';
import 'package:galaxy_planets/provider/json_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  JsonProvider read = JsonProvider();
  JsonProvider watch = JsonProvider();

  @override
  Widget build(BuildContext context) {
    read = (context).read<JsonProvider>();
    watch = (context).watch<JsonProvider>();
    JsonDecodeModel data =
        ModalRoute.of(context)!.settings.arguments as JsonDecodeModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Detail Page",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<JsonProvider>(context, listen: false)
                          .favoritePlanet(
                        int.parse(data.position),
                      );
                    },
                    child:  data.favorite == true
                        ? const Icon(Icons.favorite)
                        :const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              Center(
                child: Image.asset(
                  data.image,
                  height: 400,
                  width: 350,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white),
              const SizedBox(height: 20),
              Text(
                "Name: ${data.name}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Type: ${data.type}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Radius: ${data.radius}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Orbital Period: ${data.orbital_period}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Gravity: ${data.gravity}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Velocity: ${data.velocity}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Distance from Sun: ${data.distance}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Description: ${data.description}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
