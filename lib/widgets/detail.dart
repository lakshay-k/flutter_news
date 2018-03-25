import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget{

  var _img;
  var _tittle;
  var _date;
  var _description;
  var _link;
  var _category;

  DetailPage(this._img,this._tittle,this._date,this._description,this._category,this._link);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_category),
      ),
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Material(
          elevation: 4.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
              _getImageNetwork(_getImageUrl(_img,250,'')),
              _getBody(_tittle,_date,_description),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImageNetwork(url){

    try{
      if(url != '') {

        return new Container(
          height: 200.0,
          child: new FadeInImage.assetNetwork(
            placeholder: 'assets/place_holder.jpg',
            image: url,
            fit: BoxFit.cover,),
        );
      }else{
        return new Container(
          height: 200.0,
          child: new Image.asset('assets/place_holder_3.jpg'),
        );
      }

    }catch(e){
      return new Container(
        height: 200.0,
        child: new Image.asset('assets/place_holder_3.jpg'),
      );
    }

  }

  Widget _getBody(tittle,date,description){

    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getTittle(tittle),
          _getDate(date),
          _getDescription(description),
          _getAntLink(),
          _getLink(_link)
        ],
      ),
    );
  }

  Widget _getAntLink() {
    return new Container(
      margin: new EdgeInsets.only(top: 50.0),
      child: new Text("Mais detalhes acesse:",
        style: new TextStyle(fontWeight: FontWeight.bold,
            color: Colors.grey[600]
        ),
      ),
    );
  }
  Widget _getLink(link){

    return new GestureDetector(
      child: new Text(
        link,
        style: new TextStyle(color: Colors.blue),
      ),
      onTap: (){
        _launchURL(link);
      },
    );

  }

  _getTittle(tittle) {
    return new Text(tittle,
    style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0),
    );
  }

  _getDate(date) {
    return new Text(date,
      style: new TextStyle(
          fontSize: 10.0,
          color: Colors.grey
      ),
    );
  }

  _getDescription(description) {
    return new Container(
      margin: new  EdgeInsets.only(top: 10.0),
      child: new Text(description),
    );
  }

  String _getImageUrl(url,height,width){

    return 'http://104.131.18.84/notice/tim.php?src=$url&h=$height&w=$width';

  }

  _launchURL(url) async {

      await launch(url);
  }

}