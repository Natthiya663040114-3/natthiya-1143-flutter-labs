import 'package:flutter/material.dart';
import 'models/product_model.dart';
import 'components/product_card.dart';
import 'screens/product_detail.dart';

void main() {
  runApp(const ProductGalleryApp());
}

class ProductGalleryApp extends StatelessWidget {
  const ProductGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Gallery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ProductGalleryScreen(),
    );
  }
}

class ProductGalleryScreen extends StatelessWidget {
  const ProductGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = ProductModel.getSampleProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Gallery by 663040114-3'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.70,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(product: products[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
