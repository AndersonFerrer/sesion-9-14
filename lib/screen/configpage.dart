// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:sesion9/index.dart';
import 'package:sesion9/preference/preferences.dart';
import 'package:sesion9/provider/theme_provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final imgController = TextEditingController(text: Preferences.img);
  final nombreController = TextEditingController(text: Preferences.nombre);
  final apellidoController = TextEditingController(text: Preferences.apellido);
  final descripcionController =
      TextEditingController(text: Preferences.descripcion);
  final celularController = TextEditingController(text: Preferences.celular);
  final ciudadController = TextEditingController(text: Preferences.ciudad);
  final paisController = TextEditingController(text: Preferences.pais);
  final emailController = TextEditingController(text: Preferences.email);
  final webController = TextEditingController(text: Preferences.web);
  final twitterController = TextEditingController(text: Preferences.twitter);

  guardar() {
    Preferences.img = imgController.text;
    Preferences.apellido = apellidoController.text;
    Preferences.nombre = nombreController.text;
    Preferences.ciudad = ciudadController.text;
    Preferences.celular = celularController.text;
    Preferences.email = emailController.text;
    Preferences.twitter = twitterController.text;
    Preferences.web = webController.text;
    Preferences.pais = paisController.text;
    Preferences.apellido = apellidoController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        centerTitle: true,
        actions: [
          Switch.adaptive(
              value: Preferences.theme,
              onChanged: (value) {
                Preferences.theme = value;
                final themeP =
                    Provider.of<ThemeProvider>(context, listen: false);
                value ? themeP.darkMode() : themeP.lightMode();
                setState(() {});
              })
        ],
      ),
      drawer: DrawerWidget(),
      body: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Datos: ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 175,
                          child: TextFieldWidget(
                            controller: nombreController,
                            label: 'Nombre',
                            /*     initialValue: Preferences.nombre, */
                            keyboardType: TextInputType.name,
                            hintText: 'Nombre',
                            prefixIcon: Icon(Icons.person),
                            /* onChanged: (value) {
                              Preferences.nombre = value;
                              setState(() {});
                            }, */
                          ),
                        ),
                        SizedBox(
                          width: 175,
                          child: TextFieldWidget(
                            controller: apellidoController,
                            label: 'Apellido',
/*                             initialValue: Preferences.apellido, */
                            keyboardType: TextInputType.name,
                            hintText: 'Apellido',
                            prefixIcon: Icon(Icons.person),
/*                             onChanged: (value) {
                              Preferences.apellido = value;
                              setState(() {});
                            }, */
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFieldWidget(
                      controller: imgController,
                      label: 'Imagen',
/*                       initialValue: Preferences.img, */
                      keyboardType: TextInputType.text,
                      hintText: 'Imagen',
                      prefixIcon: Icon(Icons.photo),
                      /*                      onChanged: (value) {
                        Preferences.img = value;
                        setState(() {});
                      }, */
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 175,
                          child: TextFieldWidget(
                            controller: celularController,
                            label: 'Celular',
/*                             initialValue: Preferences.celular, */
                            keyboardType: TextInputType.text,
                            hintText: 'Celular',
                            prefixIcon: Icon(Icons.phone_android),
                            /*   onChanged: (value) {
                              Preferences.celular = value;
                              setState(() {});
                            }, */
                          ),
                        ),
                        SizedBox(
                          width: 175,
                          child: TextFieldWidget(
                            controller: twitterController,
                            label: 'Twitter',
                            /*     initialValue: Preferences.twitter, */
                            keyboardType: TextInputType.text,
                            hintText: 'Twitter',
                            prefixIcon: Icon(Icons.people),
                            /*                           onChanged: (value) {
                              Preferences.twitter = value;
                              setState(() {});
                            }, */
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFieldWidget(
                      controller: descripcionController,
                      label: 'Cargo Profesional',
                      /*          initialValue: Preferences.descripcion, */
                      keyboardType: TextInputType.text,
                      hintText: 'Cargo Profesional',
                      prefixIcon: Icon(Icons.badge),
                      /*   onChanged: (value) {
                        Preferences.descripcion = value;
                        setState(() {});
                      }, */
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFieldWidget(
                      controller: emailController,
                      label: 'Correo Electrónico',
                      /*   initialValue: Preferences.email, */
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Correo Electrónico',
                      prefixIcon: Icon(Icons.email),
                      /*    onChanged: (value) {
                        Preferences.email = value;
                        setState(() {});
                      }, */
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFieldWidget(
                      controller: webController,
                      label: 'Sitio Web',
                      /*  initialValue: Preferences.web, */
                      keyboardType: TextInputType.url,
                      hintText: 'Sitio Web',
                      prefixIcon: Icon(Icons.web),
                      /*   onChanged: (value) {
                        Preferences.web = value;
                        setState(() {});
                      }, */
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 175,
                          child: TextFieldWidget(
                            controller: paisController,
                            label: 'Pais',
                            /*  initialValue: Preferences.pais, */
                            keyboardType: TextInputType.name,
                            hintText: 'Pais',
                            prefixIcon: Icon(Icons.flag),
                            /*     onChanged: (value) {
                              Preferences.pais = value;
                              setState(() {});
                            }, */
                          ),
                        ),
                        SizedBox(
                          width: 175,
                          child: TextFieldWidget(
                            controller: ciudadController,
                            label: 'Ciudad',
                            /*  initialValue: Preferences.ciudad, */
                            keyboardType: TextInputType.name,
                            hintText: 'Ciudad',
                            prefixIcon: Icon(Icons.location_city),
                            /*   onChanged: (value) {
                              Preferences.ciudad = value;
                              setState(() {});
                            }, */
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Género:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    RadioListTile(
                      activeColor: Colors.green,
                      value: 1,
                      groupValue: Preferences.genero,
                      title: Text('Masculino'),
                      onChanged: (value) {
                        Preferences.genero = value ?? 1;
                        setState(() {});
                      },
                    ),
                    RadioListTile(
                      activeColor: Colors.green,
                      value: 2,
                      groupValue: Preferences.genero,
                      title: Text('Femenino'),
                      onChanged: (value) {
                        Preferences.genero = value ?? 2;
                        setState(() {});
                      },
                    ),
                    MaterialButton(
                      onPressed: () {
                        guardar();
                      },
                      child: Center(
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment(0.0,
                                  1.0), // 10% of the width, so there are ten blinds.
                              colors: <Color>[
                                Colors.blue,
                                Colors.lightBlueAccent,
                              ], // red to yellow
                              tileMode: TileMode
                                  .repeated, // repeats the gradient over the canvas
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Guardar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
