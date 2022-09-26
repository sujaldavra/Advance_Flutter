import 'package:flutter/cupertino.dart';

class Global {
  static List Listcart = [];
  static List<Map> Productslist = [
    {
      "name": "IPhone 14 Pro Max",
      "price": "999",
      "image":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-model-unselect-gallery-2-202209_GEO_US?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660753617560",
    },
    {
      "name": "MacBook Pro M2",
      "price": "1029",
      "image":
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp-spacegray-select-202206?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1653493200207"
    },
    {
      "name": "AirPods Max",
      "price": "430",
      "image":
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-max-hero-select-202011_FMT_WHH?wid=607&hei=556&fmt=jpeg&qlt=90&.v=1633623988000",
    },
    {
      "name": "Studio Display",
      "price": "1599",
      "image":
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/studio-display-og-202203?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1645125507093",
    },
    {
      "name": "HomePod mini",
      "price": "99",
      "image":
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/homepod-mini-select-spacegray-202110_FMT_WHH?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1632925506000",
    },
    {
      "name": "Mac Studio",
      "price": "1999",
      "image":
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mac-studio-select-202203?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1645739294025",
    },
    {
      "name": "Watch Ultra",
      "price": "799",
      "image":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MQE23ref_VW_34FR+watch-49-titanium-ultra_VW_34FR_WF_CO+watch-face-49-alpine-ultra_VW_34FR_WF_CO?wid=700&hei=700&trim=1%2C0&fmt=p-jpg&qlt=95&.v=1660713657930%2C1660927566964%2C1660927563656",
    },
    {
      "name": "Apple TV 4K",
      "price": "179",
      "image":
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/apple-tv-4k-hero-select-202104_FMT_WHH?wid=940&hei=1112&fmt=p-jpg&qlt=95&.v=1617137945000",
    },
    {
      "name": "Ipad Pro",
      "price": "199",
      "image":
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/ipad-pro-12-select-wifi-spacegray-202104_GEO_IN_FMT_WHH?wid=1945&hei=2000&fmt=jpeg&qlt=95&.v=1617923524000",
    },
    {
      "name": "Airpods Pro",
      "price": "249",
      "image":
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MQD83_AV2?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1660803961811",
    },
  ];
}

titleText(String title) {
  return Container(
    padding: const EdgeInsets.all(12),
    alignment: Alignment.bottomLeft,
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
    ),
  );
}
