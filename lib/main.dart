import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //birincil renk özelliği
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});

  final String? name;
  final String? description;
  final int? age;
  final String? imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";

final List<Kitten> _kittens = <Kitten>[
  Kitten(
      name: "Mittens",
      description: "Uzun tüylü tatlı bir kedi",
      age: 2,
      //sunucudan almak için
      //imageUrl: "http://$server:8000/kitten0.jpg"
      imageUrl:
          "https://iaftm.tmgrup.com.tr/a0d773/632/314/0/18/1000/514?u=https://iftm.tmgrup.com.tr/2021/12/07/kedi-bakimi-nasil-yapilir-ev-kedileri-nasil-beslenir-evde-kedi-bakmak-zor-mu-1638862400637.jpeg"),
  Kitten(
      name: "Fluffy",
      description: "Yumuşak tüylü tatlı bir kedi",
      age: 5,
      imageUrl:
          "https://lh3.googleusercontent.com/proxy/wsPuJo-EmhbssuMfovs70XZ2XzylybUnAAEWuo5CYAgcWT9Qj3DIfuG_RR_erYxml7MJfrQ7McUhbhv6Y8gS3X1b6Idnoe8wE55mh6ddW_yW248"),
  Kitten(
      name: "Scooter",
      description: "Uzun tüylü tatlı bir kedi",
      age: 2,
      imageUrl:
          "https://imgrosetta.mynet.com.tr/file/400653/400653-728xauto.jpg"),
  Kitten(
      name: "Steve",
      description: "4 yaşında sevimli bir kedi",
      age: 4,
      imageUrl:
          "https://imgrosetta.mynet.com.tr/file/400653/400653-728xauto.jpg"),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    return SimpleDialog(
      children: [
        //ağa yüklenen resimler için network kullanılır
        Image.network(
          kitten.imageUrl.toString(),
          //tam ekran yapmak için
          fit:BoxFit.fill,
        )
      ],
    );
  }

  //bir dokunuşa yanıt olarak diiyoloğu başlatmak için GestureDetector kullanılır
  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        //dikey merkezleme ve sola hizalama sağlar
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name.toString(),
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Kittens"),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        //her öğenin yüksekliği
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
