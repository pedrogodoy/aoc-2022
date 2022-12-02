import 'dart:io';

void main() async {
  var path = 'input.txt';

  try {
    var file = File(path);

    var contents = await file.readAsLines();
    List<int> calories = [];
    var calory = 0;

    for (var i = 0; i < contents.length; i++) {
      if (contents[i].isNotEmpty) {
        calory += int.parse(contents[i]);
      }

      if (contents[i].isEmpty || i == contents.length - 1) {
        calories.add(calory);
        calory = 0;
      }
    }

    print(calories.reduce((curr, next) => curr > next ? curr : next));

    List<int> topThreeElfs = calories;

    topThreeElfs.sort();

    print(
        'Final result: ${topThreeElfs.reversed.toList().sublist(0, 3).reduce((curr, next) => curr + next)}');
  } catch (e) {
    stderr.writeln('failed to read file: \n${e}');
  }
}
