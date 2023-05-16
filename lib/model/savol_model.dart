class Savol {
  int? id;
  String? savol;
  String? savolEn;
  String? savolRu;
  String? javobA;
  String? javobAEn;
  String? javobARu;
  String? javobB;
  String? javobBEn;
  String? javobBRu;
  String? javobC;
  String? javobCEn;
  String? javobCRu;
  String? javobD;
  String? javobDEn;
  String? javobDRu;
  String? javob;
  int? bilet;
  int? raqam;
  String? rasm;

  Savol({
    this.id,
    this.savol,
    this.savolEn,
    this.savolRu,
    this.javobA,
    this.javobAEn,
    this.javobARu,
    this.javobB,
    this.javobBEn,
    this.javobBRu,
    this.javobC,
    this.javobCEn,
    this.javobCRu,
    this.javobD,
    this.javobDEn,
    this.javobDRu,
    this.javob,
    this.bilet,
    this.raqam,
    this.rasm,
  });

  Savol.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    savol = json['savol'] as String?;
    savolEn = json['savol_en'] as String?;
    savolRu = json['savol_ru'] as String?;
    javobA = json['javob_a'] as String?;
    javobAEn = json['javob_a_en'] as String?;
    javobARu = json['javob_a_ru'] as String?;
    javobB = json['javob_b'] as String?;
    javobBEn = json['javob_b_en'] as String?;
    javobBRu = json['javob_b_ru'] as String?;
    javobC = json['javob_c'] as String?;
    javobCEn = json['javob_c_en'] as String?;
    javobCRu = json['javob_c_ru'] as String?;
    javobD = json['javob_d'] as String?;
    javobDEn = json['javob_d_en'] as String?;
    javobDRu = json['javob_d_ru'] as String?;
    javob = json['javob'] as String?;
    bilet = json['bilet'] as int?;
    raqam = json['raqam'] as int?;
    rasm = json['rasm'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['savol'] = savol;
    json['savol_en'] = savolEn;
    json['savol_ru'] = savolRu;
    json['javob_a'] = javobA;
    json['javob_a_en'] = javobAEn;
    json['javob_a_ru'] = javobARu;
    json['javob_b'] = javobB;
    json['javob_b_en'] = javobBEn;
    json['javob_b_ru'] = javobBRu;
    json['javob_c'] = javobC;
    json['javob_c_en'] = javobCEn;
    json['javob_c_ru'] = javobCRu;
    json['javob_d'] = javobD;
    json['javob_d_en'] = javobDEn;
    json['javob_d_ru'] = javobDRu;
    json['javob'] = javob;
    json['bilet'] = bilet;
    json['raqam'] = raqam;
    json['rasm'] = rasm;
    return json;
  }
}

List<Savol> jsontoList(List list) =>
    List.from(list.map((e) => Savol.fromJson(e)));

  
