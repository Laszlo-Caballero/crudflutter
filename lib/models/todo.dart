class Todo{
  String? id;
  String title;
  String description;

  Todo({this.id, required this.title, required this.description}){
    if(id == null || id!.isEmpty){
      id = DateTime.now().toString();
    }
  }
}