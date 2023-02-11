import 'package:flutter/material.dart';
import 'package:pixel/models/product_model.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/view_model/api_view_model.dart';
import 'package:pixel/views/app_screens.dart/main_screens.dart/detail_screen.dart';
import 'package:provider/provider.dart';

class ApiReuseClass extends StatelessWidget {
  ApiReuseClass({super.key, required this.item});

  String item;

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    final we = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppValues.smallTextColor),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(Icons.arrow_back_ios_new,
                color: AppValues.smallTextColor, size: 25)),
      ),
      body: FutureBuilder<ProductModel>(
          future: context.read<ApiProvider>().fetctCategeoryData(item),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.products.length,
                  itemBuilder: ((context, index) {
                    var product = snapshot.data!.products[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 10),
                      child: SizedBox(
                        height: he * .25,
                        width: we,
                        child: Card(
                          color: Colors.green[100],
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Hero(
                                  tag: product.id,
                                  child: Image(
                                      height: 150,
                                      width: 135,
                                      image: NetworkImage(product.thumbnail)),
                                ),
                              ),
                              SizedBox(
                                height: he * .25,
                                width: we * .50,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        product.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      product.description,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: AppValues.smallTextColor,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "\$ ${product.price}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF403B58),
                                              shape: const StadiumBorder(),
                                            ),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return DetailScreen(
                                                    imagesList: product.images,
                                                    id: product.id,
                                                    brand: product.brand,
                                                    title: product.title,
                                                    description:
                                                        product.description,
                                                    image: product.thumbnail,
                                                    price: product.price,
                                                    rating: product.rating);
                                              }));
                                            },
                                            child: const Text('Buy'))
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppValues.appMainColor,
                ),
              );
            }
          })),
    );
  }
}
