// back ve front arasını saglayan katman
// on yuzdeki istekleri dogru formatta backe atmak vs
import 'dart:convert';
import '../model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos/";

// async await edilmesini daha sonra return edilmesini soyler
  Future<List<Todo>> getUncompletedTodos() async {
    // gettodos metodu olusturduk. ve bu mtd future donduruyor. futuretodo tipinde list donduruyor. async istek bitince sonucudonmesi icin
    final response = await http.get(Uri.parse(
        url)); // istegi responsea esitle. get istegi yaptık sonucunu responsea attık
    List<dynamic> resp = jsonDecode(response.body)[
        "todos"]; // responsein icerigini alip json haline getirdik
    List<Todo> todos = List.empty(growable: true);
    resp.forEach((element) {
      Todo task = Todo.fromJson(element);
      if (task.completed! == false) {
        todos.add(task);
      }
    });
    return todos;
  }

  Future<List<Todo>> getcompletedTodos() async {
    // gettodos metodu olusturduk. ve bu mtd future donduruyor. futuretodo tipinde list donduruyor. async istek bitince sonucudonmesi icin
    final response = await http.get(Uri.parse(
        url)); // istegi responsea esitle. get istegi yaptık sonucunu responsea attık
    List<dynamic> resp = jsonDecode(response.body)[
    "todos"]; // responsein icerigini alip json haline getirdik
    List<Todo> todos = List.empty(growable: true);
    resp.forEach((element) {
      Todo task = Todo.fromJson(element);
      if (task.completed! == true) {
        todos.add(task);
      }
    });
    return todos;
  }
}
