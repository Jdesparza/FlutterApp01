import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterapp01/db/products_database.dart';
import 'package:flutterapp01/model/product.dart';
import 'package:flutterapp01/screens/screens_products/edit_product_screen.dart';
import 'package:flutterapp01/screens/screens_products/product_detail_screen.dart';
import 'package:flutterapp01/widget/product_listview_widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late List<Product> products;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshProducts();
  }

  @override
  void dispose() {
    ProductsDatabase.instance.close();

    super.dispose();
  }

  Future refreshProducts() async {
    setState(() => isLoading = true);

    this.products = await ProductsDatabase.instance.readAllProducts();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        'Productos',
        style: TextStyle(fontSize: 24),
      ),
      actions: const [Icon(Icons.search), SizedBox(width: 12)],
    ),
    body: Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : products.isEmpty
          ? const Text(
        'No hay Productos',
        style: TextStyle(color: Colors.black, fontSize: 24),
      )
          : buildProducts(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddEditProductPage()),
        );

        refreshProducts();
      },
    ),
  );

  Widget buildProducts() => ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailPage(productId: product.id!),
          ));

          refreshProducts();
        },
        child: ProductListViewWidget(product: product, index: index),
      );
    },
  );
}