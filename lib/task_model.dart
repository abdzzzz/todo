class ToDo {
  String titel;
  String? subtitel;

  bool isdone = false;
  DateTime dt;
  ToDo({
    required this.titel,
    this.subtitel,
    this.isdone = false,
    required this.dt,
  });
}
