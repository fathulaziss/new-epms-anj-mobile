import 'm_activity_schema.dart';
import 'm_attendance_schema.dart';
import 'm_block_schema.dart';
import 'm_c_oph_card_schema.dart';
import 'm_c_spb_card_schema.dart';
import 'm_config_schema.dart';
import 'm_cost_control_schema.dart';
import 'm_customer_code_schema.dart';
import 'm_destination_schema.dart';
import 'm_division_schema.dart';
import 'm_employee_schema.dart';
import 'm_estate_schema.dart';
import 'm_material_schema.dart';
import 'm_tph_schema.dart';
import 'm_vendor_schema.dart';
import 'm_vras_schema.dart';
import 'role_schema.dart';
import 't_attendance_schema.dart';
import 't_user_assignment_schema.dart';

class Global {
  List<MEstateSchema>? mEstateSchema;
  List<MDivisionSchema>? mDivisionSchema;
  List<MBlockSchema>? mBlockSchema;
  List<MTPHSchema>? mTPHSchema;
  List<MEmployeeSchema>? mEmployeeSchema;
  List<MVendorSchema>? mVendorSchema;
  List<MCustomerCodeSchema>? mCustomerCodeSchema;
  List<TUserAssignmentSchema>? tUserAssignmentSchema;
  List<MActivitySchema>? mActivitySchema;
  List<MCostControlSchema>? mCostControlSchema;
  List<MMaterialSchema>? mMaterialSchema;
  List<MCOPHCardSchema>? mCOPHCardSchema;
  List<MCSPBCardSchema>? mCSPBCardSchema;
  List<MDestinationSchema>? mDestinationSchema;
  List<MVRASchema>? mVRASchema;
  List<MConfigSchema>? mConfigSchema;
  List<RolesSchema>? rolesSchema;
  List<MAttendanceSchema>? mAttendanceSchema;
  List<TAttendanceSchema>? tAttendanceSchema;

  Global(
      {this.mEstateSchema,
      this.mDivisionSchema,
      this.mBlockSchema,
      this.mTPHSchema,
      this.mEmployeeSchema,
      this.mVendorSchema,
      this.mCustomerCodeSchema,
      this.tUserAssignmentSchema,
      this.mActivitySchema,
      this.mCostControlSchema,
      this.mMaterialSchema,
      this.mCOPHCardSchema,
      this.mCSPBCardSchema,
      this.mDestinationSchema,
      this.mVRASchema,
      this.mConfigSchema,
      this.rolesSchema,
      this.mAttendanceSchema,
      this.tAttendanceSchema});

