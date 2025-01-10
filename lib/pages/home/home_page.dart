import 'package:flutter/material.dart';
import 'package:galaxy_planets/provider/json_provider.dart';
import 'package:galaxy_planets/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  JsonProvider read = JsonProvider();
  JsonProvider watch = JsonProvider();

  @override
  Widget build(BuildContext context) {
    read = (context).read<JsonProvider>();
    watch = (context).watch<JsonProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    (context).read<ThemeProvider>().changeTheme();
                    Navigator.pop(context);
                  },
                  child: (context).read<ThemeProvider>().isDark
                      ? const Text("Light Mode")
                      : const Text("Dark Mode"),
                ),
              ),
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/favorite");
                  },
                  child: const Text("Favorite Page"),
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
        title: const Text(
          "Galaxy Planets",
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
              child: ListView.builder(
                itemCount: read.planetsDetails.length,
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
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          read.planetsDetails[index].image,
                          fit: BoxFit.fill,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      title: Text(
                        read.planetsDetails[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text(
                        "Radius: ${read.planetsDetails[index].radius}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/detail',
                          arguments:
                          Provider.of<JsonProvider>(context, listen: false)
                              .planetsDetails[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
