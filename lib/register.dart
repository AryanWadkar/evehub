import 'package:evehub/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimary,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'logo',
                          child: Text(
                            'EveHub',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.pacifico(
                                fontSize: 48, color: Colors.white,decoration: TextDecoration.none),
                          ),
                        ),
                        Text(
                          'Meet your tribe. Discover',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.cairo(
                              fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: kBackground,
                        child: Icon(Icons.cancel,color: Colors.black,),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: GoogleFonts.cairo(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: kBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Age',
                      hintStyle: GoogleFonts.cairo(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: kBackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Address',
                      hintStyle: GoogleFonts.cairo(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: kBackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Birth Date',
                      hintStyle: GoogleFonts.cairo(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: kBackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Aadhaar/PAN Card',
                      hintStyle: GoogleFonts.cairo(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: kBackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Area of interest',
                      hintStyle: GoogleFonts.cairo(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: kBackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kBackground),
                child: Text(
                  'REGISTER',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
