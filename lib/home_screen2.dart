import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:musictones3/cubit/states.dart';
import 'package:musictones3/drawer.dart';
import 'package:musictones3/model/items.dart';

import 'package:url_launcher/url_launcher.dart';

import 'cubit/cubit.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {

  bool showSpinKit=true;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return BlocConsumer<MainCubit,CubitStates>(
        builder:(context,state)=>Scaffold(
          drawer: DrawerA(width: width, height: height),
          body:showSpinKit?Center(child: Column(
            children: [
              SizedBox(
                height: height*0.45,
              ),
              SpinKitChasingDots(color:HexColor('00C5FF'),size: 100,),
            ],
          )): Stack(
            children: [

              Column(
                children: [
                  SizedBox(
                    height: height*0.299,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      height: height*0.7,
                      color:HexColor('00C5FF'),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(80),),
                            color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: height*0.05,
                            ),
                            Expanded(
                              child: ListView.separated(itemBuilder:(context,index)=>builtItem(height,width,MainCubit.get(context).items[index]),
                                  separatorBuilder:(context,index)=>SizedBox(height: height*0.015,),
                                  itemCount:MainCubit.get(context).items.length),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: height*0.3,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
                    color:HexColor('00C5FF'),
                  ),
                  child: Center(child: buildLogo(width, height)),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height*0.3,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: width*0.85),
                    child: Container(
                      height: 0.4,
                      color:HexColor('00C5FF'),
                    ),
                  )
                ],
              ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    SizedBox(
    height: height*0.02,

    ),
    Builder(
    builder:(context)=> IconButton(
    padding:  EdgeInsets.only(top: 5,left: 10),
    onPressed: () {
    Scaffold.of(context).openDrawer();
    },
    icon: SvgPicture.asset("assets/menu.svg",
    height: height*0.05,

    ),
    )
    )

    ],
    )

            ],
          ),
        ),
        listener: (context,state){
          if(state is GetItemsSuccessState){
            setState(() {
              showSpinKit=false;
            });
          }
        });
  }

  Widget builtItem(double height,double width,Item item)=>Padding(

    padding:  EdgeInsets.symmetric(horizontal: width*0.03),
    child: Container(
      height: height*0.10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HexColor('f6f6f6')
      ),
      child: Container(
        width: double.infinity,
        //height:height*(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(
                  width: 20,
                  // width: width*(0.02),
                ),
                Expanded(
                  child: Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${item.text}',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),


                        Text('اضغط هنا لمعاينة السيتات',
                          style: TextStyle(
                              color: HexColor('314151'),
                              fontSize: 16
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  padding:  EdgeInsets.only(top: 5,left: 10),
                  onPressed: () {
                    launchErrorReportingLink1(item.link);
                  },
                  icon: SvgPicture.asset("assets/download.svg",
                    height: height*0.05,

                  ),
                )

              ],
            ),

          ],
        ),
      ),
    ),
  );

  Widget buildLogo(width,height)=>Padding(
    padding:  EdgeInsets.only(top: height*0.03),
    child: Container(

      child: Image(
        image:AssetImage('assets/logoH.png',
        ),
      ),
    ),
  );

  void launchErrorReportingLink1(String u) {
    launchUrl(Uri.parse(u));
  }
}