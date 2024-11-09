List<Product> products = [
  Product(
    imageUrl: 'images/shoe.jpeg',
    name: 'T-Shirt',
    price: 29.99,
    rating: 4.8,
    review: 120,
    isNew: true,
    discountPercentage: 10,
    colors: ['red', 'blue', 'white'],
    onAddToCart: () {
      // Implement your add to cart functionality here
      print('Adding T-Shirt to cart');
    },
  ),
  // Add more product data objects with different properties
  // Product(
  //   imageUrl: 'images/jewelry.jpeg',
  //   name: 'T-Shirt',
  //   price: 29.99,
  //   rating: 4.8,
  //   reviews: 120,
  //   isNew: true,
  //   discountPercentage: 10,
  //   colors: ['red', 'blue', 'white'],
  //   onAddToCart: () {
  //     // Implement your add to cart functionality here
  //     print('Adding T-Shirt to cart');
  //   },
  // ),

  // Product(
  //   imageUrl: 'images/women.jpeg',
  //   name: 'T-Shirt',
  //   price: 29.99,
  //   rating: 4.8,
  //   reviews: 120,
  //   isNew: true,
  //   discountPercentage: 10,
  //   colors: ['red', 'blue', 'white'],
  //   onAddToCart: () {
  //     // Implement your add to cart functionality here
  //     print('Adding T-Shirt to cart');
  //   },
  // ),

  // Product(
  //   imageUrl: 'images/men.jpeg',
  //   name: 'T-Shirt',
  //   price: 29.99,
  //   rating: 4.8,
  //   reviews: 120,
  //   isNew: true,
  //   discountPercentage: 10,
  //   colors: ['red', 'blue', 'white'],
  //   onAddToCart: () {},
  // ),

  // Product(
  //   imageUrl: 'images/shoe.jpeg',
  //   name: 'T-Shirt',
  //   price: 29.99,
  //   rating: 4.8,
  //   reviews: 120,
  //   isNew: true,
  //   discountPercentage: 10,
  //   colors: ['red', 'blue', 'white'],
  //   onAddToCart: () {},
  // ),
];

class Product {
  final String imageUrl;
  final String name;
  final double price;
  final double rating;
  final int review;
  final bool isNew;
  final double? discountPercentage;
  final int stockCount;
  final List<String>? colors;
  final Function()? onAddToCart;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.rating = 0.0,
    this.review = 0,
    this.isNew = false,
    this.discountPercentage,
    this.stockCount = 0, // we will be setting default stockcount to zero
    this.colors,
    this.onAddToCart,
  });
}
