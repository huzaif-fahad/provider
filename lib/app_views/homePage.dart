import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_providers/product_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final productmodel = Provider.of<productProvider>(context, listen: false);
    productmodel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final productmodel = Provider.of<productProvider>(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: productmodel.products?.products?.length,
          itemBuilder: ((context, index) {
            // return Text(
            //     productmodel.product?.products![index].title.toString() ??
            //         "ok");
            return Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productmodel.products?.products![index].title ?? ""),
                      Text(productmodel.products?.products![index].price
                              .toString() ??
                          '')
                    ],
                  ),
                  // ClipRRect(
                  //   child: Image.network(
                  //       productmodel.product?.products![index].thumbnail ?? ""),
                  // )
                  // CachedNetworkImage(
                  //   imageUrl:
                  //       productmodel.product?.products![index].thumbnail ?? "",
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                  // CachedNetworkImage(
                  //   imageUrl: "http://via.placeholder.com/200x150",
                  //   imageBuilder: (context, imageProvider) => Container(
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: imageProvider,
                  //           fit: BoxFit.cover,
                  //           colorFilter: ColorFilter.mode(
                  //               Colors.red, BlendMode.colorBurn)),
                  //     ),
                  //   ),
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                  SizedBox(
                    height: 200,
                    child: Container(
                      color: Colors.blue,
                      child: Image(
                        image: CachedNetworkImageProvider(
                            productmodel.products?.products![index].thumbnail
                                    .toString() ??
                                "",
                            scale: 1.5),
                      ),
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
