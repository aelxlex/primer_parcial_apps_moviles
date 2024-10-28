import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: galeria_imagenes(),
    );
  }
}

class galeria_imagenes extends StatelessWidget {
  final List<String> imageUrls = [
    'https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75',
    'https://www.educaciontrespuntocero.com/wp-content/uploads/2020/04/mejores-bancos-de-imagenes-gratis.jpg',
    'https://www.hola.com/horizon/square/aa89e0e412be-mapaches-curiosidades-mascota-t.jpg',
    'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455_1280.jpg',
    'https://i.pinimg.com/originals/f0/a5/97/f0a5978ed9808bb3423d0e103c0121b4.jpg',
    'https://img.freepik.com/fotos-premium/silueta-mapache-silueta-mapache_989332-2566.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeria de Imagenes"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImageScreen(imageUrls[index]),
                ),
              );
            },
            child: Image.network(imageUrls[index], fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}

class FullScreenImageScreen extends StatelessWidget {
  final String imageUrl;

  FullScreenImageScreen(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Imagen Completa"),
      ),
      body: Center(
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}