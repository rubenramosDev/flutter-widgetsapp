import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              maxRadius: 30.0,
              minRadius: 0.0,
              backgroundImage: NetworkImage(
                  'https://estaticos.elperiodico.com/resources/jpg/2/0/zentauroepp52974667-tiger-king200330184853-1585587115802.jpg'),
              child: Text('RR'),
              backgroundColor: Colors.purple,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text('RR'),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage(
                'https://cnet4.cbsistatic.com/img/SHf-mha0zOZYHE1hab7dKpUKQ9Y=/940x0/2020/03/31/7cdc930c-12f2-4360-9a6f-0c2cbf7a987f/screen-shot-2020-03-31-at-12-37-47-pm.png')),
      ),
    );
  }
}
