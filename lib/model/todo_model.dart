class ToDo{
  String? id;
  String? todoText;
  bool isDone;

ToDo({
   required this.id,
   required this.todoText,
  this.isDone = false,
});


static List<ToDo> todoList(){
  return[
    ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
    ToDo(id: '02', todoText: 'Breakfast', isDone: true),
    ToDo(id: '03', todoText: 'Dinner', isDone: false),
    ToDo(id: '04', todoText: 'Coding', isDone: true),
    ToDo(id: '05', todoText: 'Study', isDone: true),
    ToDo(id: '06', todoText: 'Sleep', isDone: false),
    ToDo(id: '07', todoText: 'Game', isDone: false),
  ];
}



}