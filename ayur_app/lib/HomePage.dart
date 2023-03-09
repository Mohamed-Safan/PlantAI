import 'package:ayur_app/Contact_Screen.dart';
import 'package:ayur_app/Find_Screen.dart';
import 'package:ayur_app/HerbalPlant_Screen.dart';
import 'package:ayur_app/HowTo_use_Screen.dart';
import 'package:ayur_app/Profile_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: const Center(
        child: Text("Home Screen"),
      ),
      drawer: const CustomDrawer(),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Ayur App',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profiles()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('How To Use'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HowToUse()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.eco),
            title: const Text('Herbal Plants'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HerbalPlants()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.explore),
            title: const Text('Find More'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FindPlant()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contact()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you want to log out?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/signIn',
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
