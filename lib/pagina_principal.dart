import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';

class PaginaPrincipal extends StatefulWidget {
  get channel => IOWebSocketChannel.connect("ws://192.168.0.105:1880/ws/test");

  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final channel = IOWebSocketChannel.connect("ws://192.168.0.105:1880/ws/test");

  void _buttonCentral(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Colors.white,
            child: new Wrap(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Atualizar",
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      appBar: new AppBar(
        title: const Text('Space X'),
        bottom: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'Capsula espacial Crew Dragon - SPACE X',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.flight_takeoff,
                  color: Colors.blue,
                ),
                onPressed: () {
                  //
                },
              ),
              SizedBox(
                width: 10,
              ),
            ]),
      ),
      body: Container(
        color: Colors.black38,
        child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                color: Colors.blue[600],
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    new Text(
                      "Monitoramento de dados da Crew Dragon",
                      textScaleFactor: 1.1,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Column(children: <Widget>[
            Card(
              color: Colors.black45,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  StreamBuilder(
                    stream: widget.channel.stream,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.hasData ? '${snapshot.data}' : '',
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.brightness_6,
                      color: Colors.white,
                    ),
                    trailing: Icon(
                      Icons.invert_colors,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Temperatura e Umidade',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ]),
          SizedBox(
            height: 0,
          ),
          Column(
            children: <Widget>[
              Card(
                color: Colors.black,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    new Text(
                      "  Acompanhamento da capsula em tempo real",
                      textScaleFactor: 1.1,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.timer,
                      color: Colors.blue[600],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[600],
        onPressed: () => {
          _buttonCentral(context),
        },
        tooltip: 'Increment Counter',
        child: Icon(Icons.flight_takeoff),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
