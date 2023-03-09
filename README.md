# Group Grid View
A GridView that allows you to group list items and support headers like iOS UICollectionView section.

## Features

* Grid Items can be grouped.
* Support headers and footers for each group.
* All fields from GridView.builder constructor available.

  ![Alt Text](https://images.viblo.asia/5233b34d-8fc3-47f1-91ff-e31929fbc2a9.gif)
## Installing

Add this to your package's `pubspec.yaml` file:

```dart
dependencies:
  group_grid_view: ^latest
```

## Import

```dart
import 'package:group_grid_view/group_grid_view.dart';
```

## Usage

Use like a widget everywhere you want, you can see example in `/example` folder.

```dart
GroupGridView(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16),
  sectionCount: dataSource.length,
  headerForSection: (section) => Container(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Text(dataSource[section].sectionName,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
  footerForSection: (section) {
    final footer = dataSource[section].footerName;
    return footer != null
          ? Container(
              padding: const EdgeInsets.only(top: 12, bottom: 32),
              child: Text(footer, style: const TextStyle(fontSize: 16)))
          : const SizedBox(height: 32);
  },
  itemInSectionBuilder: (_, indexPath) {
    final data = dataSource[indexPath.section].listItems[indexPath.index];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue)),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Text(data, style: const TextStyle(fontWeight: FontWeight.w500)));
  },
  itemInSectionCount: (section) => dataSource[section].listItems.length)
```


**Trần Đạt, Thank you!**