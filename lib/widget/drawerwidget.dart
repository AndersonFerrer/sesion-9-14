// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sesion9/index.dart';
import 'package:sesion9/preference/preferences.dart';
import 'package:sesion9/route/routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: const RadialGradient(
                      center: Alignment.bottomCenter,
                      radius: .9,
                      colors: <Color>[
                        Colors.blueAccent,
                        Colors.lightBlueAccent,
                      ],
                      stops: <double>[0.0, 1.0],
                      // red to yellow
                      tileMode: TileMode
                          .repeated, // repeats the gradient over the canvas
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(44),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(Preferences.img),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          child: Text(
                            '${Preferences.nombre} ${Preferences.apellido}',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          child: Text(
                            Preferences.descripcion,
                            style: TextStyle(
                                color: Color.fromARGB(255, 207, 206, 206),
                                fontSize: 18),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  size: 32,
                ),
                title: Text(
                  'Inicio',
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, MyRoutes.rHOME);
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage())); */
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: 32,
                ),
                title: Text(
                  'Configuración',
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, MyRoutes.rCONFIG);
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfigPage())); */
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 32,
                ),
                title: Text(
                  'Perfil',
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, MyRoutes.rPERFIL);
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PerfilPage())); */
                },
              ),
              Divider(
                color: Colors.black,
                endIndent: 12,
                indent: 12,
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'All labels',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.inbox_rounded,
                  size: 32,
                ),
                title: Text(
                  'Recibidos',
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.label_important,
                  size: 32,
                ),
                title: Text(
                  'Importante',
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.send,
                  size: 32,
                ),
                title: Text(
                  'Enviar',
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.restore_from_trash_rounded,
                  size: 32,
                ),
                title: Text(
                  'Papelera',
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.all_inbox,
                  size: 32,
                ),
                title: Text(
                  'Todos',
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.error,
                  size: 32,
                ),
                title: Text(
                  'Spam',
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {},
              ),
            ]),
      ),
    );
  }
}
