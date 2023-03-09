import 'package:flutter/material.dart';
import 'package:group_grid_view/group_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MyHomePage(title: 'Group Grid View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TestModel> dataSource = [
    TestModel(
        sectionName: "Animals",
        listItems: ["Dog", "Cat", "Bear", "Tiger", "Lion"]),
    TestModel(
        sectionName: "Vehicle",
        footerName: "End of vehicle section",
        listItems: ["Car", "Motor", "Air plane", "Boat"]),
    TestModel(sectionName: "Countries", listItems: [
      "Vietnam",
      "China",
      "Laos",
      "Thai",
      "Japan",
      "Singapore",
      "England",
      "USA",
      "Russian"
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GroupGridView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16),
          sectionCount: dataSource.length,
          headerForSection: (section) => Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(dataSource[section].sectionName,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold))),
          footerForSection: (section) {
            final footer = dataSource[section].footerName;
            return footer != null
                ? Container(
                    padding: const EdgeInsets.only(top: 12, bottom: 32),
                    child: Text(footer, style: const TextStyle(fontSize: 16)))
                : const SizedBox(height: 32);
          },
          itemInSectionBuilder: (_, indexPath) {
            final data =
                dataSource[indexPath.section].listItems[indexPath.index];
            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue)),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Text(data, style: const TextStyle(fontWeight: FontWeight.w500)));
          },
          itemInSectionCount: (section) => dataSource[section]
              .listItems
              .length)
    );
  }
}

class TestModel {
  TestModel(
      {required this.sectionName, required this.listItems, this.footerName});

  final String sectionName;
  final String? footerName;
  final List<String> listItems;
}
