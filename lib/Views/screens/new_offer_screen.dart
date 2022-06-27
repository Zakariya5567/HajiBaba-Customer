import 'package:baba/Views/component/custom_appbar.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewOfferScreen extends StatelessWidget {

  NewOfferScreen({Key key}) : super(key: key);

  Size _size;

  @override
  Widget build(BuildContext context) {

    _size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: customAppBar('Offer'),

      body: Padding(

        padding: const EdgeInsets.all(10.0),

        child: SizedBox(

          width: _size.width,

          child: Column(

            children:  [

              const Text("Let's Check",style: TextStyle(
                color: Constant.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),

              Text("Today Offers For You",style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),),

              Expanded(child: ListView.builder(

                itemBuilder: (context,index){

                  return Card(

                    child: Padding(

                      padding: const EdgeInsets.all(10.0),

                      child: Row(

                        children: [

                          Flexible(

                            flex: 60,

                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: const [

                                Text("30%",style: TextStyle(
                                  color: Constant.primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),),

                                SizedBox(height: 10,),

                                Text("Discount on your first order",style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),),

                              ],
                            ),
                          ),

                          const SizedBox(width: 10,),

                          Flexible(

                              flex: 40,

                              child: Container(

                                margin: const EdgeInsets.all(10),

                                child: ClipRRect(

                                  borderRadius: BorderRadius.circular(5.r),

                                  child: CachedNetworkImage(

                                    fit: BoxFit.fill,
                                    imageUrl: "http://hajibabaadmin.asollearning.com/ProductImages/Beef-loin_936204df-2.jpg",
                                    placeholder: (context, url) => CustomWidget.rectangular(height: 170.h, width: 180.w),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),


                              )


                          )

                        ],

                      ),
                    ),

                  );

                },

                itemCount: 6,

              ))

            ],

          ),
        ),
      ),

    );

  }

}
