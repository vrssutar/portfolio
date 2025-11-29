import 'package:flutter/material.dart';
import 'package:portfolio/util/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          SliverToBoxAdapter(child: _socialLinksSection()),
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
            children: List.generate(projectList.length, (i) {
              var p = projectList[i];

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
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
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
}
