// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
import 'package:flutter/foundation.dart';

import 'hotel.dart';

class HotelsRepository {
  static List<Hotel> loadProducts(Kind category) {
    List <Hotel> allProducts = <Hotel> [
      Hotel(
        category: Kind.Singapore,
        id: 0,
        name: 'Marina Bay Sands',
        location: '10 Bayfront Avenue, Marina Bay',
        phone_number: '+65 6688 8888',
        description: 'Located along the Marina Bay waterfront, Marina Bay Sands features three cascading hotel towers topped by an extraordinary sky park, floating crystal pavilions, a lotus-inspired Museum, retail stores featuring cutting-edge labels and international luxury brands, trendy Celebrity Chef restaurants, endless entertainment at the theatres, the hottest night clubs and a Las Vegas-style casino.',
      ),
      Hotel(
        category: Kind.Korea,
        id: 1,
        name: 'The Shilla',
        location: 'Dongho-ro 249, Jung-gu, Seoul',
        phone_number: '+82 02 2233 3131',
        description: 'The Hotel opened in March of 1979, following the intention of the late Mr. Byung Chul Lee, the founder of the Samsung Group. Hosting numerous state visits and international events, it has played the role of locomotive for the service industry in Korea with pride and responsibility as the face representing the Samsung Group and the hotel representing Korea',
      ),
      Hotel(
        category: Kind.Korea,
        id: 2,
        name: 'Grand WalkerHill',
        location: 'WalkerHill-ro 177, Gwangjin-gu, Seoul',
        phone_number: '+82 02 2022 0000',
        description: 'Surrounded by the spectacular views of the Hangang River and the Achasan Mountain, Walkerhill serves as the ultimate place to relax and unwind while enjoying a wide variety of entertainment options with unmatched quality and service. With 557 rooms and 8 restaurants, consisting of Korean, Chinese, and Western cuisines, as well as bakery shops offering baked goodies that delight your taste buds, Walkerhill offers an unparalleled guest experience and exceeds expectation at every level.',
      ),
      Hotel(
        category: Kind.Singapore,
        id: 3,
        name: 'Hotel Boss',
        location: '500 Jalan Sultan Road, Singapore',
        phone_number: '+65 6809 0000',
        description: 'Hotel Boss, strategically located, is a new hotel brand to debut in the last quarter of 2015. A 19-storey building, Hotel Boss features 1,500 guest rooms with eleven room types. Every guest room comes with complimentary high speed WiFi access, internet-connected 40” LED TV with cable channels, USB charging socket, electronic safe, mini fridge and other amenities. Guests can enjoy pampering facilities such as the Sky Terrace, a pool with a charming view of the city, modern gym, or childrens playground for travelers with family. Other amenities include conference rooms, internet station, and shopping alley with diverse tenants including a 24-hour convenience store, lifestyle and fashion shops, restaurants and cafés / bar.',

      ),
      Hotel(
        category: Kind.America,
        id: 4,
        name: 'Hilton',
        location: '1751 Hotel Plaza Boulevard, Orlando, Florida',
        phone_number: '+1 40 7 827 4000',
        description: 'As the most recognized name in the industry, travelers all over the world have been saying “Take me to the Hilton” for almost a century. And because of our innovative approach to products, amenities and service, Hilton continues to be synonymous with hotel across the globe. Hilton Hotels & Resorts remains the stylish, forward thinking global leader of hospitality – and we help make traveling easier with our smart design, innovative restaurant concepts, authentic hospitality and commitment to the global community.',
      ),
      Hotel(
        category: Kind.China,
        id: 5,
        name: 'Hotel Okura Macau',
        location: 'Ave Marginal Flor De Lotus, Macau',
        phone_number: '+853 8883 8883',
        description: 'Hotel Okura Macau provides meticulous Japanese-style hospitality, a delightful blend of modern comfort and traditional practice, for a unique and unforgettable hotel experience. Okura Hotels was founded on the principle that its luxury hotels must consistently offer the best accommodation, cuisine and service, and provide a harmonious combination of functionality and comfort. Hotel Okura Macau lives up to these principles, creating a quintessentially Japanese luxury hotel experience for Macau.',

      ),
    ];
    if (category == Kind.all) {
      return allProducts;
    } else {
      return allProducts.where((Hotel p) {
        return p.category == category;
      }).toList();
    }
  }
}
