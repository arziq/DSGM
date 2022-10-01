class PostRequestModel {
  String? title;
  String? slug;

  String? description;
  String? categoryId;

  PostRequestModel({
    this.title,
    this.categoryId,
    this.description,
    this.slug,
  });

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['title'] = title;
    data['slug'] = slug;
    data['category_id'] = categoryId;
    data['description'] = description;

    return data;
  }
}
