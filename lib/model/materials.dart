class Materials {
  String? workplanMaterialId;
  String? workplanId;
  String? workplanMaterialCode;
  String? workplanMaterialName;
  String? workplanMaterialUom;
  String? workplanMaterialQty;

  Materials(
      {this.workplanMaterialId,
      this.workplanId,
      this.workplanMaterialCode,
      this.workplanMaterialName,
      this.workplanMaterialUom,
      this.workplanMaterialQty});

  Materials.fromJson(Map<String, dynamic> json) {
    workplanMaterialId = json['workplan_material_id'];
    workplanId = json['workplan_id'];
    workplanMaterialCode = json['workplan_material_code'];
    workplanMaterialName = json['workplan_material_name'];
    workplanMaterialUom = json['workplan_material_uom'];
    workplanMaterialQty = json['workplan_material_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['workplan_material_id'] = workplanMaterialId;
    data['workplan_id'] = workplanId;
    data['workplan_material_code'] = workplanMaterialCode;
    data['workplan_material_name'] = workplanMaterialName;
    data['workplan_material_uom'] = workplanMaterialUom;
    data['workplan_material_qty'] = workplanMaterialQty;
    return data;
  }
}
