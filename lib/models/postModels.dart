class PostModels {
  String id;
  int createdAt;
  String image;
  String data;
  String email;
  String postData;

  PostModels(
      {this.id,
      this.createdAt,
      this.image,
      this.data,
      this.email,
      this.postData});

  PostModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    image = json['image'];
    data = json['data'];
    email = json['email'];
    postData = json['post_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['image'] = this.image;
    data['data'] = this.data;
    data['email'] = this.email;
    data['post_data'] = this.postData;
    return data;
  }
}
