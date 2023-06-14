import 'package:advanc_p1/product/model/product_model.dart';
import 'package:advanc_p1/product/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductProvider? ppT;
  ProductProvider? ppF;
  TextEditingController txtSearch=TextEditingController();
  @override
  Widget build(BuildContext context) {
    ppF=Provider.of<ProductProvider>(context,listen: false);
    ppT=Provider.of<ProductProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
         TextField(
           controller: txtSearch,
           decoration: InputDecoration(
             prefixIcon: Icon(Icons.search),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20),
             )
           ),
         ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder(
              future: ppF!.productApi(),
              builder: (context, snapshot) {
                if(snapshot.hasError)
                  {
                    return Center(child: Text("${snapshot.error}"));
                  }
                else if(snapshot.hasData)
                  {
                    ProductModel? product=snapshot.data!;
                      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'home');
                          },
                          child: Container(
                            height: 30.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 30.h,width: 30.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("${product.data![index].productId}"),

                                        ],
                                      ),
                                      SizedBox(height: 7),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage("${product.data![index].productPhotos}"),fit: BoxFit.fill)
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },itemCount: product.data!.length);
                  }
                return Center(child: CircularProgressIndicator());
            },),
          )
        ],
      ),
    ));
  }
}
