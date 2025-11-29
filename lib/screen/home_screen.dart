import 'package:flutter/material.dart';
import 'package:portfolio/util/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _screenWidth = 0;
  bool _isMobile = false;
  @override
  Widget build(BuildContext context) {
    _isMobile = MediaQuery.of(context).size.width < 600;
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _isMobile ? AppBar() : null,
      body: CustomScrollView(
        slivers: [
          _isMobile
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
                  title: _headerWidget(),
                ),
          SliverToBoxAdapter(child: _heroSectionWidget()),
          SliverToBoxAdapter(child: _experienceSectionWidget()),
          SliverToBoxAdapter(child: _projectSectionWidget()),
          SliverToBoxAdapter(child: _technicalSkillsSection(context)),
          SliverToBoxAdapter(child: _educationSectionWidget()),
          SliverToBoxAdapter(child: _socialLinksSection()),
        ],
      ),
      drawer: _isMobile ? Drawer(child: _headerWidget()) : null,
    );
  }

  Widget _headerWidget() {
    if (_isMobile) {
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

  Widget _heroSectionWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _isMobile ? 24 : 48),
      child: Column(
        children: [
          Text(
            "Vinayak Ramesh Sutar",
            textAlign: TextAlign.center,
            style: _isMobile
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 10),
          Text(
            "Flutter Developer",
            textAlign: TextAlign.center,
            style: _isMobile
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Theme.of(context).primaryColor,
              ),
              width: _screenWidth * 0.3,
              height: 5,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget? _educationSectionWidget() {
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
            children: List<Widget>.generate(educationList.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        educationList[index].instituteName!,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(educationList[index].universityName!),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(educationList[index].duration!),
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
                          educationList[index].grade!,
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

  Widget? _experienceSectionWidget() {
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
            children: List<Widget>.generate(experianceList.length, (index) {
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
                              experianceList[index].companyName!,
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
                              experianceList[index].duration!,
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
                          experianceList[index].role!,
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(experianceList[index].description!),
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

  Widget _projectSectionWidget() {
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
            children: List.generate(projectList.length, (i) {
              var p = projectList[i];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _isMobile
                        ? Column(
                            children: [
                              _projectImage(p.projectImage, 64),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    p.projectName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              _projectImage(p.projectImage, 32),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.projectName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    p.projectTagline,
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
                    Text(p.projectDescription),

                    Wrap(
                      spacing: 8,
                      children: p.projectTechStack
                          .map((tech) => Chip(label: Text(tech)))
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: OutlinedButton(
                        onPressed: () => openUrlNewTab(p.projectLink),
                        child: Text("Install ${p.projectName}"),
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

  Widget _socialLinksSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
                      Icons.link_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                "Social Links",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          children: List<Widget>.generate(socialList.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                onPressed: () => openUrlNewTab(socialList[index].link),
                label: Text(socialList[index].title),
                icon: Image.asset(
                  socialList[index].imagePath,
                  width: 32,
                  height: 32,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _technicalSkillsSection(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.code_rounded, color: primary),
              ),
              SizedBox(width: 12),
              Text(
                "Technical Skills",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// DYNAMIC LIST HERE
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(skillCategories.length, (index) {
              final category = skillCategories[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: category.skills
                          .map((skill) => Chip(label: Text(skill)))
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
}
