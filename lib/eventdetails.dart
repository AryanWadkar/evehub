import 'package:evehub/constants.dart';
import 'package:evehub/main.dart';
import 'models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({Key? key,required this.eve}) : super(key: key);
  final EventModel eve;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(eve.url),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        kBackground.withOpacity(0),
                        kBackground
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: kBackground,
                      child: Icon(Icons.arrow_back_rounded,color: kBlack,),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(tag:'event${eve.name}',child: Text(eve.name,style: GoogleFonts.cairo(fontWeight: FontWeight.bold, decoration:TextDecoration.none,fontSize: 32,color: kBlack),)),
                  Text('by ${eve.creator}',style: GoogleFonts.mulish(fontSize: 20,color: kBlack),),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on,size: 36,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(eve.location,style: GoogleFonts.mulish(fontSize: 16),),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Full Address',style: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: kPrimary,fontSize: 10),),
                                    Icon(Icons.arrow_right,color: kPrimary,)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Icon(Icons.event,color: kBackground,),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Text('${getmonth(eve.date.month)} ${eve.date.day}',style: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: kBackground),),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                height: MediaQuery.of(context).size.height*0.04,
                                width: 2,
                                color: kBackground,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Icon(Icons.schedule,color: kBackground,),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Text('${eve.date.hour} PM - END',style: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: kBackground),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Description', style: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: kBlack,fontSize: 18),),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Habitasse platea dictumst quisque sagittis purus sit amet volutpat. Est ultricies integer quis auctor elit. Egestas congue quisque egestas diam in arcu cursus euismod. Dignissim enim sit amet venenatis urna cursus eget nunc scelerisque. Ultricies leo integer malesuada nunc. Accumsan lacus vel facilisis volutpat est velit egestas dui. Volutpat blandit aliquam etiam erat. Dui ut ornare lectus sit amet. Tortor condimentum lacinia quis vel eros. Sed egestas egestas fringilla phasellus. Bibendum at varius vel pharetra. Fusce id velit ut tortor pretium viverra suspendisse potenti.',style: GoogleFonts.mulish(),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star,color: kBlack,),
                        Icon(Icons.star,color: kBlack,),
                        Icon(Icons.star,color: kBlack,),
                        Icon(Icons.star,color: kBlack,),
                        Icon(Icons.star_half,color: kBlack,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('4.8/5',style: GoogleFonts.cairo(color: kBlack,fontWeight: FontWeight.bold,fontSize: 18),),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: kPrimary,
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: Icon(Icons.favorite,color: kBackground,size: 32,),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: kPrimary,
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: Icon(Icons.share,color: kBackground,size: 32,),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 14),
                          decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child:Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.local_activity,color: kBackground,),
                              ),
                              Text('\$ 300 Book Now',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: kBackground),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(Icons.arrow_right,color: kBackground,),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
