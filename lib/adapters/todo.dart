import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  late String note;
  @HiveField(1)
  late String task;
  Todo(this.note,this.task);
}


// class Todo {
//   String ?note;
//   String ?desc;
// }