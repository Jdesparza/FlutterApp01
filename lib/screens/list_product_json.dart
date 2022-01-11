import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterapp01/providers/provider_product.dart';
import 'package:flutter/services.dart' as rootBundle;

class ListProductJson extends StatelessWidget {
  final String titulo;

  ListProductJson({required this.titulo}) :super();

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context,data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items =data.data as List<ProductDataModel>;
              return ListView.builder(
                  itemCount: items == null? 0: items.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            color: Colors.black54,
                            width: 1
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 50,
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return DetailScreen(imgProduct: items[index].imageURL.toString(), idProduct: items[index].id.toString());
                                  }));
                                },
                                child: Hero(
                                  tag: items[index].id.toString(),
                                  child: FadeInImage.assetNetwork(
                                      fadeInDuration: const Duration(seconds: 2),
                                      fadeInCurve: Curves.bounceIn,
                                      placeholder: 'assets/img/loading.gif',
                                      image: items[index].imageURL.toString(),
                                      fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    selected = !selected;
                                    (context as Element).markNeedsBuild();
                                  },
                                  child: AnimatedContainer(
                                    color: selected? Colors.deepOrangeAccent[100] : Colors.greenAccent[100],
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    duration: const Duration(seconds: 2),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(padding: const EdgeInsets.only(left: 20,right: 8),child: Text(items[index].name.toString(),style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),),),
                                        Padding(padding: const EdgeInsets.only(left: 20,right: 8),child: Text(items[index].price.toString()),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
    );
  }

  Future<List<ProductDataModel>>ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('data/productos.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}

class DetailScreen extends StatefulWidget {
  final String imgProduct;
  final String idProduct;

  const DetailScreen({Key? key, required this.imgProduct, required this.idProduct,}): super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState(imgProduct: imgProduct, idProduct: idProduct);
}

class _DetailScreenState extends State<DetailScreen> {
  final String imgProduct;
  final String idProduct;

  _DetailScreenState({required this.imgProduct, required this.idProduct}): super();

  double opacidad = 0.5;

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) => Future.delayed(
      const Duration(seconds: 1), () => setState(() { opacidad = 1;})
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: idProduct,
            child: AnimatedOpacity(
              opacity: opacidad,
              duration: const Duration(seconds: 3),
              child: Image(image: NetworkImage(imgProduct), fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
