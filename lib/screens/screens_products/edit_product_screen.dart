import 'package:flutter/material.dart';
import 'package:flutterapp01/db/products_database.dart';
import 'package:flutterapp01/model/product.dart';
import 'package:flutterapp01/widget/product_form_widget.dart';

class AddEditProductPage extends StatefulWidget {
  final Product? product;

  const AddEditProductPage({
    Key? key,
    this.product,
  }) : super(key: key);
  @override
  _AddEditProductPageState createState() => _AddEditProductPageState();
}

class _AddEditProductPageState extends State<AddEditProductPage> {
  final _formKey = GlobalKey<FormState>();
  late String image;
  late String title;
  late String description;
  late String price;
  late String category;

  @override
  void initState() {
    super.initState();

    image = widget.product?.image ?? '';
    title = widget.product?.title ?? '';
    description = widget.product?.description ?? '';
    price = widget.product?.price ?? '';
    category = widget.product?.category ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [buildButton()],
    ),
    body: Form(
      key: _formKey,
      child: ProductFormWidget(
        image: image,
        title: title,
        description: description,
        price: price,
        category: category,
        onChangedImage: (image) => setState(() => this.image = image),
        onChangedTitle: (title) => setState(() => this.title = title),
        onChangedDescription: (description) => setState(() => this.description = description),
        onChangedPrice: (price) => setState(() => this.price = price),
        onChangedCategory: (category) => setState(() => this.category = category),
      ),
    ),
  );

  Widget buildButton() {
    final isFormValid = image.isNotEmpty && title.isNotEmpty &&
        description.isNotEmpty && price.isNotEmpty && category.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: isFormValid ? Colors.green[500] : Colors.greenAccent,
        ),
        onPressed: addOrUpdateProduct,
        child: Text('Guardar'),
      ),
    );
  }

  void addOrUpdateProduct() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.product != null;

      if (isUpdating) {
        await updateProduct();
      } else {
        await addProduct();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateProduct() async {
    final prod = widget.product!.copy(
      image: image,
      title: title,
      description: description,
      price: price,
      category: category,
    );

    await ProductsDatabase.instance.update(prod);
  }

  Future addProduct() async {
    final prod = Product(
      image: image,
      title: title,
      description: description,
      price: price,
      category: category,
      createdTime: DateTime.now(),
    );

    await ProductsDatabase.instance.create(prod);
  }
}