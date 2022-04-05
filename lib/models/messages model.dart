class Messages
{
  final String txt;
  final String id;

  Messages(this.txt,this.id);

  factory Messages.fromjson(json)
  {
    return Messages(json['messages'],json['id']);
  }
}