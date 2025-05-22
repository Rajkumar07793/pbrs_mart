// Required imports for json_annotation
import 'package:json_annotation/json_annotation.dart';

// This line is necessary for the generated code to be included.
// Run `flutter pub run build_runner build` or `dart run build_runner build`
// to generate this file.

@JsonSerializable()
class ProductCategoryModel {
  // @SerializedName("return")
  // @Expose
  // private Boolean _return;
  @JsonKey(name: 'return')
  bool? isReturn;

  // @SerializedName("data")
  // @Expose
  // private List<Datum> data = null;
  List<Datum>? data;

  ProductCategoryModel({this.isReturn, this.data});

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);
}

@JsonSerializable()
class Datum {
  // @SerializedName("id")
  // @Expose
  // private Integer id;
  int? id;

  // @SerializedName("slug")
  // @Expose
  // private String slug;
  String? slug;

  // @SerializedName("sub_category_id")
  // @Expose
  // private Integer subCategoryId;
  @JsonKey(name: 'sub_category_id')
  int? subCategoryId;

  // @SerializedName("name")
  // @Expose
  // private String name;
  String? name;

  // @SerializedName("name_hindi")
  // @Expose
  // private Object nameHindi;
  @JsonKey(name: 'name_hindi')
  dynamic? nameHindi;

  // @SerializedName("description")
  // @Expose
  // private String description;
  String? description;

  // @SerializedName("image")
  // @Expose
  // private String image;
  String? image;

  // @SerializedName("status")
  // @Expose
  // private String status;
  String? status;

  // @SerializedName("free_des")
  // @Expose
  // private String free_des;
  @JsonKey(name: 'free_des')
  String? freeDes;

  // @SerializedName("created_at")
  // @Expose
  // private Integer createdAt;
  @JsonKey(name: 'created_at')
  int? createdAt;

  // @SerializedName("updated_at")
  // @Expose
  // private Object updatedAt;
  @JsonKey(name: 'updated_at')
  dynamic? updatedAt;

  // @SerializedName("deleted_at")
  // @Expose
  // private Object deletedAt;
  @JsonKey(name: 'deleted_at')
  dynamic? deletedAt;

  // @SerializedName("product")
  // @Expose
  // private List<Product> product = null;
  List<Product>? product;

