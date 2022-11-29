// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:sesion9/index.dart';
import 'package:sesion9/preference/preferences.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 352,
                  decoration: BoxDecoration(
                      gradient: const RadialGradient(
                        center: Alignment.topCenter,
                        radius: .58,
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
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.blue),
                  child: Padding(
                    padding: EdgeInsets.only(top: 56),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                },
                                icon: Icon(
                                  Icons.arrow_back_outlined,
                                  color: Colors.white,
                                )),
                            /*  Spacer(), */
                            Text(
                              'Perfil',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            /*   Spacer(), */
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ConfigPage()));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      (Preferences.img == '')
                          ? ClipRRect(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(64),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    radius: 60,
                                    child: Icon(
                                      Icons.photo,
                                      size: 80,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : ClipRRect(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(64),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage:
                                        NetworkImage(Preferences.img),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '${Preferences.nombre} ${Preferences.apellido}',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Text(Preferences.descripcion,
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[350])),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text('1000',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                                SizedBox(
                                  width: 6,
                                ),
                                Text('Seguidores',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey[350])),
                              ],
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Container(
                              color: Colors.grey,
                              height: 30,
                              width: 2,
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Row(
                              children: [
                                Text('1200',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                                SizedBox(
                                  width: 6,
                                ),
                                Text('Siguiendo',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey[350])),
                              ],
                            ),
                          ])
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Correo Electrónico',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                Preferences.email,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 48,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.phone_android_outlined,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Numero de Celular',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                Preferences.celular,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 48,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.web,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sitio Web',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                Preferences.web,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 48,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.people,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Usuario de Twitter',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                Preferences.twitter,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 48,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.flag,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'País',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                Preferences.pais,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 48,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ciudad',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                Preferences.ciudad,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 48,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (Preferences.genero != 1)
                              ? Icon(
                                  Icons.female,
                                  color: Colors.grey[600],
                                )
                              : Icon(
                                  Icons.male,
                                  color: Colors.grey[600],
                                ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Género',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              (Preferences.genero != 1)
                                  ? Text(
                                      'Femenino',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    )
                                  : Text(
                                      'Masculino',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 48,
                        color: Colors.black,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
