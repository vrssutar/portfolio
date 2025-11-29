import 'package:portfolio/model/education_model.dart';
import 'package:portfolio/model/experiance_model.dart';
import 'package:portfolio/model/header_item_model.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/model/social_item.dart';

final List<ExperianceModel> experianceList = [
  ExperianceModel(
    companyName: "iSoftwareFactory Services LLP",
    role: "Flutter Developer",
    duration: "6 Months",
    description: """
- Developed cross-platform mobile applications using Flutter and Dart. 
- Implemented responsive UI/UX designs and integrated REST APIs. 
- Conducted debugging and optimised app performance for smoother functionality. 
""",
  ),
];

final List<ProjectModel> projectList = [
  ProjectModel(
    projectName: "Your Topic",
    projectTagline: "Write. Read. Connect.",
    projectDescription: """
Your Topic is a space where writers and readers come together. Whether you’re a storyteller, poet, essayist, or reader who enjoys discovering new voices, this platform helps you share your writing, explore creative perspectives, and connect with people who value words. 
""",
    projectLink:
        "https://play.google.com/store/apps/details?id=com.yourtopic.app",
    projectImage: "./asset/image/your_topic_logo.png",
    projectTechStack: ["Flutter", "Dart", "Supabase"],
  ),

  ProjectModel(
    projectName: "Do It",
    projectTagline: "Your Personal Task Manager",
    projectDescription: """
Stay organised, manage your time, and get more done every day with Do It: Task Manager, your all-in-one to-do list, reminder, and productivity app. Whether it’s daily tasks, work projects, personal goals, or team planning, Do It helps you plan, prioritise, and complete your tasks effortlessly. 
""",
    projectLink: "https://play.google.com/store/apps/details?id=com.vrs.do_it",
    projectImage: "./asset/image/do_it_logo.png",
    projectTechStack: ["Flutter", "Dart", "Firebase"],
  ),

  ProjectModel(
    projectName: "Doubtly",
    projectTagline: "Make Every Question Count",
    projectDescription: """
Doubtly serves as a dedicated platform where students can ask questions, engage in discussions, and receive answers from a vibrant community of learners and experts. With its user-friendly interface and intuitive design, the app ensures a seamless and enriching experience for all users.  
""",
    projectLink:
        "https://play.google.com/store/apps/details?id=com.vrs.doubtly",
    projectImage: "./asset/image/doubtly_logo.png",
    projectTechStack: ["Flutter", "Dart", "Firebase"],
  ),

  ProjectModel(
    projectName: "Mark Present",
    projectTagline: "Attendance At Fingertip",
    projectDescription: """
Take the hassle out of tracking student attendance with our smart and intuitive attendance management app. Whether you're a school teacher, college professor, or private tutor, this app is designed to make attendance simple, fast, and error-free.
""",
    projectLink:
        "https://play.google.com/store/apps/details?id=com.vrs.doubtly",
    projectImage: "./asset/image/mark_present_logo.png",
    projectTechStack: ["Flutter", "Dart", "Firebase"],
  ),
];

final List<EducationModel> educationList = [
  EducationModel(
    instituteName: "MET Institute of Computer Science",
    courseName: "Master of Computer Application",
    universityName: "University of Mumbai",
    duration: "2025",
    grade: "8.44 CGPA",
  ),
  EducationModel(
    instituteName: "Shri Bhausaheb Vartak Arts, Commerce & Science College",
    courseName: "Bachelor of Science in Information Technology",
    universityName: "University of Mumbai",
    duration: "2022",
    grade: "9.12 CGPI",
  ),
  EducationModel(
    instituteName: "Ramnivas Ruia Junior College",
    courseName: "Higher Secondary Certificate",
    universityName: "Maharashtra State Board",
    duration: "2019",
    grade: "49.54% ",
  ),
  EducationModel(
    instituteName: "Indian Education School",
    courseName: "Secondary School Certificate",
    universityName: "Maharashtra State Board",
    duration: "2015",
    grade: "76.80%",
  ),
];

List<HeaderItemModel> headerItemList = [
  HeaderItemModel(
    title: "LinkedIn",
    imagePath: "./asset/image/linkedin.png",
    link: "https://www.linkedin.com/in/vrs30/",
  ),
  HeaderItemModel(
    title: "Google Play",
    imagePath: "./asset/image/google_play_store.png",
    link: "https://play.google.com/store/apps/developer?id=Vinayak+Sutar",
  ),
  HeaderItemModel(
    title: "GitHub",
    imagePath: "./asset/image/github.png",
    link: "https://github.com/vrs600",
  ),
];

List<SocialItem> socialList = [
  SocialItem(
    link: "https://www.instagram.com/vinsutar/",
    title: "Instagram",
    imagePath: "./asset/image/instagram_logo.png",
  ),
  SocialItem(
    link: "https://x.com/vrsutar30",
    title: "X",
    imagePath: "./asset/image/x_logo.png",
  ),
];
