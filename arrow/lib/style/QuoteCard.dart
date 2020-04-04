import 'package:flutter/material.dart';
import '../function/QuoteFn.dart';

class QuoteCard extends StatelessWidget {

  final QuoteFn quote;
  final Function delete;
  QuoteCard({this.quote,this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                quote.text,
                style:TextStyle(
                  fontSize: 18.0,
                  color:Colors.grey[600]
                )
              ),
            ),
            SizedBox(height: 6.0,),
            Center(
              child: Text(
                quote.author,
                style:TextStyle(
                  fontSize: 14.0,
                  color:Colors.grey[600]
                )
              ),
            ),
            SizedBox(height: 6.0,),
            FlatButton.icon(
              onPressed: delete,
              label: Text('Delete Quote'),
              icon: Icon(Icons.delete),
            )
          ],
        ),
      )
    );
  }
}