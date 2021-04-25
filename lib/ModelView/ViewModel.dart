import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:request/Controller/Network.dart';
import 'package:request/Model/Post.dart';



class HomeViewModel extends ChangeNotifier {
bool isLoading = false;
List<Post> items = new List();

Future apiPostList() async {
  isLoading = true;
  notifyListeners();

  var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
  if (response != null) {
    items = Network.parsePostList(response);
  } else {
    items = new List();
  }

  isLoading = false;
  notifyListeners();
}

Future<bool> apiPostDelete(Post post) async {
  isLoading = true;
  notifyListeners();

  var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

  isLoading = false;
  notifyListeners();
  return response != null;
}
void sendApiToServer(TextEditingController titleController,TextEditingController bodyController,BuildContext context)async {

  String title=titleController.text.trim();
  String body=bodyController.text.trim();
  var time=DateTime.now().microsecond;
  print(time);
  print(body);
  if(title.isEmpty&&body.isEmpty){
    return;
  }
  Post posts=Post(title: title,body:body ,userId:1);
  add(posts,context);
}
void add(Post post,BuildContext context)async {
  isLoading=true;
  var res=await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
  print(res);
  try{
    if(res==null){
      isLoading=false;
      Navigator.of(context).pop({"data":"the result"});
    }
  }catch(e){
    print(e);
  }

}

void sendApiToServers(TextEditingController titleController,TextEditingController bodyController,BuildContext context)async {

  String title=titleController.text.trim();
  String body=bodyController.text.trim();

  var time=DateTime.now().microsecond;
  print(time);
  print(body);
  if(title.isEmpty&&body.isEmpty){
    return;
  }
  Post posts=Post(title: title,body:body ,userId:1,id: 1);
  add(posts,context);
}
void adds(Post post,BuildContext context)async {

  isLoading=true;

  var res=await Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post));
  print(res);
  try{
    if(res==null){

        isLoading=false;

      Navigator.of(context).pop({"data":"the result"});
    }
  }catch(e){
    print(e);
  }

}

}