class Bilet {
  final int bilet;
  const Bilet({required this.bilet});

  factory Bilet.fromJson(Map<String, dynamic> map) {
    return Bilet(bilet: map["bilet"] ?? 0);
  }
}

List<Bilet> jsontobiletlar(List list) =>
    List.from(list.map((e) => Bilet.fromJson(e)));
