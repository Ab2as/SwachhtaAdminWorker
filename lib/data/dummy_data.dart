import 'package:flutter/material.dart';
import 'package:swachhta_app2/data/department_model.dart';
import 'package:swachhta_app2/news/news_model.dart';

const dept = [
  Department(
    id: 'd1',
    title: 'Clean',
    color: Colors.purple,
  ),
  Department(
    id: 'd2',
    title: 'Animal',
    color: Colors.red,
  ),
  Department(
    id: 'd3',
    title: 'Water',
    color: Colors.orange,
  ),
  Department(
    id: "d4",
    title: 'Sewage',
    color: Colors.amber,
  ),
  Department(
    id: "d5",
    title: 'Road',
    color: Colors.blue,
  ),
  Department(
    id: "d6",
    title: 'Garbage',
    color: Colors.green,
  ),
];

final dummyNews = [
  Article(
    id: "1",
    title: "Students join ‘Swachhta Hi Seva Abhiyan’, to clean school, roads",
    description:
        "The Swachh Bharat Mission continues its efforts with the ongoing Swachhata Pakhwada (Cleanliness Fortnight) from February 1st to 15th, 2024. This year's theme focuses on 'Garbage Free India,' encouraging waste segregation and responsible waste management practices.",
    content:
        "The campaign involves various activities, including cleanliness drives, awareness campaigns, workshops on waste management, and community participation initiatives. Schools, government offices, and NGOs are actively leading these efforts to build a cleaner and healthier India.",
    urlToImage:
        "https://static.toiimg.com/thumb/msid-104078592,imgsize-82704,width-400,resizemode-4/104078592.jpg",
    articleUrl:
        "https://timesofindia.indiatimes.com/city/ranchi/students-join-swachhta-hi-seva-abhiyan-to-clean-school-roads/articleshow/104078593.cms",
  ),
  Article(
    id: '2',
    title:
        "Swachh Bharat Abhiyan Must Be Taken As Social Movement: Top Court Judge",
    description:
        "While the Swachh Bharat Mission has achieved significant progress in improving sanitation facilities, challenges remain, including allegations of corruption and ensuring long-term sustainability of the program.",
    content:
        "Reports of misused funds and poorly constructed toilets highlight the need for stricter transparency and accountability measures. Additionally, ensuring continued usage and maintenance of toilets after construction is crucial for the mission's lasting success.",
    urlToImage:
        "https://c.ndtvimg.com/2022-10/tthv9vd8_supreme-court-india-generic-pti_625x300_10_October_22.jpg",
    articleUrl:
        "https://www.ndtv.com/india-news/swachh-bharat-abhiyan-must-be-taken-as-social-movement-top-court-judge-4442142",
  ),
  Article(
    id: '3',
    title: " These Two Indian Cities Voted Cleanest This Year",
    description:
        "Despite the challenges, innovative solutions are emerging to address the issues faced by the Swachh Bharat Mission. These include utilizing technology for waste management, such as mobile apps for waste collection, and promoting community engagement through local initiatives and partnerships.",
    content:
        "Examples include startups developing biodegradable waste disposal solutions and community-led projects fostering awareness and encouraging behavioral change. These efforts offer hope for a cleaner and more sustainable future for India.",
    urlToImage:
        "https://c.ndtvimg.com/2024-01/6kj1feio_indore_625x300_06_January_24.jpg",
    articleUrl:
        "https://www.ndtv.com/india-news/spick-and-span-indore-is-indias-cleanest-city-for-7th-consecutive-year-4841412",
  ),
  Article(
    id: '4',
    title:
        "All 6,650 Villages Of Jammu And Kashmir Declared Open Defecation Free Plus",
    description:
        " This achievement is a significant milestone as it goes beyond constructing and use of toilets towards cleanliness by managing greywater and solid waste in each village, they said.",
    content:
        "In a significant milestone for Jammu and Kashmir under the Swachh Bharat Mission, all of its 6,650 villages have been declared open defecation-free plus model, officials said here on Saturday. ",
    urlToImage:
        "https://c.ndtvimg.com/2019-10/qg39gk78_kashmir-generic-journey-basket_625x300_13_October_19.jpg",
    articleUrl:
        "https://www.ndtv.com/india-news/all-6-650-villages-of-jammu-and-kashmir-declared-open-defecation-free-plus-4437612",
  ),
  Article(
    id: '5',
    title:
        "A Healthier Nation: The Link Between Swachh Bharat Mission and Public Health",
    description:
        "Poor sanitation contributes significantly to the spread of diseases, impacting public health and well-being. The Swachh Bharat Mission's focus on improving sanitation has a direct impact on reducing the burden of diseases like diarrhea, cholera, and other sanitation-related illnesses.",
    content:
        "Improved sanitation facilities and hygiene practices can significantly decrease healthcare costs and improve the overall health and quality of life for millions of Indians.",
    urlToImage:
        "https://thewashbusiness.files.wordpress.com/2017/10/hpgt_pic1.jpg?w=925",
    articleUrl:
        "https://thewashbusiness.wordpress.com/2017/11/10/church-leaders-and-hygiene-promotion/",
  ),
];
