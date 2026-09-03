import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              //color: Color(0xff8D5CE2)
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              "Menu",
              style: TextStyle(
                //color: Colors.white,
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Get.bottomSheet(
                Container(
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.red,
                        ),
                        title: Text("Light Theme"),
                        onTap: () => {
                          Get.changeThemeMode(ThemeMode.light),
                          Get.back(),
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.wb_sunny, color: Colors.red),
                        title: Text("Dark Theme"),
                        onTap: () => {
                          Get.changeThemeMode(ThemeMode.dark),
                          Get.back(),
                        },
                      ),
                    ],
                  ),
                ),
                //barrierColor: Colors.pink,
                //backgroundColor: Colors.purple,
                //isDismissible: true,
                //shape: ,
                //enableDrag: false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: const Text("Language"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Get.bottomSheet(
                Container(
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.language, color: Colors.red),
                        title: Text("English"),
                        onTap: () => {
                          Get.updateLocale(Locale('en', 'US')),
                          Get.back(),
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.translate_outlined,
                          color: Colors.red,
                        ),
                        title: Text("Urdu"),
                        onTap: () => {
                          Get.updateLocale(Locale('ur', 'Pk')),
                          Get.back(),
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
