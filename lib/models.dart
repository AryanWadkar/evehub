class EventModel{
  String name;
  String location;
  DateTime date;
  String url;
  String creator;
  EventModel({required this.date,required this.url,required this.name,required this.location,required this.creator});
}

class scrolldata{
  double headingtop;
  double headingleft;
  double loctop;
  double locleft;
  double fontheading;
  double fontloc;
  double poffset;
  scrolldata({required this.fontheading,required this.fontloc,required this.headingtop,required this.locleft,required this.loctop,required this.headingleft,required this.poffset});
}