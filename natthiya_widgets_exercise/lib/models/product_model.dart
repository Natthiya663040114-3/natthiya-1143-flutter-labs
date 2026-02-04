class ProductModel {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final double rating;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.rating,
  });

  static List<ProductModel> getSampleProducts() {
    return [
      const ProductModel(
        id: 1,
        name: 'Wireless Headphones',
        price: 1290.00,
        imageUrl: 'assets/products/headphones.jpg',
        description:
            'High-quality wireless headphones with active noise cancellation. '
            'Features 30-hour battery life, comfortable over-ear design, and '
            'premium sound quality. Perfect for music lovers and professionals '
            'who need to focus in noisy environments. Includes carrying case '
            'and audio cable for wired connection.',
        rating: 4.5,
      ),
      const ProductModel(
        id: 2,
        name: 'Smart Watch Pro',
        price: 2490.00,
        imageUrl: 'assets/products/smartwatch.jpg',
        description:
            'Feature-rich smartwatch with comprehensive health monitoring. '
            'Tracks heart rate, sleep patterns, blood oxygen, and stress levels. '
            'Water-resistant up to 50 meters with GPS tracking for outdoor '
            'activities. Compatible with both iOS and Android devices.',
        rating: 4.0,
      ),
      const ProductModel(
        id: 3,
        name: 'Portable Speaker',
        price: 890.00,
        imageUrl: 'assets/products/speaker.jpg',
        description:
            'Compact Bluetooth speaker with powerful 360-degree sound. '
            'Waterproof IPX7 rating makes it perfect for pool parties and '
            'outdoor adventures. 12-hour playtime and built-in microphone '
            'for hands-free calls. Pair two speakers for stereo sound.',
        rating: 4.2,
      ),
      const ProductModel(
        id: 4,
        name: 'Laptop Stand',
        price: 590.00,
        imageUrl: 'assets/products/laptop_stand.jpg',
        description:
            'Ergonomic aluminum laptop stand for improved posture and cooling. '
            'Adjustable height and angle to reduce neck and back strain. '
            'Compatible with laptops from 10 to 17 inches. Foldable design '
            'for easy portability. Non-slip silicone pads protect your device.',
        rating: 4.8,
      ),
      const ProductModel(
        id: 5,
        name: 'Mechanical Keyboard',
        price: 1890.00,
        imageUrl: 'assets/products/keyboard.jpg',
        description:
            'Premium mechanical keyboard with customizable RGB backlighting. '
            'Features hot-swappable switches, programmable macros, and '
            'durable PBT keycaps. N-key rollover ensures accurate input '
            'during intense gaming sessions. Detachable USB-C cable included.',
        rating: 4.6,
      ),
      const ProductModel(
        id: 6,
        name: 'Wireless Mouse',
        price: 690.00,
        imageUrl: 'assets/products/mouse.jpg',
        description:
            'Ergonomic wireless mouse with precision tracking sensor. '
            'Silent click buttons for quiet operation in office environments. '
            'Adjustable DPI settings up to 4000. Works on any surface '
            'including glass. USB receiver and Bluetooth dual connectivity.',
        rating: 3.5,
      ),
      const ProductModel(
        id: 7,
        name: 'USB-C Hub',
        price: 790.00,
        imageUrl: 'assets/products/usb_hub.jpg',
        description:
            '7-in-1 USB-C hub for expanded connectivity. Includes HDMI 4K '
            'output, USB 3.0 ports, SD card reader, and 100W power delivery '
            'pass-through. Compact aluminum body with efficient heat dissipation. '
            'Compatible with MacBook, iPad Pro, and Windows laptops.',
        rating: 4.3,
      ),
      const ProductModel(
        id: 8,
        name: 'Webcam HD',
        price: 1190.00,
        imageUrl: 'assets/products/webcam.jpg',
        description:
            '1080p Full HD webcam with auto-focus and low-light correction. '
            'Built-in dual stereo microphones with noise reduction. '
            'Universal clip mount fits any monitor or tripod. Privacy '
            'cover included. Plug and play - no drivers needed.',
        rating: 4.1,
      ),
    ];
  }
}