  Datum({
    this.id,
    this.slug,
    this.subCategoryId,
    this.name,
    this.nameHindi,
    this.description,
    this.image,
    this.status,
    this.freeDes,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.product,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class MainCategory {
  // @SerializedName("id")
  // @Expose
  // private Integer id;
  int? id;

  // @SerializedName("slug")
  // @Expose
  // private String slug;
  String? slug;

  // @SerializedName("name")
  // @Expose
  // private String name;
  String? name;

  // @SerializedName("name_hindi")
  // @Expose
  // private Object nameHindi;
  @JsonKey(name: 'name_hindi')
  dynamic? nameHindi;

  // @SerializedName("image")
  // @Expose
  // private String image;
  String? image;

  // @SerializedName("status")
  // @Expose
  // private String status;
  String? status;

  // @SerializedName("city_id")
  // @Expose
  // private Object cityId;
  @JsonKey(name: 'city_id')
  dynamic? cityId;

  // @SerializedName("created_at")
  // @Expose
  // private String createdAt;
  @JsonKey(name: 'created_at')
  String? createdAt;

  // @SerializedName("updated_at")
  // @Expose
  // private Object updatedAt;
  @JsonKey(name: 'updated_at')
  dynamic? updatedAt;

  // @SerializedName("delete_at")
  // @Expose
  // private Object deleteAt;
  @JsonKey(name: 'delete_at')
  dynamic? deleteAt;

  MainCategory({
    this.id,
    this.slug,
    this.name,
    this.nameHindi,
    this.image,
    this.status,
    this.cityId,
    this.createdAt,
    this.updatedAt,
    this.deleteAt,
  });

  factory MainCategory.fromJson(Map<String, dynamic> json) =>
      _$MainCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MainCategoryToJson(this);
}

@JsonSerializable()
class Product {
  // @SerializedName("id")
  // @Expose
  // private Integer id;
  int? id;

  // @SerializedName("slug")
  // @Expose
  // private String slug;
  String? slug;

  // @SerializedName("main_category_id")
  // @Expose
  // private Integer mainCategoryId;
  @JsonKey(name: 'main_category_id')
  int? mainCategoryId;

  // @SerializedName("sub_category_id")
  // @Expose
  // private Integer subCategoryId;
  @JsonKey(name: 'sub_category_id')
  int? subCategoryId;

  // @SerializedName("product_category_id")
  // @Expose
  // private Integer productCategoryId;
  @JsonKey(name: 'product_category_id')
  int? productCategoryId;

  // @SerializedName("name")
  // @Expose
  // private String name;
  String? name;

  // @SerializedName("free_des")
  // @Expose
  // private String free_des;
  @JsonKey(name: 'free_des')
  String? freeDes;

  // @SerializedName("description")
  // @Expose
  // private String description;
  String? description;

  // @SerializedName("status")
  // @Expose
  // private String status;
  String? status;

  // @SerializedName("brand_id")
  // @Expose
  // private String brandId;
  @JsonKey(name: 'brand_id')
  String? brandId;

  // @SerializedName("created_at")
  // @Expose
  // private String createdAt;
  @JsonKey(name: 'created_at')
  String? createdAt;

  // @SerializedName("updated_at")
  // @Expose
  // private Object updatedAt;
  @JsonKey(name: 'updated_at')
  dynamic? updatedAt;

  // @SerializedName("deleted_at")
  // @Expose
  // private Object deletedAt;
  @JsonKey(name: 'deleted_at')
  dynamic? deletedAt;

  // @SerializedName("variant")
  // @Expose
  // private List<Variant> variant = null;
  List<Variant>? variant;

  // @SerializedName("main_category")
  // @Expose
  // private MainCategory mainCategory;
  @JsonKey(name: 'main_category')
  MainCategory? mainCategory;

  // @SerializedName("sub_category")
  // @Expose
  // private SubCategory subCategory;
  @JsonKey(name: 'sub_category')
  SubCategory? subCategory;

  // @SerializedName("single_image")
  // @Expose
  // private SingleImage singleImage;
  @JsonKey(name: 'single_image')
  SingleImage? singleImage;

  // @SerializedName("unit_type")
  // @Expose
  // private Object unitType;
  @JsonKey(name: 'unit_type')
  dynamic? unitType;

  // @SerializedName("product_category")
  // @Expose
  // private ProductCategory productCategory;
  @JsonKey(name: 'product_category')
  ProductCategory? productCategory;

  // @SerializedName("product_cart")
  // @Expose
  // private Object productCart;
  @JsonKey(name: 'product_cart')
  dynamic? productCart;

  // @SerializedName("vendor")
  // @Expose
  // private Vendor vendor;
  Vendor? vendor;

  Product({
    this.id,
    this.slug,
    this.mainCategoryId,
    this.subCategoryId,
    this.productCategoryId,
    this.name,
    this.freeDes,
    this.description,
    this.status,
    this.brandId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.variant,
    this.mainCategory,
    this.subCategory,
    this.singleImage,
    this.unitType,
    this.productCategory,
    this.productCart,
    this.vendor,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductCategory {
  // @SerializedName("id")
  // @Expose
  // private Integer id;
  int? id;

  // @SerializedName("slug")
  // @Expose
  // private String slug;
  String? slug;

  // @SerializedName("sub_category_id")
  // @Expose
  // private Integer subCategoryId;
  @JsonKey(name: 'sub_category_id')
  int? subCategoryId;

  // @SerializedName("name")
  // @Expose
  // private String name;
  String? name;

  // @SerializedName("name_hindi")
  // @Expose
  // private Object nameHindi;
  @JsonKey(name: 'name_hindi')
  dynamic? nameHindi;

  // @SerializedName("description")
  // @Expose
  // private String description;
  String? description;

  // @SerializedName("image")
  // @Expose
  // private String image;
  String? image;

  // @SerializedName("status")
  // @Expose
  // private String status;
  String? status;

  // @SerializedName("created_at")
  // @Expose
  // private Integer createdAt;
  @JsonKey(name: 'created_at')
  int? createdAt;

  // @SerializedName("updated_at")
  // @Expose
  // private Object updatedAt;
  @JsonKey(name: 'updated_at')
  dynamic? updatedAt;

  // @SerializedName("deleted_at")
  // @Expose
  // private Object deletedAt;
  @JsonKey(name: 'deleted_at')
  dynamic? deletedAt;

  ProductCategory({
    this.id,
    this.slug,
    this.subCategoryId,
    this.name,
    this.nameHindi,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}

@JsonSerializable()
class SingleImage {
  // @SerializedName("id")
  // @Expose
  // private Integer id;
  int? id;

  // @SerializedName("product_id")
  // @Expose
  // private Integer productId;
  @JsonKey(name: 'product_id')
  int? productId;

  // @SerializedName("image")
  // @Expose
  // private String image;
  String? image;

  // @SerializedName("created_at")
  // @Expose
  // private String createdAt;
  @JsonKey(name: 'created_at')
  String? createdAt;

  SingleImage({this.id, this.productId, this.image, this.createdAt});

  factory SingleImage.fromJson(Map<String, dynamic> json) =>
      _$SingleImageFromJson(json);

  Map<String, dynamic> toJson() => _$SingleImageToJson(this);
}

@JsonSerializable()
class SubCategory {
  // @SerializedName("id")
  // @Expose
  // private Integer id;
  int? id;

  // @SerializedName("slug")
  // @Expose
  // private String slug;
  String? slug;

  // @SerializedName("main_category_id")
  // @Expose
  // private Integer mainCategoryId;
  @JsonKey(name: 'main_category_id')
  int? mainCategoryId;

  // @SerializedName("name")
  // @Expose
  // private String name;
  String? name;

  // @SerializedName("name_hindi")
  // @Expose
  // private Object nameHindi;
  @JsonKey(name: 'name_hindi')
  dynamic? nameHindi;

  // @SerializedName("description")
  // @Expose
  // private String description;
  String? description;

  // @SerializedName("image")
  // @Expose
  // private String image;
  String? image;

  // @SerializedName("status")
  // @Expose
  // private String status;
  String? status;

  // @SerializedName("created_at")
  // @Expose
  // private String createdAt;
  @JsonKey(name: 'created_at')
  String? createdAt;

  // @SerializedName("updated_at")
  // @Expose
  // private Object updatedAt;
  @JsonKey(name: 'updated_at')
  dynamic? updatedAt;

  // @SerializedName("deleted_at")
  // @Expose
  // private Object deletedAt;
  @JsonKey(name: 'deleted_at')
  dynamic? deletedAt;

  SubCategory({
    this.id,
    this.slug,
    this.mainCategoryId,
    this.name,
    this.nameHindi,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}

@JsonSerializable()
class UnitType {
  // @SerializedName("id")
  // @Expose
  // private Integer id;
  int? id;

  // @SerializedName("quantity")
  // @Expose
  // private String quantity;
  String? quantity;

  UnitType({this.id, this.quantity});

  factory UnitType.fromJson(Map<String, dynamic> json) =>
      _$UnitTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UnitTypeToJson(this);
}

@JsonSerializable()
class Variant {
  // @SerializedName("id")
  // @Expose
  // private Integer id;
  int? id;

  // @SerializedName("product_id")
  // @Expose
  // private Integer productId;
  @JsonKey(name: 'product_id')
  int? productId;

  // @SerializedName("unit_id")
  // @Expose
  // private Integer unitId;
  @JsonKey(name: 'unit_id')
  int? unitId;

  // @SerializedName("quantity")
  // @Expose
  // private Integer quantity;
  int? quantity;

  // @SerializedName("in_stock")
  // @Expose
  // private Integer inStock;
  @JsonKey(name: 'in_stock')
  int? inStock;

  // @SerializedName("main_price")
  // @Expose
  // private Double mainPrice;
  @JsonKey(name: 'main_price')
  double? mainPrice;

  // @SerializedName("cgst")
  // @Expose
  // private Double cgst;
  double? cgst;

  // @SerializedName("sgst")
  // @Expose
  // private Double sgst;
  double? sgst;

  // @SerializedName("off")
  // @Expose
  // private Double off;
  double? off;

  // @SerializedName("status")
  // @Expose
  // private String status;
  String? status;

  // @SerializedName("off_price")
  // @Expose
  // private Double offPrice;
  @JsonKey(name: 'off_price')
  double? offPrice;

  // @SerializedName("real_price")
  // @Expose
  // private Double realPrice;
  @JsonKey(name: 'real_price')
  double? realPrice;

  // @SerializedName("real_cgst")
  // @Expose
  // private Double realCgst;
  @JsonKey(name: 'real_cgst')
  double? realCgst;

  // @SerializedName("real_sgst")
  // @Expose
  // private Double realSgst;
  @JsonKey(name: 'real_sgst')
  double? realSgst;

  // @SerializedName("created_at")
  // @Expose
  // private String createdAt;
  @JsonKey(name: 'created_at')
  String? createdAt;

  // @SerializedName("updated_at")
  // @Expose
  // private Object updatedAt;
  @JsonKey(name: 'updated_at')
  dynamic? updatedAt;

  // @SerializedName("deleted_at")
  // @Expose
  // private Object deletedAt;
  @JsonKey(name: 'deleted_at')
  dynamic? deletedAt;

  // @SerializedName("unit_type")
  // @Expose
  // private UnitType unitType;
  @JsonKey(name: 'unit_type')
  UnitType? unitType;

  Variant({
    this.id,
    this.productId,
    this.unitId,
    this.quantity,
    this.inStock,
    this.mainPrice,
    this.cgst,
    this.sgst,
    this.off,
    this.status,
    this.offPrice,
    this.realPrice,
    this.realCgst,
    this.realSgst,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.unitType,
  });

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}

// The 'Vendor' class was referenced in the Java 'Product' class but not defined
// in the provided Java source. A minimal definition is provided here to ensure
// the Dart code is complete and compiles. If the actual JSON for Vendor
// contains fields, they should be added here.
@JsonSerializable()
class Vendor {
  Vendor(); // Default constructor

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  Map<String, dynamic> toJson() => _$VendorToJson(this);
}
