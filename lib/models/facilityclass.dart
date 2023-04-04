import 'dart:math';

class FacilityData {
  String contact, location, name, img, des, size;
  DateTime date;

  FacilityData(this.name, this.location, this.date, this.contact, this.size,
      this.des, this.img);
}

// init data
List<FacilityData> faciltyData = [
  FacilityData(
      "Olams Nigeria Limited",
      "Wukari, Taraba State",
      DateTime.utc(2023, 04, 04),
      "09067435634",
      "230sqkm",
      "Self storage is an industry that rents storage space, also known as 'storage units,' to tenants, usually on a short-term basis. Self-storage tenants include businesses and individuals. When discussing why a storage space is rented, industry experts often refer to ",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRILCD_AVx8jXDSz-283Sq5LSne6NUadN3pJA&usqp=CAU"),
  FacilityData(
      "Wacot Limited facilities",
      "Ota, Ugun State",
      DateTime.utc(2023, 02, 01),
      "09067435634",
      "500 tonnes",
      "A storage facility is an industry that rents out storage space, generally for a short period. These facilities can be rented by businesses and individuals to store various goods, including household items, business inventory, vehicles, gym equipment, etc.",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIO4cOWv1uMQdnF3LngLZHKTYin9UAS_KIaw&usqp=CAU"),
  FacilityData(
      "Johnwayne agric and farms limited ",
      "Plot 1768, Bamish-II Layout, Kuje Area Council FCT, Abuja",
      DateTime.utc(2023, 04, 04),
      "08056671817",
      "250,000 tonnes",
      "A storage facility where famers rent to store their grains within a short period of time at affordable price, located in Abuja, Nigeria",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDAcgHdnYIfgYN3TsVr31WAyhKzDzyjYi0Aw&usqp=CAU")
];

Stream<List<FacilityData>> streamfacilty() =>
    Stream.periodic(const Duration(seconds: 1))
        .asyncMap((event) => getfacilty());

Future<List<FacilityData>> getfacilty() async {
  return faciltyData;
}

Future<List<FacilityData>> addfacilty(String name, String location,
    DateTime date, String contact, String des, String size) async {
  // generate random image
  String img = facilities[Random().nextInt(facilities.length)];

  faciltyData.add(FacilityData(name, location, date, contact, size, des, img));

  return faciltyData;
}

List<String> facilities = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ0-fjJF3TCuW71zynbTN0wQ0NP1jb0B0EhA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuHGrMVzgYrakrYBBi__CN3Gyd4zK3VWg4Gg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuI817F5ZQ6l_y1sYvtaz8zokrmtCZ2g2vmw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhb84ba5Stbqv1kOuQdZLTh5YPKtiaSvxlbQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9KtPpEN3cRnjktTLvyXxibIZ97IGjcUCBA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd1QV8-eEcCnzvgVUO2CmqP86EM-uSdLvWwA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv_b1sATNL2oLnw_qVxPu5VmsXkJXbERzoag&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVNjL8RXTTysj3bf7MKb2Aj3rHPWCSQhgjug&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu2gpV9BxYbI5A4b9_xQXKGKAZle-LT23G-w&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzuwXCF2KTfYE_NYMZu1Z_M0llNS-iFQi9zzaBtI26lsRXsc_P6xe8_1bQHsxwA1R9mZE&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkVSiA3r6tP6LagRmKEJWCABmwi294paLVWA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWfHZuLZh6NO4bZJE-BlTyFQJS_GYLVClw1Q&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVdkdEuhiBsR_6cOLF3TzHmLs2dmlKVtQlKA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7y8HlLK9_H8zsEvxtZl5ggMa6BB0kB5gDHp87JBXV5lHsEV9cJgOaVAFYhVugQ072wO8&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE5QJXDctcsPPnwklR2lOSYcRr67cQiKfnAGaEbvZXxC2djG1xVDCuPBQnLWJxvlJBCpc&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdA5ALr1nSt7DQWhoh3GE80OQtYUNTrNjJ_w&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlC7u-MeydkuF4lrayvCvfWPMT0obCHC_oog&usqp=CAU",
];
