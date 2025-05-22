class PostModel {
  bool? ret;
  Data? data;

  PostModel({this.ret, this.data});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    ret: json['return'] as bool?,
    data: json['data'] != null ? Data.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {'return': ret, 'data': data?.toJson()};
}

class Data {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json['current_page'] as int?,
    data:
        (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e))
            .toList(),
    firstPageUrl: json['first_page_url'] as String?,
    from: json['from'] as int?,
    lastPage: json['last_page'] as int?,
    lastPageUrl: json['last_page_url'] as String?,
    links:
        (json['links'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e))
            .toList(),
    nextPageUrl: json['next_page_url'] as String?,
    path: json['path'] as String?,
    perPage: json['per_page'] as int?,
    prevPageUrl: json['prev_page_url'] as String?,
    to: json['to'] as int?,
    total: json['total'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'data': data?.map((e) => e.toJson()).toList(),
    'first_page_url': firstPageUrl,
    'from': from,
    'last_page': lastPage,
    'last_page_url': lastPageUrl,
    'links': links?.map((e) => e.toJson()).toList(),
    'next_page_url': nextPageUrl,
    'path': path,
    'per_page': perPage,
    'prev_page_url': prevPageUrl,
    'to': to,
    'total': total,
  };
}

class Datum {
  int? id;
  String? title;
  String? shortDescription;
  String? longDescription;
  String? status;
  String? type;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  int? likeCount;
  int? commentCount;
  int? myLikeCount;
  List<AllImage>? allImage;
  Video? video;

  Datum({
    this.id,
    this.title,
    this.shortDescription,
    this.longDescription,
    this.status,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.likeCount,
    this.commentCount,
    this.myLikeCount,
    this.allImage,
    this.video,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    title: json['title'] as String?,
    shortDescription: json['short_description'] as String?,
    longDescription: json['long_description'] as String?,
    status: json['status'] as String?,
    type: json['type'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'],
    deletedAt: json['deleted_at'],
    likeCount: json['like_count'] as int?,
    commentCount: json['comment_count'] as int?,
    myLikeCount: json['my_like_count'] as int?,
    allImage:
        (json['all_image'] as List<dynamic>?)
            ?.map((e) => AllImage.fromJson(e))
            .toList(),
    video: json['video'] != null ? Video.fromJson(json['video']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'short_description': shortDescription,
    'long_description': longDescription,
    'status': status,
    'type': type,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'deleted_at': deletedAt,
    'like_count': likeCount,
    'comment_count': commentCount,
    'my_like_count': myLikeCount,
    'all_image': allImage?.map((e) => e.toJson()).toList(),
    'video': video?.toJson(),
  };
}

class AllImage {
  int? id;
  int? postId;
  String? fileType;
  String? file;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  AllImage({
    this.id,
    this.postId,
    this.fileType,
    this.file,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory AllImage.fromJson(Map<String, dynamic> json) => AllImage(
    id: json['id'] as int?,
    postId: json['post_id'] as int?,
    fileType: json['file_type'] as String?,
    file: json['file'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'],
    deletedAt: json['deleted_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'post_id': postId,
    'file_type': fileType,
    'file': file,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'deleted_at': deletedAt,
  };
}

class Video {
  int? id;
  int? postId;
  String? fileType;
  String? file;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Video({
    this.id,
    this.postId,
    this.fileType,
    this.file,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json['id'] as int?,
    postId: json['post_id'] as int?,
    fileType: json['file_type'] as String?,
    file: json['file'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'],
    deletedAt: json['deleted_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'post_id': postId,
    'file_type': fileType,
    'file': file,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'deleted_at': deletedAt,
  };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json['url']?.toString(),
    label: json['label'] as String?,
    active: json['active'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'label': label,
    'active': active,
  };
}
