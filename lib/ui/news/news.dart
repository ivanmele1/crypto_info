import 'package:cryptoinfo/model/newsModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class NewsScreen extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _NewsScreen();
  }
}

class _NewsScreen extends State<NewsScreen> {

  Future<List<NewsModel>> fetchNews() async {
    List<NewsModel> news = [];
    var url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN';

    final response = await http.get(
        url
    );

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      Map<String, dynamic> responseJSON = json.decode(response.body);
      if (responseJSON["Data"] != null && responseJSON["Data"].length > 0) {
        for (int i = 0; i < responseJSON["Data"].length; i++) {
          news.add(NewsModel.fromJSON(responseJSON["Data"][i]));
        }
        print(news.length);
        return news;
      }
    } else {
      // If that response was not OK, throw an error.
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height:  0.0,
            child: Card(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var datetime = DateTime.fromMillisecondsSinceEpoch(
                      snapshot.data[index].published_on*1000);
                  print(datetime.day);
                  var format = DateFormat("dd/MM/yyyy");
                  var dateString = format.format(datetime);
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${snapshot.data[index].title}',
                            style: TextStyle(
                                fontFamily: 'RobotoLight',
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '${dateString}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 5.0),
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Image.network(
                                      '${snapshot.data[index].img}'),
                                ),
                              ),
                              Text(
                                '${snapshot.data[index].name}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black87,
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if(snapshot.hasError) {
          return Container(
            height: 0.0,
            child: Center(
              child: Text('No News Available'),
            ),
          );
        } else {
          return Container(
            height: 0.0 ,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}