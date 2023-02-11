import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixel/models/product_model.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/view_model/api_view_model.dart';
import 'package:pixel/views/app_screens.dart/main_screens.dart/detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final he = MediaQuery.of(context).size.height;
    final we = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Image(
              height: 40, image: AssetImage('assets/images/logo_text_blue.png')),
        ),
        body: SizedBox(
          height: he,
          width: we,
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: he * .01),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Great Products',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Best Choice!',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppValues.smallTextColor),
                    ),
                  ),
                  SizedBox(height: he * .01),
                  FutureBuilder<ProductModel>(
                      future: context.read<ApiProvider>().fetctData(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.products.length,
                              itemBuilder: ((context, index) {
                                var product = snapshot.data!.products[index];
                                return SizedBox(
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
                                                image: NetworkImage(
                                                    product.thumbnail)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: he * .25,
                                          width: we * .50,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  ElevatedButton(
                                                      style:
                                                          ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            const Color(0xFF403B58),
                                                        shape: const StadiumBorder(),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                                builder: (context) {
                                                          return DetailScreen(
                                                              imagesList:
                                                                  product.images,
                                                              id: product.id,
                                                              brand: product.brand,
                                                              title: product.title,
                                                              description: product
                                                                  .description,
                                                              image:
                                                                  product.thumbnail,
                                                              price: product.price,
                                                              rating:
                                                                  product.rating);
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
                                );
                              }));
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        } else {
                          return Container(
                            height: he*.6,
                            alignment: Alignment.center,
                            child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppValues.appMainColor,
                                ),
                              ),
                          );
                        }
                      })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
