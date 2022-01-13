import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutterapp01/db/products_database.dart';
import 'package:flutterapp01/model/product.dart';
import 'package:flutterapp01/screens/screens_products/edit_product_screen.dart';

class ProductDetailPage extends StatefulWidget {
  final int productId;

  const ProductDetailPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Product product;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshProduct();
  }

  Future refreshProduct() async {
    setState(() => isLoading = true);

    this.product = await ProductsDatabase.instance.readProduct(widget.productId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [editButton(), deleteButton()],
    ),
    body: isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: EdgeInsets.all(12),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          Column(

          ),
        ],
      ),
    ),
  );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditProductPage(product: product),
        ));

        refreshProduct();
      });

  Widget deleteButton() => IconButton(
    icon: Icon(Icons.delete),
    onPressed: () async {
      await ProductsDatabase.instance.delete(widget.productId);

      Navigator.of(context).pop();
    },
  );
}