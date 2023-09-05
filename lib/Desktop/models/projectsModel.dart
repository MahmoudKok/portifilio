import 'package:flutter/material.dart';

class ProjectModel {
  String? name;
  String? projectType;
  String? explain;
  String? photo;
  IconData? icon;
  String? link;
  ProjectModel(
      {this.explain,
      this.name,
      this.photo,
      this.projectType,
      this.icon,
      this.link});
}
