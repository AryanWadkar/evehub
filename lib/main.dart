import 'package:evehub/scanner.dart';
import 'eventdetails.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'models.dart';


void main() {
  runApp(const MyApp());
}

bool loginstate = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EveHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController ctrl = ScrollController();
  scrolldata val = scrolldata(fontheading: 48, fontloc: 16, headingtop: 20, locleft: 160, loctop: 80, headingleft: 145,poffset: 0);

  scrolldata getval(double x)
  {
    if(x<=45)
      {
        return scrolldata(fontheading: (-0.266*x)+48, fontloc: (-0.133*x)+16, headingtop: (0.444*x)+20, locleft: (-3.33*x)+160, loctop: (0.222*x)+80, headingleft: (-3*x)+145,poffset: 1.155*x);
      }
    return scrolldata(fontheading: 36, fontloc: 10, headingtop: 40, locleft: 10, loctop: 90, headingleft: 10,poffset: 52);
  }

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() {
      setState(() {
        val=getval(ctrl.offset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimary,
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(
            ),
            child: GlowingOverscrollIndicator(
              color: kPrimary,
              axisDirection: AxisDirection.down,
              child: SingleChildScrollView(
                controller: ctrl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Heading(val: val,)),
                        GestureDetector(
                          onTap: () {
                            if (loginstate) {
                              loginstate = false;
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      content: const Text('Logged out!'),
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.check,
                                            ))
                                      ],
                                    );
                                  });
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return const LoginScreen();
                              }));
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: val.poffset),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)),
                        color: kBackground,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                                        return const ScannerPage();
                                      }));
                                    },
                                    child: const Icon(
                                      Icons.qr_code_scanner,
                                      color: kBlack,
                                      size: 56,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  width: 2,
                                  color: kBlack,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: 45,
                                    margin: const EdgeInsets.symmetric(horizontal: 15),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: const Color(0xffEBEBEB)),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.search),
                                        Text(
                                          'Search',
                                          style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Discover',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Find your tribe from our extravagant collection of events.',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.mulish(),
                            ),
                          ),
                          EveCard(event: events[0]),
                          EveCard(event: events[1]),
                          EveCard(event: events[2]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({Key? key, required this.val})
      : super(key: key);
  final scrolldata val;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.15,
      child: Center(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned(
              top: val.loctop,
                left: val.locleft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: val.fontloc,
                      ),
                      Text(
                        'Jabalpur,India',
                        style: GoogleFonts.cairo(fontSize: val.fontloc, color: Colors.white),
                      )
                    ],
                  ),
                )),
            Positioned(
              top: val.headingtop,
              left: val.headingleft,
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Hero(
                  tag: 'logo',
                  child: Text(
                    'EveHub',
                    style: GoogleFonts.pacifico(fontSize: val.fontheading, color: Colors.white,decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<EventModel> events = [
  EventModel(
      date: DateTime.now(),
      url:
          'https://unsplash.com/photos/F2KRf_QfCqw/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8M3x8ZXZlbnR8ZW58MHx8fHwxNjc1NDQzNDk3&force=true',
      name: 'Event ABC',
      location: 'XYZ street',
      creator: 'Zomato'),
  EventModel(
      date: DateTime.now(),
      url:
          'https://unsplash.com/photos/ZODcBkEohk8/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8ZXZlbnR8ZW58MHx8fHwxNjc1NDQzNDk3&force=true',
      name: 'Event MNO',
      location: 'XRTY street',
      creator: 'ITC'),
  EventModel(
      date: DateTime.now(),
      url:
          'https://unsplash.com/photos/nwLTVwb7DbU/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTh8fGV2ZW50fGVufDB8fHx8MTY3NTQ0MzQ5Nw&force=true',
      name: 'Event PQR',
      location: 'NHDF street',
      creator: 'HP'),
];

class EveCard extends StatelessWidget {
  const EveCard({Key? key, required this.event}) : super(key: key);
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return EventDetailsPage(
            eve: event,
          );
        }));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.black,
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(event.url))),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35)),
                  gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0), Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag:'event${event.name}',
                        child: Text(
                          event.name,
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.none
                          ),
                        ),
                      ),
                      Text(
                        event.location,
                        style: GoogleFonts.mulish(
                            fontSize: 8, color: Colors.white),
                      )
                    ],
                  ),
                  Text(
                    '${getmonth(event.date.month)}   ${event.date.day.toString()}',
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, color: Colors.white),
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

String getmonth(int m) {
  if (m == 1) return 'Jan';
  if (m == 2) return 'Feb';
  return '';
}
