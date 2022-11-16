import 'package:flutter/material.dart';

class CardModel extends StatefulWidget {
  const CardModel({Key? key}) : super(key: key);

  @override
  State<CardModel> createState() => _CardModelState();
}

class _CardModelState extends State<CardModel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("data"),
              Icon(Icons.arrow_forward_outlined),
              Text("data"),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 60,
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
                  child: Center(
                    child: Icon(
                      Icons.check,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
