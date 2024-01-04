//
//  CityJSONData.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 3.01.2024.
//

import Foundation

struct CityJSONData {
    
    
    static let jsonString = """
    {
        "cities": [
            {
                "plaka": "01",
                "name": "Adana",
                "latitude": 37.0000,
                "longitude": 35.3213
            },
            {
                "plaka": "02",
                "name": "Adıyaman",
                "latitude": 37.7648,
                "longitude": 38.2786
            },
            {
                "plaka": "03",
                "name": "Afyonkarahisar",
                "latitude": 38.7638,
                "longitude": 30.5403
            },
            {
                "plaka": "04",
                "name": "Ağrı",
                "latitude": 39.7217,
                "longitude": 43.0567
            },
            {
                "plaka": "05",
                "name": "Amasya",
                "latitude": 40.6500,
                "longitude": 35.8333
            },
            {
                "plaka": "06",
                "name": "Ankara",
                "latitude": 39.9208,
                "longitude": 32.8541
            },
            {
                "plaka": "07",
                "name": "Antalya",
                "latitude": 36.8841,
                "longitude": 30.7056
            },
            {
                "plaka": "08",
                "name": "Artvin",
                "latitude": 41.1833,
                "longitude": 41.8167
            },
            {
                "plaka": "09",
                "name": "Aydın",
                "latitude": 37.8444,
                "longitude": 27.8458
            },
            {
                "plaka": "10",
                "name": "Balıkesir",
                "latitude": 39.6484,
                "longitude": 27.8826
            },
            {
                "plaka": "11",
                "name": "Bilecik",
                "latitude": 40.1501,
                "longitude": 29.9831
            },
            {
                "plaka": "12",
                "name": "Bingöl",
                "latitude": 38.8853,
                "longitude": 40.4983
            },
            {
                "plaka": "13",
                "name": "Bitlis",
                "latitude": 38.4000,
                "longitude": 42.1167
            },
            {
                "plaka": "14",
                "name": "Bolu",
                "latitude": 40.7395,
                "longitude": 31.6116
            },
            {
                "plaka": "15",
                "name": "Burdur",
                "latitude": 37.7269,
                "longitude": 30.2889
            },
            {
                "plaka": "16",
                "name": "Bursa",
                "latitude": 40.1826,
                "longitude": 29.0669
            },
            {
                "plaka": "17",
                "name": "Çanakkale",
                "latitude": 40.1553,
                "longitude": 26.4142
            },
            {
                "plaka": "18",
                "name": "Çankırı",
                "latitude": 40.6000,
                "longitude": 33.6167
            },
            {
                "plaka": "19",
                "name": "Çorum",
                "latitude": 40.5506,
                "longitude": 34.9556
            },
            {
                "plaka": "20",
                "name": "Denizli",
                "latitude": 37.7765,
                "longitude": 29.0864
            },
            {
                "plaka": "21",
                "name": "Diyarbakır",
                "latitude": 37.9144,
                "longitude": 40.2306
            },
            {
                "plaka": "22",
                "name": "Edirne",
                "latitude": 41.6667,
                "longitude": 26.5667
            },
            {
                "plaka": "23",
                "name": "Elazığ",
                "latitude": 38.6810,
                "longitude": 39.2264
            },
            {
                "plaka": "24",
                "name": "Erzincan",
                "latitude": 39.7500,
                "longitude": 39.5000
            },
            {
                "plaka": "25",
                "name": "Erzurum",
                "latitude": 39.9043,
                "longitude": 41.2679
            },
            {
                "plaka": "26",
                "name": "Eskişehir",
                "latitude": 39.7843,
                "longitude": 30.5192
            },
            {
                "plaka": "27",
                "name": "Gaziantep",
                "latitude": 37.0662,
                "longitude": 37.3833
            },
            {
                "plaka": "28",
                "name": "Giresun",
                "latitude": 40.9128,
                "longitude": 38.3895
            },
            {
                "plaka": "29",
                "name": "Gümüşhane",
                "latitude": 40.4603,
                "longitude": 39.4814
            },
            {
                "plaka": "30",
                "name": "Hakkari",
                "latitude": 37.5833,
                "longitude": 43.7333
            },
            {
                "plaka": "31",
                "name": "Hatay",
                "latitude": 36.4018,
                "longitude": 36.3498
            },
            {
                "plaka": "32",
                "name": "Isparta",
                "latitude": 37.7667,
                "longitude": 30.5500
            },
            {
                "plaka": "33",
                "name": "Mersin",
                "latitude": 36.8000,
                "longitude": 34.6333
            },
            {
                "plaka": "34",
                "name": "Istanbul",
                "latitude": 41.0053,
                "longitude": 28.9770
            },
            {
                "plaka": "35",
                "name": "Izmir",
                "latitude": 38.4189,
                "longitude": 27.1287
            },
            {
                "plaka": "36",
                "name": "Kars",
                "latitude": 40.5927,
                "longitude": 43.0778
            },
            {
                "plaka": "37",
                "name": "Kastamonu",
                "latitude": 41.3887,
                "longitude": 33.7827
            },
            {
                "plaka": "38",
                "name": "Kayseri",
                "latitude": 38.7333,
                "longitude": 35.4833
            },
            {
                "plaka": "39",
                "name": "Kırklareli",
                "latitude": 41.7333,
                "longitude": 27.2167
            },
            {
                "plaka": "40",
                "name": "Kırşehir",
                "latitude": 39.1500,
                "longitude": 34.1667
            },
            {
                "plaka": "41",
                "name": "Kocaeli",
                "latitude": 40.8533,
                "longitude": 29.8815
            },
            {
                "plaka": "42",
                "name": "Konya",
                "latitude": 37.8667,
                "longitude": 32.4833
            },
            {
                "plaka": "43",
                "name": "Kütahya",
                "latitude": 39.4167,
                "longitude": 29.9833
            },
            {
                "plaka": "44",
                "name": "Malatya",
                "latitude": 38.3552,
                "longitude": 38.3095
            },
            {
                "plaka": "45",
                "name": "Manisa",
                "latitude": 38.6191,
                "longitude": 27.4289
            },
            {
                "plaka": "46",
                "name": "Kahramanmaraş",
                "latitude": 37.5833,
                "longitude": 36.9333
            },
            {
                "plaka": "47",
                "name": "Mardin",
                "latitude": 37.3122,
                "longitude": 40.7351
            },
            {
                "plaka": "48",
                "name": "Muğla",
                "latitude": 37.2153,
                "longitude": 28.3636
            },
            {
                "plaka": "49",
                "name": "Muş",
                "latitude": 38.7433,
                "longitude": 41.5065
            },
            {
                "plaka": "50",
                "name": "Nevşehir",
                "latitude": 38.6244,
                "longitude": 34.7240
            },
            {
                "plaka": "51",
                "name": "Niğde",
                "latitude": 37.9667,
                "longitude": 34.6833
            },
            {
                "plaka": "52",
                "name": "Ordu",
                "latitude": 40.9833,
                "longitude": 37.8833
            },
            {
                "plaka": "53",
                "name": "Rize",
                "latitude": 41.0201,
                "longitude": 40.5234
            },
            {
                "plaka": "54",
                "name": "Sakarya",
                "latitude": 40.7569,
                "longitude": 30.3781
            },
            {
                "plaka": "55",
                "name": "Samsun",
                "latitude": 41.2928,
                "longitude": 36.3313
            },
            {
                "plaka": "56",
                "name": "Siirt",
                "latitude": 37.9443,
                "longitude": 41.9329
            },
            {
                "plaka": "57",
                "name": "Sinop",
                "latitude": 42.0264,
                "longitude": 35.1551
            },
            {
                "plaka": "58",
                "name": "Sivas",
                "latitude": 39.7477,
                "longitude": 37.0179
            },
            {
                "plaka": "59",
                "name": "Tekirdağ",
                "latitude": 40.9833,
                "longitude": 27.5167
            },
            {
                "plaka": "60",
                "name": "Tokat",
                "latitude": 40.3167,
                "longitude": 36.5500
            },
            {
                "plaka": "61",
                "name": "Trabzon",
                "latitude": 41.0000,
                "longitude": 39.7333
            },
            {
                "plaka": "62",
                "name": "Tunceli",
                "latitude": 39.1080,
                "longitude": 39.5402
            },
            {
                "plaka": "63",
                "name": "Şanlıurfa",
                "latitude": 37.1500,
                "longitude": 38.8000
            },
            {
                "plaka": "64",
                "name": "Uşak",
                "latitude": 38.6823,
                "longitude": 29.4082
            },
            {
                "plaka": "65",
                "name": "Van",
                "latitude": 38.4942,
                "longitude": 43.3800
            },
            {
                "plaka": "66",
                "name": "Yozgat",
                "latitude": 39.8200,
                "longitude": 34.8044
            },
            {
                "plaka": "67",
                "name": "Zonguldak",
                "latitude": 41.4564,
                "longitude": 31.7987
            },
            {
                "plaka": "68",
                "name": "Aksaray",
                "latitude": 38.3687,
                "longitude": 34.0370
            },
            {
                "plaka": "69",
                "name": "Bayburt",
                "latitude": 40.2552,
                "longitude": 40.2249
            },
            {
                "plaka": "70",
                "name": "Karaman",
                "latitude": 37.1759,
                "longitude": 33.228
            },
            
            {
                "plaka": "71",
                "name": "Kırıkkale",
                "latitude": 39.8468,
                "longitude": 33.5153
            },
            {
                "plaka": "72",
                "name": "Batman",
                "latitude": 37.8812,
                "longitude": 41.1351
            },
            {
                "plaka": "73",
                "name": "Şırnak",
                "latitude": 37.5164,
                "longitude": 42.4611
            },
            {
                "plaka": "74",
                "name": "Bartin",
                "latitude": 41.6344,
                "longitude": 32.3375
            },
            {
                "plaka": "75",
                "name": "Ardahan",
                "latitude": 41.1105,
                "longitude": 42.7022
            },
            {
                "plaka": "76",
                "name": "Iğdır",
                "latitude": 39.9167,
                "longitude": 44.0333
            },
            {
                "plaka": "77",
                "name": "Yalova",
                "latitude": 40.6500,
                "longitude": 29.2667
            },
            {
                "plaka": "78",
                "name": "Karabük",
                "latitude": 41.2000,
                "longitude": 32.6333
            },
            {
                "plaka": "79",
                "name": "Kilis",
                "latitude": 36.7184,
                "longitude": 37.1212
            },
            {
                "plaka": "80",
                "name": "Osmaniye",
                "latitude": 37.0681,
                "longitude": 36.2616
            },
            {
                "plaka": "81",
                "name": "Düzce",
                "latitude": 40.8438,
                "longitude": 31.1565
            }
        ]
    }
    """
    
}
//    static let openWeatherMapApiKey = "f1e052beb1f42a480ae11af22ffa3f41"
//
//
//    {
//      "cities": [
//        {
//          "plaka": "01",
//          "name": "Adana",
//          "latitude": 37.0000,
//          "longitude": 35.3213
//        },
//        {
//          "plaka": "02",
//          "name": "Adıyaman",
//          "latitude": 37.7648,
//          "longitude": 38.2786
//        },
//        {
//          "plaka": "03",
//          "name": "Afyonkarahisar",
//          "latitude": 38.7638,
//          "longitude": 30.5403
//        },
//        {
//          "plaka": "04",
//          "name": "Ağrı",
//          "latitude": 39.7217,
//          "longitude": 43.0567
//        },
//        {
//          "plaka": "05",
//          "name": "Amasya",
//          "latitude": 40.6500,
//          "longitude": 35.8333
//        },
//        {
//          "plaka": "06",
//          "name": "Ankara",
//          "latitude": 39.9208,
//          "longitude": 32.8541
//        },
//        {
//          "plaka": "07",
//          "name": "Antalya",
//          "latitude": 36.8841,
//          "longitude": 30.7056
//        },
//        {
//          "plaka": "08",
//          "name": "Artvin",
//          "latitude": 41.1833,
//          "longitude": 41.8167
//        },
//        {
//          "plaka": "09",
//          "name": "Aydın",
//          "latitude": 37.8444,
//          "longitude": 27.8458
//        },
//        {
//          "plaka": "10",
//          "name": "Balıkesir",
//          "latitude": 39.6484,
//          "longitude": 27.8826
//        },
//        {
//          "plaka": "11",
//          "name": "Bilecik",
//          "latitude": 40.1501,
//          "longitude": 29.9831
//        },
//        {
//          "plaka": "12",
//          "name": "Bingöl",
//          "latitude": 38.8853,
//          "longitude": 40.4983
//        },
//        {
//          "plaka": "13",
//          "name": "Bitlis",
//          "latitude": 38.4000,
//          "longitude": 42.1167
//        },
//        {
//          "plaka": "14",
//          "name": "Bolu",
//          "latitude": 40.7395,
//          "longitude": 31.6116
//        },
//        {
//          "plaka": "15",
//          "name": "Burdur",
//          "latitude": 37.7269,
//          "longitude": 30.2889
//        },
//        {
//          "plaka": "16",
//          "name": "Bursa",
//          "latitude": 40.1826,
//          "longitude": 29.0669
//        },
//        {
//          "plaka": "17",
//          "name": "Çanakkale",
//          "latitude": 40.1553,
//          "longitude": 26.4142
//        },
//        {
//          "plaka": "18",
//          "name": "Çankırı",
//          "latitude": 40.6000,
//          "longitude": 33.6167
//        },
//        {
//          "plaka": "19",
//          "name": "Çorum",
//          "latitude": 40.5506,
//          "longitude": 34.9556
//        },
//        {
//          "plaka": "20",
//          "name": "Denizli",
//          "latitude": 37.7765,
//          "longitude": 29.0864
//        },
//        {
//          "plaka": "21",
//          "name": "Diyarbakır",
//          "latitude": 37.9144,
//          "longitude": 40.2306
//        },
//        {
//          "plaka": "22",
//          "name": "Edirne",
//          "latitude": 41.6667,
//          "longitude": 26.5667
//        },
//        {
//          "plaka": "23",
//          "name": "Elazığ",
//          "latitude": 38.6810,
//          "longitude": 39.2264
//        },
//        {
//          "plaka": "24",
//          "name": "Erzincan",
//          "latitude": 39.7500,
//          "longitude": 39.5000
//        },
//        {
//          "plaka": "25",
//          "name": "Erzurum",
//          "latitude": 39.9043,
//          "longitude": 41.2679
//        },
//        {
//          "plaka": "26",
//          "name": "Eskişehir",
//          "latitude": 39.7843,
//          "longitude": 30.5192
//        },
//        {
//          "plaka": "27",
//          "name": "Gaziantep",
//          "latitude": 37.0662,
//          "longitude": 37.3833
//        },
//        {
//          "plaka": "28",
//          "name": "Giresun",
//          "latitude": 40.9128,
//          "longitude": 38.3895
//        },
//        {
//          "plaka": "29",
//          "name": "Gümüşhane",
//          "latitude": 40.4603,
//          "longitude": 39.4814
//        },
//        {
//          "plaka": "30",
//          "name": "Hakkari",
//          "latitude": 37.5833,
//          "longitude": 43.7333
//        },
//        {
//          "plaka": "31",
//          "name": "Hatay",
//          "latitude": 36.4018,
//          "longitude": 36.3498
//        },
//        {
//          "plaka": "32",
//          "name": "Isparta",
//          "latitude": 37.7667,
//          "longitude": 30.5500
//        },
//        {
//          "plaka": "33",
//          "name": "Mersin",
//          "latitude": 36.8000,
//          "longitude": 34.6333
//        },
//        {
//          "plaka": "34",
//          "name": "Istanbul",
//          "latitude": 41.0053,
//          "longitude": 28.9770
//        },
//        {
//          "plaka": "35",
//          "name": "Izmir",
//          "latitude": 38.4189,
//          "longitude": 27.1287
//        },
//        {
//          "plaka": "36",
//          "name": "Kars",
//          "latitude": 40.5927,
//          "longitude": 43.0778
//        },
//        {
//          "plaka": "37",
//          "name": "Kastamonu",
//          "latitude": 41.3887,
//          "longitude": 33.7827
//        },
//        {
//          "plaka": "38",
//          "name": "Kayseri",
//          "latitude": 38.7333,
//          "longitude": 35.4833
//        },
//        {
//          "plaka": "39",
//          "name": "Kırklareli",
//          "latitude": 41.7333,
//          "longitude": 27.2167
//        },
//        {
//          "plaka": "40",
//          "name": "Kırşehir",
//          "latitude": 39.1500,
//          "longitude": 34.1667
//        },
//        {
//          "plaka": "41",
//          "name": "Kocaeli",
//          "latitude": 40.8533,
//          "longitude": 29.8815
//        },
//        {
//          "plaka": "42",
//          "name": "Konya",
//          "latitude": 37.8667,
//          "longitude": 32.4833
//        },
//        {
//          "plaka": "43",
//          "name": "Kütahya",
//          "latitude": 39.4167,
//          "longitude": 29.9833
//        },
//        {
//          "plaka": "44",
//          "name": "Malatya",
//          "latitude": 38.3552,
//          "longitude": 38.3095
//        },
//        {
//          "plaka": "45",
//          "name": "Manisa",
//          "latitude": 38.6191,
//          "longitude": 27.4289
//        },
//        {
//          "plaka": "46",
//          "name": "Kahramanmaraş",
//          "latitude": 37.5833,
//          "longitude": 36.9333
//        },
//        {
//          "plaka": "47",
//          "name": "Mardin",
//          "latitude": 37.3122,
//          "longitude": 40.7351
//        },
//        {
//          "plaka": "48",
//          "name": "Muğla",
//          "latitude": 37.2153,
//          "longitude": 28.3636
//        },
//        {
//          "plaka": "49",
//          "name": "Muş",
//          "latitude": 38.7433,
//          "longitude": 41.5065
//        },
//        {
//          "plaka": "50",
//          "name": "Nevşehir",
//          "latitude": 38.6244,
//          "longitude": 34.7240
//        },
//        {
//          "plaka": "51",
//          "name": "Niğde",
//          "latitude": 37.9667,
//          "longitude": 34.6833
//        },
//        {
//          "plaka": "52",
//          "name": "Ordu",
//          "latitude": 40.9833,
//          "longitude": 37.8833
//        },
//        {
//          "plaka": "53",
//          "name": "Rize",
//          "latitude": 41.0201,
//          "longitude": 40.5234
//        },
//        {
//          "plaka": "54",
//          "name": "Sakarya",
//          "latitude": 40.7569,
//          "longitude": 30.3781
//        },
//        {
//          "plaka": "55",
//          "name": "Samsun",
//          "latitude": 41.2928,
//          "longitude": 36.3313
//        },
//        {
//          "plaka": "56",
//          "name": "Siirt",
//          "latitude": 37.9443,
//          "longitude": 41.9329
//        },
//        {
//          "plaka": "57",
//          "name": "Sinop",
//          "latitude": 42.0264,
//          "longitude": 35.1551
//        },
//        {
//          "plaka": "58",
//          "name": "Sivas",
//          "latitude": 39.7477,
//          "longitude": 37.0179
//        },
//        {
//          "plaka": "59",
//          "name": "Tekirdağ",
//          "latitude": 40.9833,
//          "longitude": 27.5167
//        },
//        {
//          "plaka": "60",
//          "name": "Tokat",
//          "latitude": 40.3167,
//          "longitude": 36.5500
//        },
//        {
//          "plaka": "61",
//          "name": "Trabzon",
//          "latitude": 41.0000,
//          "longitude": 39.7333
//        },
//        {
//          "plaka": "62",
//          "name": "Tunceli",
//          "latitude": 39.1080,
//          "longitude": 39.5402
//        },
//        {
//          "plaka": "63",
//          "name": "Şanlıurfa",
//          "latitude": 37.1500,
//          "longitude": 38.8000
//        },
//        {
//          "plaka": "64",
//          "name": "Uşak",
//          "latitude": 38.6823,
//          "longitude": 29.4082
//        },
//        {
//          "plaka": "65",
//          "name": "Van",
//          "latitude": 38.4942,
//          "longitude": 43.3800
//        },
//        {
//          "plaka": "66",
//          "name": "Yozgat",
//          "latitude": 39.8200,
//          "longitude": 34.8044
//        },
//        {
//          "plaka": "67",
//          "name": "Zonguldak",
//          "latitude": 41.4564,
//          "longitude": 31.7987
//        },
//        {
//          "plaka": "68",
//          "name": "Aksaray",
//          "latitude": 38.3687,
//          "longitude": 34.0370
//        },
//        {
//          "plaka": "69",
//          "name": "Bayburt",
//          "latitude": 40.2552,
//          "longitude": 40.2249
//        },
//        {
//            "plaka": "70",
//            "name": "Karaman",
//            "latitude": 37.1759,
//            "longitude": 33.228
//        },
//
//    {
//          "plaka": "71",
//          "name": "Kırıkkale",
//          "latitude": 39.8468,
//          "longitude": 33.5153
//        },
//        {
//          "plaka": "72",
//          "name": "Batman",
//          "latitude": 37.8812,
//          "longitude": 41.1351
//        },
//        {
//          "plaka": "73",
//          "name": "Şırnak",
//          "latitude": 37.5164,
//          "longitude": 42.4611
//        },
//        {
//          "plaka": "74",
//          "name": "Bartin",
//          "latitude": 41.6344,
//          "longitude": 32.3375
//        },
//        {
//          "plaka": "75",
//          "name": "Ardahan",
//          "latitude": 41.1105,
//          "longitude": 42.7022
//        },
//        {
//          "plaka": "76",
//          "name": "Iğdır",
//          "latitude": 39.9167,
//          "longitude": 44.0333
//        },
//        {
//          "plaka": "77",
//          "name": "Yalova",
//          "latitude": 40.6500,
//          "longitude": 29.2667
//        },
//        {
//          "plaka": "78",
//          "name": "Karabük",
//          "latitude": 41.2000,
//          "longitude": 32.6333
//        },
//        {
//          "plaka": "79",
//          "name": "Kilis",
//          "latitude": 36.7184,
//          "longitude": 37.1212
//        },
//        {
//          "plaka": "80",
//          "name": "Osmaniye",
//          "latitude": 37.0681,
//          "longitude": 36.2616
//        },
//        {
//          "plaka": "81",
//          "name": "Düzce",
//          "latitude": 40.8438,
//          "longitude": 31.1565
//        }
//      ]
//    }
//}
