class Product {
  final String name;
  final String Category;
  final double price;
  final double? oldprice;
  final String imageUrl;
  final bool isFavorite;
  final String description;
  

  const Product({
    required this.Category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldprice,
    this.isFavorite = false,
  });

  getDiscount() {}
  
  }

  final List<Product> product = [
    const Product(
      Category: 'Clutch Handbags', 
      description: 'this is description on about product',
       imageUrl: 'assets/images/image4.jpg', 
       name: 'Bags', 
       price: 69.00,),



   const Product(
      Category: 'Satchel', 
      description: 'this is description on about product',
       imageUrl: 'assets/images/image2.jpeg', 
       name: 'Bags', 
       price: 69.00,),


 const Product(
      Category: 'Briefcase', 
      description: 'this is description on about product',
       imageUrl: 'assets/images/image1.jpeg', 
       name: 'Bags', 
       price: 69.00,),



      const Product(
      Category: 'Canteen Bag', 
      description: 'this is description on about product',
       imageUrl: 'assets/images/image6.jpeg', 
       name: 'Bags', 
       price: 69.00,),



  ];
  