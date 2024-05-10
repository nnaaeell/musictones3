  import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:musictones3/cubit/cubit.dart';
import 'package:musictones3/cubit/states.dart';

import 'package:url_launcher/url_launcher.dart';


class DrawerA extends StatelessWidget {
  final double width;
  final double height;
    const DrawerA({Key? key,
    required this.width,
    required this.height
    }):super(key: key);


    @override
    Widget build(BuildContext context) {
      return BlocConsumer<MainCubit,CubitStates>(
          builder:(context,state)=> Container(

            height: height,
            width: width*0.7,
            child: Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight:Radius.circular(15),bottomRight: Radius.circular(15))
              ),// الشريط الجانبي
              child: Column(

                children: <Widget>[
                  Container(
                    height: height*0.2,
                    color: HexColor('00C5FF'),
                    child: Center(
                      child:  Image.asset('assets/logoH.png',
                        height: height*0.2,
                      )
                    ),
                  ),
                  line(20),
                  SizedBox(
                    height: height*0.05,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListTile(title: Text('قناة اليوتيوب'),leading: SvgPicture.asset("assets/youtube.svg",
                      height: height*0.1,
                      width: width*0.1,
                    ), onTap: () {

                     }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(title: Text('قناتنا على التلغرام'),leading:SvgPicture.asset("assets/telegram.svg",
                      height: height*0.1,
                      width: width*0.1,
                    ), onTap: () {

                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(title: Text('رابط كروب الفيس'),leading:SvgPicture.asset("assets/facebook.svg",
                      height: height*0.1,
                      width: width*0.1,
                    ), onTap: () {

                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(title: Text('صفحتنا على الفيسبوك'),leading: SvgPicture.asset("assets/facebook.svg",
                      height: height*0.1,
                      width: width*0.1,
                    ), onTap :(){

                    }),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(title: Text('تابعوني على التلغرام'),leading: SvgPicture.asset("assets/instagram.svg",
                      height: height*0.1,
                      width: width*0.1,
                    ), onTap :(){

                    }),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                        text:TextSpan(
                            children: [
                              TextSpan(
                                  text: 'This application was produced by ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16
                                  )
                              ),
                              TextSpan(
                                  text: 'Spark ',
                                  style: TextStyle(
                                      color: HexColor('2595a2'),
                                      fontSize: 16

                                  ),
                                  recognizer: TapGestureRecognizer()..onTap=(){
                                    launchErrorReportingLink1("https://www.facebook.com/profile.php?id=61553751250143&mibextid=kFxxJD");
                                  }
                              ),

                            ]
                        )),
                  ),
                  SizedBox(
                    height: height*0.04,
                  ),
                  line(20),

                ],
              ),
            ),
          ),
          listener: (context,state){});
    }
  }

  void launchErrorReportingLink1(String u) {
    launchUrl(Uri.parse(u));
  }


  Widget line(double padding)=>Padding(
    padding:  EdgeInsets.symmetric(horizontal: padding),
    child: Container(
      height: 2,
      color: Colors.grey.shade300,
    ),
  );




