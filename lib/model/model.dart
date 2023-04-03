class Model {
  List<Exercises>? exercises;

  Model({this.exercises});

  Model.fromJson(Map<String, dynamic> json) {
    if (json['exercises'] != null) {
      exercises = <Exercises>[];
      json['exercises'].forEach((v) {
        exercises!.add(Exercises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (exercises != null) {
      data['exercises'] = exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercises {
  String? id;
  String? title;
  String? thumbnail;
  String? gif;
  String? seconds;

  Exercises({this.id, this.title, this.thumbnail, this.gif, this.seconds});

  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    gif = json['gif'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['gif'] = this.gif;
    data['seconds'] = this.seconds;
    return data;
  }
}