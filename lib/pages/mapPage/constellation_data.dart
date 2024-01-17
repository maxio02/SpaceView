class ConstellationInfo {
  final String name;
  final double latitude;
  final double longitude;
  final String description;
  final String imageUrl;

  ConstellationInfo({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.imageUrl,
  });
}

List<ConstellationInfo> constellationInfos = [
  ConstellationInfo(
    name: 'Aries',
    latitude: 20,
    longitude: 37.5,
    imageUrl: 'https://www.star-registration.com/cdn/shop/articles/83_Widder.jpg?v=1682353402&width=600',
    description: "Aries lies in the northern night sky and is visible from the entire northern hemisphere. South of the equator, it is visible up to the 59th parallel, which means it cannot be seen from Antarctica. The best time to observe the constellation in the night sky is from October to February. \n The constellation is located on the ecliptic, the apparent path of the sun and other planets, such as the moon. This means that the sun passes through the constellation at the same time every year. In the present day, this period is from April 19 to May 14. During this time, it is not visible as it rises and sets with the sun. \n From an astrological perspective, the sun passes through the sign of Aries from March 21 to April 20. However, this period was determined thousands of years ago and no longer applies today. Due to the precession of the earth, the sun passes through the constellation around a month later."
  ),
  ConstellationInfo(
    name: 'Taurus',
    latitude: 15,
    longitude: 67.5,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/71_Stier_0424a8d6-acbe-42d9-a566-b7b3edcd82c0.jpg?v=1682002641&width=600',
    description: "Taurus stretches across the celestial equator and is visible in many places. It can be fully seen in the night sky between latitudes 89° N and 59° S. Thus, it can be observed from anywhere in the northern hemisphere. South of the equator, it is not visible in Antarctica and the surrounding ocean. The constellation lies on the ecliptic, the apparent path of the sun and other planets, such as the moon. Therefore, it is one of the 12 astrological zodiac signs. Every year between May 14th and June 20th, the sun passes through Taurus, so it is not visible. At this time, the constellation rises and sets at the horizon together with the sun. However, the zodiac sign Taurus, which was determined based on the sun's passage through the constellation, is defined for a different period. When the astrological zodiac signs were established millennia ago, the path of the sun was shifted by about a month due to the precession movement of the earth."
  ),
  ConstellationInfo(
    name: 'Gemini',
    latitude: 20,
    longitude: 105.0,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/88_Zwillinge.jpg?v=1682454448&width=600',
    description: "The Gemini constellation lies in the northern celestial sky and can be seen from many places. From the northern hemisphere, it can be observed from anywhere, and from the southern hemisphere, it can be seen up to the 55th parallel. This means it can be seen deep in the south of Patagonia, but it cannot be observed from the Antarctic and the surrounding ocean. \n The best time to watch Gemini is from October to April when it appears with an area of approximately 514 square degrees. In comparison to all other 88 constellations, Gemini ranks 30th in size. \n Gemini is located on the ecliptic, the apparent path of the sun and other planets, meaning that the sun passes through this constellation at the same time each year. This period is from June 21 to July 21. During this time, Gemini is not visible as it rises and sets with the sun. \n Astrologically, the sun travels through Gemini from May 22 to June 21. However, this period was determined thousands of years ago and is currently inaccurate due to the precession of the earth. It has shifted by about one month. \n The constellation is easily recognizable in the sky as the stars form an elongated rectangle, with the two brightest stars marking the northeast corners. Some visualizations also connect stars to form the arms and legs of the twins."
  ),
  ConstellationInfo(
    name: 'Cancer',
    latitude: 20,
    longitude: 127.5,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/40_Krebs.jpg?v=1681456204&width=600',
    description: 'The constellation Cancer is located in the northern hemisphere and is visible from almost all inhabited regions of the earth. In the north, it can be seen from anywhere. South of the equator, it is visible up to the 57th parallel. This means that it can only not be observed from Antarctica, as well as the immediately adjacent oceans and islands. \n The best time to watch it is during the winter and spring months in the northern part of the globe. Especially in March, it offers a beautiful view of the constellation. \n In addition, Cancer lies on the ecliptic and is thus one of the 12 zodiac signs that are important in astrology. Every year, from around July 21 to August 10, the sun passes through Cancer. At this time, it rises and sets with the sun and is, therefore, not visible from earth.'
  ),
  ConstellationInfo(
    name: 'Leo',
    latitude: 15,
    longitude: 157.5,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/43_Loewe.jpg?v=1681589943&width=600',
    description: 'he constellation Leo stretches across the celestial equator and is, therefore, visible in both hemispheres. It can be seen from 84° N to 58° S. In northern regions of Greenland and some island groups, it is invisible. In the southern hemisphere, it can be observed as far south as the southernmost point of Patagonia and a few nautical miles further south. It is only not visible from Antarctica and the surrounding islands. \n The best time to observe Leo in the night sky is from October to May, with April and May offering a particularly good view of the constellation. \n As Leo is located on the ecliptic, the sun passes through the constellation every year from August 11th to September 17th. At this time, the constellation cannot be seen as it rises and sets with the sun on the horizon.'
  ),
  ConstellationInfo(
    name: 'Virgo',
    latitude: -5,
    longitude: 195.0,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/31_Jungfrau.jpg?v=1681373719&width=600',
    description: "The constellation Virgo stretches across the celestial equator and is visible in many places. It appears between 67° N and 76° S, which means it is not visible north of the Arctic Circle and in areas of the Antarctic. The months of March to May offer the best view of the constellation. \n Virgo lies on the ecliptic, so the sun passes through the constellation every year between September 16th and October 31st. During this time, the constellation cannot be seen as it rises and sets with the sun on the horizon. \n Although the constellation Virgo is the origin of the astrological zodiac sign Virgo, the current path of the sun deviates from the ancient calculation. This is because the 12 zodiac signs were determined in ancient times when the sun passed through the constellation between August 24th and September 23rd. Today, this is shifted by around one month due to the earth's precession."
  ),
  ConstellationInfo(
    name: 'Libra',
    latitude: -15,
    longitude: 225.0,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/79_Waage.jpg?v=1682319784&width=600',
    description: 'Libra is located immediately south of the celestial equator and can therefore be seen in many places. It is visible from anywhere in the southern hemisphere. North of the equator, it is visible up to the 60th parallel. Thus, it can be observed from all regions south of, for example, Helsinki in Finland, St. Petersburg in Russia, or the southern tip of Greenland. \n In addition, the constellation is located on the ecliptic. This means that the sun and other planets, such as the moon, pass through the constellation at the same time each year. Therefore, Libra is one of the 12 zodiac signs and is the basis for the astrological sign of Libra. \n According to astrology, every living being born between September 24 and October 23 has the zodiac sign Libra. However, this period differs from the current path of the sun. Due to the precession of the earth, the path of the sun has shifted by about one month over the millennia. Today, the sun is in the constellation Libra from October 31 to November 23. At this time, the constellation cannot be seen from earth, as it rises and sets with the sun on the horizon.\nThe best time to observe Libra in the night sky is between the months of January and August. However, Libra is not a particularly large or conspicuous constellation. With its size of around 538 square degrees, it ranks 29th among the other 88 constellations.'
  ),
  ConstellationInfo(
    name: 'Scorpio',
    latitude: -25,
    longitude: 247.5,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/69_Skorpion.jpg?v=1681990211&width=600',
    description: 'The Scorpius constellation lies in the southern sky and can be observed from the entire southern hemisphere. North of the equator, it is fully visible up to the 44th parallel. Therefore, it can only be seen from places south of cities such as Bologna in Italy, Minneapolis in the United States, or Toronto in Canada.\nIn southern regions, the constellation can be observed between the months of January and September, with May to August providing the best view. In northern areas, the period from May to August is also the best time to observe the constellation.\nThe Scorpius stretches over an area of approximately 497 square degrees in the night sky and is ranked 33rd in size compared to all other 88 constellations. It lies on the ecliptic and is, therefore, one of the 12 zodiac signs.'
  ),
  ConstellationInfo(
    name: 'Sagittarius',
    latitude: -25,
    longitude: 285.0,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/64_Schuetze.jpg?v=1681883554&width=600',
    description: 'The constellation Sagittarius lies in the southern celestial hemisphere and can be observed from the entire southern half of the globe. North of the equator, it is fully visible only up to the 45th parallel, so it can only be observed from regions south of locations such as Montreal in Canada, Portland in the United States, or Milan in Italy.\nIt is located on the ecliptic and is the southernmost of the 12 zodiac signs. Every year, between December 18th and January 20th, the sun passes through the constellation. During this period, the constellation cannot be observed as it rises and sets at the same time as the sun. To observe the constellation, the best time is between June and August.'
  ),
  ConstellationInfo(
    name: 'Capricorn',
    latitude: -20,
    longitude: 315.0,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/70_Steinbock.jpg?v=1681998386&width=600',
    description: "The constellation Capricornus is located in the southern sky and can be seen in many places. It can be observed from anywhere in the southern hemisphere, while north of the equator, it can be fully seen in the night sky up to the 63rd parallel. This corresponds roughly to regions such as the south of Iceland or Trondheim in Norway.\nCapricornus lies on the ecliptic and is, therefore, one of the 12 astrological zodiac signs. The sun passes through the constellation every year between January 20th and February 16th. At this time, it cannot be observed as it rises and sets at the horizon simultaneously with the sun. Nevertheless, the astrological zodiac sign Capricorn is assigned to beings born between December 22nd and January 20th. This shift of about a month is due to the earth's precession movement.\nThe best conditions to discover the constellation are from June to November. It stretches over the night sky with an area of about 414 square degrees. Compared to all other 88 constellations, it ranks 40th in size.\nIn sky maps, Capricornus is visualized with a variety of stars in different ways. In some, the stars are connected to form an irregular triangle, while in others, a chain of stars is formed with two triangles."
  ),
  ConstellationInfo(
    name: 'Aquarius',
    latitude: -15,
    longitude: 345.0,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/81_Wassermann.jpg?v=1682346733&width=600',
    description: "Aquarius is a constellation located on the celestial equator and can therefore be observed from many places. It is visible between latitudes 65° N and 87° S, so it can be observed almost up to the Arctic Circle in the northern hemisphere and extends far into the Antarctic in the southern hemisphere. The best time to watch the constellation is between August and November.\nThe constellation lies on the ecliptic and is primarily known for the astrological sign Aquarius. Every year at the same time, the sun passes through the constellation. In today's time, this is between February 16 and March 21. During this time, the constellation cannot be observed as it rises and sets with the sun.\nWhen the astrological signs were determined thousands of years ago, the sun passed through the constellation about a month earlier. However, due to the precession of the earth, this has shifted over time. Nevertheless, the zodiac signs are still determined based on the time back then in astrology. Therefore, living beings born between January 21 and February 19 have the zodiac sign Aquarius.\nAquarius covers an area of 980 square degrees in the sky, making it one of the ten largest constellations in the entire night sky. However, it is not particularly prominent and not easy to find."
  ),
  ConstellationInfo(
    name: 'Pisces',
    latitude: 15,
    longitude: 15.0,
        imageUrl: 'https://www.star-registration.com/cdn/shop/articles/16_Fische.jpg?v=1680604648&width=600',
    description: "The constellation Pisces stretches across the celestial equator and is visible from both hemispheres, appearing between the latitudes 84° N and 57° S. This makes it visible from all inhabited regions in the northern hemisphere. 57° S is south of the tip of Patagonia in Argentina and Chile.\nThe optimal time to observe Pisces in the night sky is from September to November.\nThe constellation lies on the ecliptic, meaning the sun, moon, and other planets pass through it. It is also one of the 12 zodiac signs of astrology. The sun is in the constellation every year from March 12th to April 19th. During this period, the constellation Pisces rises and sets with the sun and is therefore not visible.\nIn astrology, another period was determined for the same zodiac sign thousands of years ago. At that time, the sun passed through the constellation Pisces between February 20th and March 20th. But due to the earth's precession, this is now shifted by about a month. Nevertheless, today's zodiac signs are still determined based on the ancient period.\nAnother event takes place during this period. The ecliptic crosses the celestial equator in the constellation Pisces, marking the astronomical beginning of spring. The terms 'summer solstice' or 'vernal equinox' are also widely used for the time of this crossing."
  ),
];