  Global.fromJson(Map<String, dynamic> json) {
    if (json['M_Estate_Schema'] != null) {
      mEstateSchema = <MEstateSchema>[];
      json['M_Estate_Schema'].forEach((v) {
        mEstateSchema!.add(MEstateSchema.fromJson(v));
      });
    }
    if (json['M_Division_Schema'] != null) {
      mDivisionSchema = <MDivisionSchema>[];
      json['M_Division_Schema'].forEach((v) {
        mDivisionSchema!.add(MDivisionSchema.fromJson(v));
      });
    }
    if (json['M_Block_Schema'] != null) {
      mBlockSchema = <MBlockSchema>[];
      json['M_Block_Schema'].forEach((v) {
        mBlockSchema!.add(MBlockSchema.fromJson(v));
      });
    }
    if (json['M_TPH_Schema'] != null) {
      mTPHSchema = <MTPHSchema>[];
      json['M_TPH_Schema'].forEach((v) {
        mTPHSchema!.add(MTPHSchema.fromJson(v));
      });
    }
    if (json['M_Employee_Schema'] != null) {
      mEmployeeSchema = <MEmployeeSchema>[];
      json['M_Employee_Schema'].forEach((v) {
        mEmployeeSchema!.add(MEmployeeSchema.fromJson(v));
      });
    }
    if (json['M_Vendor_Schema'] != null) {
      mVendorSchema = <MVendorSchema>[];
      json['M_Vendor_Schema'].forEach((v) {
        mVendorSchema!.add(MVendorSchema.fromJson(v));
      });
    }
    if (json['M_Customer_Code_Schema'] != null) {
      mCustomerCodeSchema = <MCustomerCodeSchema>[];
      json['M_Customer_Code_Schema'].forEach((v) {
        mCustomerCodeSchema!.add(MCustomerCodeSchema.fromJson(v));
      });
    }
    if (json['T_User_Assignment_Schema'] != null) {
      tUserAssignmentSchema = <TUserAssignmentSchema>[];
      json['T_User_Assignment_Schema'].forEach((v) {
        tUserAssignmentSchema!.add(TUserAssignmentSchema.fromJson(v));
      });
    }
    if (json['M_Activity_Schema'] != null) {
      mActivitySchema = <MActivitySchema>[];
      json['M_Activity_Schema'].forEach((v) {
        mActivitySchema!.add(MActivitySchema.fromJson(v));
      });
    }
    if (json['M_Cost_Control_Schema'] != null) {
      mCostControlSchema = <MCostControlSchema>[];
      json['M_Cost_Control_Schema'].forEach((v) {
        mCostControlSchema!.add(MCostControlSchema.fromJson(v));
      });
    }
    if (json['M_Material_Schema'] != null) {
      mMaterialSchema = <MMaterialSchema>[];
      json['M_Material_Schema'].forEach((v) {
        mMaterialSchema!.add(MMaterialSchema.fromJson(v));
      });
    }
    if (json['MC_OPH_Card_Schema'] != null) {
      mCOPHCardSchema = <MCOPHCardSchema>[];
      json['MC_OPH_Card_Schema'].forEach((v) {
        mCOPHCardSchema!.add(MCOPHCardSchema.fromJson(v));
      });
    }
    if (json['MC_SPB_Card_Schema'] != null) {
      mCSPBCardSchema = <MCSPBCardSchema>[];
      json['MC_SPB_Card_Schema'].forEach((v) {
        mCSPBCardSchema!.add(MCSPBCardSchema.fromJson(v));
      });
    }
    if (json['M_Destination_Schema'] != null) {
      mDestinationSchema = <MDestinationSchema>[];
      json['M_Destination_Schema'].forEach((v) {
        mDestinationSchema!.add(MDestinationSchema.fromJson(v));
      });
    }
    if (json['M_VRA_Schema'] != null) {
      mVRASchema = <MVRASchema>[];
      json['M_VRA_Schema'].forEach((v) {
        mVRASchema!.add(MVRASchema.fromJson(v));
      });
    }
    if (json['M_Config_Schema'] != null) {
      mConfigSchema = <MConfigSchema>[];
      json['M_Config_Schema'].forEach((v) {
        mConfigSchema!.add(MConfigSchema.fromJson(v));
      });
    }
    if (json['Roles_Schema'] != null) {
      rolesSchema = <RolesSchema>[];
      json['Roles_Schema'].forEach((v) {
        rolesSchema!.add(RolesSchema.fromJson(v));
      });
    }
    if (json['M_Attendance_Schema'] != null) {
      mAttendanceSchema = <MAttendanceSchema>[];
      json['M_Attendance_Schema'].forEach((v) {
        mAttendanceSchema!.add(MAttendanceSchema.fromJson(v));
      });
    }
    if (json['T_Attendance_Schema'] != null) {
      tAttendanceSchema = <TAttendanceSchema>[];
      json['T_Attendance_Schema'].forEach((v) {
        tAttendanceSchema!.add(TAttendanceSchema.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mEstateSchema != null) {
      data['M_Estate_Schema'] = mEstateSchema!.map((v) => v.toJson()).toList();
    }
    if (mDivisionSchema != null) {
      data['M_Division_Schema'] =
          mDivisionSchema!.map((v) => v.toJson()).toList();
    }
    if (mBlockSchema != null) {
      data['M_Block_Schema'] = mBlockSchema!.map((v) => v.toJson()).toList();
    }
    if (mTPHSchema != null) {
      data['M_TPH_Schema'] = mTPHSchema!.map((v) => v.toJson()).toList();
    }
    if (mEmployeeSchema != null) {
      data['M_Employee_Schema'] =
          mEmployeeSchema!.map((v) => v.toJson()).toList();
    }
    if (mVendorSchema != null) {
      data['M_Vendor_Schema'] = mVendorSchema!.map((v) => v.toJson()).toList();
    }
    if (mCustomerCodeSchema != null) {
      data['M_Customer_Code_Schema'] =
          mCustomerCodeSchema!.map((v) => v.toJson()).toList();
    }
    if (tUserAssignmentSchema != null) {
      data['T_User_Assignment_Schema'] =
          tUserAssignmentSchema!.map((v) => v.toJson()).toList();
    }
    if (mActivitySchema != null) {
      data['M_Activity_Schema'] =
          mActivitySchema!.map((v) => v.toJson()).toList();
    }
    if (mCostControlSchema != null) {
      data['M_Cost_Control_Schema'] =
          mCostControlSchema!.map((v) => v.toJson()).toList();
    }
    if (mMaterialSchema != null) {
      data['M_Material_Schema'] =
          mMaterialSchema!.map((v) => v.toJson()).toList();
    }
    if (mCOPHCardSchema != null) {
      data['MC_OPH_Card_Schema'] =
          mCOPHCardSchema!.map((v) => v.toJson()).toList();
    }
    if (mCSPBCardSchema != null) {
      data['MC_SPB_Card_Schema'] =
          mCSPBCardSchema!.map((v) => v.toJson()).toList();
    }
    if (mDestinationSchema != null) {
      data['M_Destination_Schema'] =
          mDestinationSchema!.map((v) => v.toJson()).toList();
    }
    if (mVRASchema != null) {
      data['M_VRA_Schema'] = mVRASchema!.map((v) => v.toJson()).toList();
    }
    if (mConfigSchema != null) {
      data['M_Config_Schema'] = mConfigSchema!.map((v) => v.toJson()).toList();
    }
    if (rolesSchema != null) {
      data['Roles_Schema'] = rolesSchema!.map((v) => v.toJson()).toList();
    }
    if (mAttendanceSchema != null) {
      data['M_Attendance_Schema'] =
          mAttendanceSchema!.map((v) => v.toJson()).toList();
    }
    if (tAttendanceSchema != null) {
      data['T_Attendance_Schema'] =
          tAttendanceSchema!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
