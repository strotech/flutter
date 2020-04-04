import 'package:flutter/material.dart';
import '../function/QuoteFn.dart';
import '../style/QuoteCard.dart';
import '../function/AppDrawer.dart';

class Quote extends StatefulWidget {
  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {

  List<QuoteFn> quotes=[
    QuoteFn(author:'Oscar Wilde', text:"Oscar's quote"),
    QuoteFn(author:'Benjamin', text:"Benji's quote"),
    QuoteFn(author:'Thomas', text:"Tom's quote")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  //    drawer:AppDrawer(),
      appBar:AppBar(
        backgroundColor: Colors.redAccent,
        title:Text('Awesome Quotes'),
        centerTitle: true,
      ),
      body:Column(
        children: <Widget>[
          Column(
            children: quotes.map((quote)=>QuoteCard(
              quote: quote,
              delete:(){
                setState(() {
                  quotes.remove(quote);
                });
              }
            )).toList(),
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
            icon:Icon(Icons.arrow_back),
            label:Text('Go to Developer page')
          )
        ],
      )
      
    );
  }
}

