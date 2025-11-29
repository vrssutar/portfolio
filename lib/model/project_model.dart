class ProjectModel {
  String projectName;
  String projectTagline;
  String projectDescription;
  String projectLink;
  String projectImage;
  List<String> projectTechStack;

  ProjectModel({
    required this.projectName,
    required this.projectTagline,
    required this.projectDescription,
    required this.projectLink,
    required this.projectImage,
    required this.projectTechStack,
  });
}
