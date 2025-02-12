class ApiConstants {
  static var basUrl = "https://student.valuxapps.com/api";
  static var login = "$basUrl/login";
  static var register = "$basUrl/register";
  static var home = "$basUrl/home";
  static var profile = "$basUrl/profile";
}

class DataIconCategories {
  // 🔹 Define Category Data (Image Paths + Labels)
  final List<Map<String, String>> categories = const [
    {
      'image': 'assets/Product icon/24px/man pants.png',
      'label': 'Pants',
    },
    {
      'image': 'assets/Product icon/24px/woman bag.png',
      'label': 'Bag',
    },
    {
      'image': 'assets/Product icon/24px/woman shoes.png',
      'label': 'Shoes',
    },
    {
      'image': 'assets/Product icon/24px/shirt.png',
      'label': 'Shirt',
    },
  ];
}
