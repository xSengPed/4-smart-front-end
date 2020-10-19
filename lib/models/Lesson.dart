
import 'dart:convert';

List<Lesson> lessonFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<Lesson>.from(jsonData.map((x) => Lesson.fromJson(x)));
}

String lessonToJson(List<Lesson> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class Lesson {
    List<Content> content;
    String id;
    int lesson;
    int v;

    Lesson({
        this.content,
        this.id,
        this.lesson,
        this.v,
    });

    factory Lesson.fromJson(Map<String, dynamic> json) => new Lesson(
        content: new List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        id: json["_id"],
        lesson: json["lesson"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "content": new List<dynamic>.from(content.map((x) => x.toJson())),
        "_id": id,
        "lesson": lesson,
        "__v": v,
    };
}

class Content {
    String header;
    String detail;

    Content({
        this.header,
        this.detail,
    });

    factory Content.fromJson(Map<String, dynamic> json) => new Content(
        header: json["header"],
        detail: json["detail"],
    );

    Map<String, dynamic> toJson() => {
        "header": header,
        "detail": detail,
    };
}
