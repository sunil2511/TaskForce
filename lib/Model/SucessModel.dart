class SucessModel {
  String status;
  String message;
  List<Albums> albums;

  SucessModel({this.status, this.message, this.albums});

  SucessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['albums'] != null) {
      albums = new List<Albums>();
      json['albums'].forEach((v) {
        albums.add(new Albums.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.albums != null) {
      data['albums'] = this.albums.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Albums {
  String title;
  String image;
  List<Songs> songs;
  String description;

  Albums({this.title, this.image, this.songs, this.description});

  Albums.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    if (json['songs'] != null) {
      songs = new List<Songs>();
      json['songs'].forEach((v) {
        songs.add(new Songs.fromJson(v));
      });
    }
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    return data;
  }
}

class Songs {
  String title;
  String length;

  Songs({this.title, this.length});

  Songs.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['length'] = this.length;
    return data;
  }
}