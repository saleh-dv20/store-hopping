class ApiManager {
  static const String baseUrl = 'https://fakestoreapi.com/products';
  static const String closeUrl = '$baseUrl/category/men\'s clothing';
  static const String allGategories =
      'https://fakestoreapi.com/products/categories';
  static String singleGategories(String gategory) =>
      '$baseUrl/category/$gategory';
}
