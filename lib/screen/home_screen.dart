import 'package:flutter/material.dart';
import 'package:portfolio/model/education_model.dart';
import 'package:portfolio/model/experiance_model.dart';
import 'package:portfolio/model/header_item_model.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ExperianceModel> _experianceList = [
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

  final List<ProjectModel> _projectList = [
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
      projectLink:
          "https://play.google.com/store/apps/details?id=com.vrs.do_it",
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

  final List<EducationModel> _educationList = [
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

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: isMobile ? AppBar() : null,
      body: CustomScrollView(
        slivers: [
          isMobile
              ? SliverAppBar(
                  pinned: true,
                  elevation: 4,
                  automaticallyImplyLeading: false,
                  title: Text("Portfolio"),
                )
              : SliverAppBar(
                  pinned: true,
                  elevation: 4,
                  automaticallyImplyLeading: false,
                  title: _headerWidget(isMobile),
                ),
          SliverToBoxAdapter(child: _heroSectionWidget(isMobile)),
          SliverToBoxAdapter(child: _experienceSectionWidget(isMobile)),
          SliverToBoxAdapter(child: _projectSectionWidget(isMobile)),
          SliverToBoxAdapter(child: _educationSectionWidget(isMobile)),
        ],
      ),
      drawer: isMobile ? Drawer(child: _headerWidget(isMobile)) : null,
    );
  }

  Widget _headerWidget(bool isMobile) {
    if (isMobile) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Portfolio",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(headerItemList.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(
                  icon: Image.asset(
                    headerItemList[index].imagePath,
                    height: 28,
                    width: 28,
                  ),
                  label: Text(headerItemList[index].title),
                  onPressed: () => openUrlNewTab(headerItemList[index].link),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: Icon(Icons.download_rounded),
              onPressed: () => openUrlNewTab(
                "https://drive.google.com/file/d/1uKF30dnZnjKpLC7C33nVqtSgM4ekCnkO/view?usp=sharing",
              ),
              label: Text("Resume"),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Portfolio",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            children: List<Widget>.generate(headerItemList.length, (index) {
              return TextButton.icon(
                icon: Image.asset(
                  headerItemList[index].imagePath,
                  height: 28,
                  width: 28,
                ),
                label: Text(headerItemList[index].title),
                onPressed: () => openUrlNewTab(headerItemList[index].link),
              );
            }).toList(),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.download_rounded),
            onPressed: () => openUrlNewTab(
              "https://drive.google.com/file/d/1uKF30dnZnjKpLC7C33nVqtSgM4ekCnkO/view?usp=sharing",
            ),
            label: Text("Resume"),
          ),
        ],
      );
    }
  }

  Widget _heroSectionWidget(bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 24 : 48),
      child: Column(
        children: [
          Text(
            "Vinayak Ramesh Sutar",
            textAlign: TextAlign.center,
            style: isMobile
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 10),
          Text(
            "Flutter Developer",
            textAlign: TextAlign.center,
            style: isMobile
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }

  Widget? _educationSectionWidget(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).primaryColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.school_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                "Education",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List<Widget>.generate(_educationList.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _educationList[index].instituteName!,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(_educationList[index].universityName!),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(_educationList[index].duration!),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Theme.of(
                          context,
                        ).primaryColor.withValues(alpha: 0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          _educationList[index].grade!,
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget? _experienceSectionWidget(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).primaryColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.work_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                "Experience",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: List<Widget>.generate(_experianceList.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              softWrap: true,
                              _experianceList[index].companyName!,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "|",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Text(
                              _experianceList[index].duration!,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          _experianceList[index].role!,
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(_experianceList[index].description!),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _projectSectionWidget(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _sectionIcon(Icons.rocket_launch_rounded),
              Text(
                "Projects",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          // Project List
          Column(
            children: List.generate(_projectList.length, (i) {
              var p = _projectList[i];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isMobile
                        ? Column(
                            children: [
                              _projectImage(p.projectImage!, 64),
                              SizedBox(height: 8),
                              Text(
                                p.projectName!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              _projectImage(p.projectImage!, 32),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.projectName!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    p.projectTagline!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),

                    SizedBox(height: 8),
                    Text(p.projectDescription!),

                    Wrap(
                      spacing: 8,
                      children: p.projectTechStack!
                          .map((tech) => Chip(label: Text(tech)))
                          .toList(),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _projectImage(String path, double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox.fromSize(
        size: Size.fromRadius(radius),
        child: Image.asset(path, fit: BoxFit.cover),
      ),
    );
  }

  Widget _sectionIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.all(8),
        child: Icon(icon, color: Theme.of(context).primaryColor),
      ),
    );
  }

  Future<void> openUrlNewTab(String url) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: "_blank", // 👈 opens in new tab on web
    );
  }
}
