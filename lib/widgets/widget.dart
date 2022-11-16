import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: 230,
      height: 50,
      child: ElevatedButton(
        onPressed: (){
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(238, 107, 97, 1.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: Colors.red)
                )
            ),
        ),
        child:Text(
          'Log in',
          style: TextStyle(
              fontSize: 16,
              color: Colors.white70
          ),
        ),
      ),
    );
  }
}
class TField extends StatefulWidget {
  const TField({Key? key}) : super(key: key);

  @override
  State<TField> createState() => _TFieldState();
}

class _TFieldState extends State<TField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 50,
      width: 280,
      // color: Colors.grey,
      decoration: BoxDecoration(

          color: Color.fromRGBO(189, 215, 214, 1.0),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all( color: Color.fromRGBO(127, 157, 156, 1.0),)
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(
                  color: Color.fromRGBO(81, 99, 101, 1.0)
              ),
              border: InputBorder.none
          ),
        ),
      ),
    );
  }
}

