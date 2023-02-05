import 'package:evehub/constants.dart';
import 'package:evehub/main.dart';
import 'package:evehub/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  final String matchmail='fake-user';
  final String matchpass='fake-pass';
  static final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String email;
    String pass;

    return SafeArea(
      child: Scaffold(
        
        backgroundColor: kPrimary,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
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
                  ),
                  Hero(
                    tag: 'logo',
                    child: Text(
                      'EveHub', textAlign: TextAlign.start,
                      style: GoogleFonts.pacifico(fontSize: 56,color: Colors.white,decoration: TextDecoration.none),
                    ),
                  ),
                  Text(
                    'Meet your tribe. Discover.', textAlign: TextAlign.start,
                    style: GoogleFonts.cairo(fontSize: 18,color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: inputfield('Email'),
                      validator: (val){
                        if(val!=null && val.trim()!=matchmail)
                        {
                          return 'Invalid email';
                        }else if(val!=null && val.trim()==''){
                          return 'Enter an email';
                        }
                        return null;
                      },
                      onSaved: (val){
                        email=val??'';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: inputfield('Password'),
                      validator: (val){
                        if(val!=null && val!=matchpass)
                          {
                            return 'Invalid password';
                          }
                        else if(val!=null && val.trim()==''){
                          return 'Enter a password';
                        }
                        return null;
                      },
                      onSaved: (val){
                        pass=val??'';
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(formkey.currentState?.validate()??false)
                        {
                          formkey.currentState?.save();
                          showDialog(context: context, builder: (ctx){
                            return AlertDialog(
                              content: Text('Accepted!'),
                              actions: [IconButton(onPressed: () {
                                loginstate=true;
                                Navigator.pop(context);
                                Navigator.pop(context);
                                }, icon: Icon(Icons.check,))],
                            );
                          });
                        }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kBackground
                      ),
                      child: Text('LOGIN',textAlign:TextAlign.center,style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: kBackground,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('OR',style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 18,color: kBackground),),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: kBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return const RegisterScreen();
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kBackground
                      ),
                      child: Text('REGISTER',textAlign:TextAlign.center,style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


InputDecoration inputfield(String label)
{
  return InputDecoration(
      hintText: label,
      hintStyle: GoogleFonts.cairo(
          color: Colors.black.withOpacity(0.3),
          fontWeight: FontWeight.bold
      ),
      filled: true,
      fillColor: kBackground,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
      ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.black,
          width: 4
        )
    ),
    errorStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: Colors.black)
  );
}