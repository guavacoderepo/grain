import 'dart:math';

class FarmersData {
  String crop, contact, location, name, img;
  DateTime date, time;

  FarmersData(this.name, this.location, this.date, this.contact, this.time,
      this.crop, this.img);
}

// init data
List<FarmersData> farmersData = [
  FarmersData(
      "Maduka chika",
      "Lokogma, Abuja",
      DateTime.utc(2023, 04, 04),
      "09067435634",
      DateTime.utc(2022, 03, 03),
      "Red Maize",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX5xrQVwZEiFpbZzE86OBkTu4WAM91FsyfLA&usqp=CAU"),
  FarmersData(
      "adanne mama",
      "Ludge, Abuja",
      DateTime.utc(2023, 02, 01),
      "09067435634",
      DateTime.utc(2022, 03, 01),
      "white Maize",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGAR6UXKA5vkCHBfdJ8LuRsy-TKfV6PTO26Q&usqp=CAU")
];

Future<List<FarmersData>> getFarms(String name, String location, DateTime date,
    String contact, DateTime time, String crop) async {
  // generate random image
  String img = farmersImg[Random().nextInt(farmersImg.length)];

  farmersData.add(FarmersData(name, location, time, contact, time, crop, img));

  return farmersData;
}

List<String> farmersImg = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0H7wMwB5cvA2-aYOJxNz8Mwcc-261iAOK9Q&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP0Vrm4WekKaiP1Qf21TdOSc1p2hl9nt624g&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUCCjH3ARHq4E9TidyxvP2QhnqBj4xyeduQ73d7CW6E7cQklo_4Vn0LQdE05bkbdZyw_E&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUvqSnB2DVgg2JFQUdY0TQQ5rYLukB4XTZEQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCc-KjfPTMdmfFl7xyRgmEFUi5jWQ3zAd-lw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1XiJ6CA0VOgqDnK1DpLnGXbWwDLk3_XSL2A&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwY5L3OrIMWp8PoheS2rrIkda4xqn4CTNyeGiaUHKNs3xW5VljM6KojT1p0E5PL7WkFj4&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKzA3WqRhw6wojQGJZaNp9EPXLyLxITBLa8Q&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAA4DjqjbtVWTcsh7X0BqCcapFgIME-DFd8w&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIJn7-pUXVOWv2oohfk8fJtsos2RHo47gzYQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFIizR6zknB1WarIkcxs87kCj4VYUARA5kSg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0H7wMwB5cvA2-aYOJxNz8Mwcc-261iAOK9Q&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP0Vrm4WekKaiP1Qf21TdOSc1p2hl9nt624g&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUCCjH3ARHq4E9TidyxvP2QhnqBj4xyeduQ73d7CW6E7cQklo_4Vn0LQdE05bkbdZyw_E&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUvqSnB2DVgg2JFQUdY0TQQ5rYLukB4XTZEQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCc-KjfPTMdmfFl7xyRgmEFUi5jWQ3zAd-lw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1XiJ6CA0VOgqDnK1DpLnGXbWwDLk3_XSL2A&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwY5L3OrIMWp8PoheS2rrIkda4xqn4CTNyeGiaUHKNs3xW5VljM6KojT1p0E5PL7WkFj4&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKzA3WqRhw6wojQGJZaNp9EPXLyLxITBLa8Q&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAA4DjqjbtVWTcsh7X0BqCcapFgIME-DFd8w&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIJn7-pUXVOWv2oohfk8fJtsos2RHo47gzYQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFIizR6zknB1WarIkcxs87kCj4VYUARA5kSg&usqp=CAU"
];
