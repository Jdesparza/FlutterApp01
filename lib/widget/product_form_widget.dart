import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductFormWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  final String? price;
  final String? category;
  final ValueChanged<String> onChangedImage;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedPrice;
  final ValueChanged<String> onChangedCategory;

  const ProductFormWidget({
    Key? key,
    this.image = '',
    this.title = '',
    this.description = '',
    this.price = '',
    this.category = '',
    required this.onChangedImage,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedPrice,
    required this.onChangedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildImage(),
          SizedBox(height: 8),
          buildTitle(),
          SizedBox(height: 8),
          buildDescription(),
          SizedBox(height: 16),
          buildPrice(),
          SizedBox(height: 16),
          buildCategory(),
          SizedBox(height: 16),
        ],
      ),
    ),
  );

  Widget buildImage() => TextFormField(
    maxLines: 1,
    initialValue: image,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'URL Image',
      hintStyle: TextStyle(color: Colors.black87),
    ),
    validator: (image) =>
    image != null && image.isEmpty ? 'Debe ingresar la URL de una imagen' : null,
    onChanged: onChangedImage,
  );

  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Título',
      hintStyle: TextStyle(color: Colors.black87),
    ),
    validator: (title) =>
    title != null && title.isEmpty ? 'El título no debe estar vacío' : null,
    onChanged: onChangedTitle,
  );

  Widget buildDescription() => TextFormField(
    maxLines: 5,
    initialValue: description,
    style: const TextStyle(color: Colors.black87, fontSize: 18),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Descripción del producto...',
      hintStyle: TextStyle(color: Colors.black87),
    ),
    validator: (description) => description != null && description.isEmpty
        ? 'La descripción no puede estar vacía'
        : null,
    onChanged: onChangedDescription,
  );

  Widget buildPrice() => TextFormField(
    maxLines: 1,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    initialValue: price,
    style: const TextStyle(color: Colors.black87, fontSize: 18),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: '0.0',
      hintStyle: TextStyle(color: Colors.black87),
    ),
    validator: (price) => price != null && price.isEmpty
        ? 'Debe ingresar un precio...'
        : null,
    onChanged: onChangedPrice,
  );

  Widget buildCategory() => TextFormField(
    maxLines: 1,
    initialValue: category,
    style: const TextStyle(color: Colors.black87, fontSize: 18),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Categoría del producto...',
      hintStyle: TextStyle(color: Colors.black87),
    ),
    validator: (category) => category != null && category.isEmpty
        ? 'Debe ingresar la categoría'
        : null,
    onChanged: onChangedCategory,
  );
}