//
//  SearchResult.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import Foundation

struct SearchResult: Decodable {
    let screenshotUrls: [String]
    let artworkUrl60: String
    let trackName: String
    let trackId: Int
    let price: Double?
    let averageUserRating: Double
    let userRatingCount: Int
}

extension [SearchResult] {
    static let mock: SearchResult = SearchResult(
        screenshotUrls: [
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/3b/44/c1/3b44c1ea-3367-f7a4-2c27-76f5bbe8a4d3/2863754d-fcf9-44ca-b2e4-a3779fe92e4e_1_1242_2208.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/a1/c6/8f/a1c68f28-8549-d694-ffad-a0a8110dc64f/fd677b73-64bb-415b-be6b-ce52da504705_2_1242_2208.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/9b/d9/dc/9bd9dcc4-d04e-6c0e-805a-876d4962b761/c2a6c2f0-68ca-433b-b4fc-9e89af7476e9_3_1242_2208.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/aa/59/8e/aa598e52-fb91-db8a-4fe5-90349bb83d45/62309ee7-489b-4b80-b79b-b4c02c5f4130_4_1242_2208.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/6e/cd/2c/6ecd2c0b-a4b6-3d32-c981-ce26819516cd/6eb6f461-fbb4-4038-9abb-cacd32e07d5d_5_1242_2208.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/da/f2/28/daf228b3-e42c-d2ed-b994-7e854a0adb26/6c551c33-b8b3-4b98-b79b-41c8d57dece3_6_1242_2208.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/6d/63/e9/6d63e92d-d446-a423-7bf5-879f06ca5a1e/c19cdd27-1382-4704-9635-06cc3c9d6028_7_1242_2208.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/93/29/2b/93292bb6-7b91-f3f0-a27e-2b2aa2dc191b/475e2e5e-9d4e-4cb9-a5bc-cd68fd09dd83_8_1242_2208.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/78/4b/5e/784b5e0d-ab12-4134-cd40-0a23084cd272/95110afa-c1ae-453e-ba03-31e0c5f2f232_9_1242_2208.jpg/392x696bb.jpg"
        ],
        artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/a0/06/ff/a006ff41-49bb-0bab-3ea9-ef04d9798146/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg",
        trackName: "카카오 T - 택시, 대리, 주차, 바이크, 항공, 퀵",
        trackId: 981110422,
        price: 0.0,
        averageUserRating: 4.72239,
        userRatingCount: 463215
    )
    
    static let mockList: [SearchResult] = [
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/3b/44/c1/3b44c1ea-3367-f7a4-2c27-76f5bbe8a4d3/2863754d-fcf9-44ca-b2e4-a3779fe92e4e_1_1242_2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/a1/c6/8f/a1c68f28-8549-d694-ffad-a0a8110dc64f/fd677b73-64bb-415b-be6b-ce52da504705_2_1242_2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/9b/d9/dc/9bd9dcc4-d04e-6c0e-805a-876d4962b761/c2a6c2f0-68ca-433b-b4fc-9e89af7476e9_3_1242_2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/aa/59/8e/aa598e52-fb91-db8a-4fe5-90349bb83d45/62309ee7-489b-4b80-b79b-b4c02c5f4130_4_1242_2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/6e/cd/2c/6ecd2c0b-a4b6-3d32-c981-ce26819516cd/6eb6f461-fbb4-4038-9abb-cacd32e07d5d_5_1242_2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/da/f2/28/daf228b3-e42c-d2ed-b994-7e854a0adb26/6c551c33-b8b3-4b98-b79b-41c8d57dece3_6_1242_2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/6d/63/e9/6d63e92d-d446-a423-7bf5-879f06ca5a1e/c19cdd27-1382-4704-9635-06cc3c9d6028_7_1242_2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/93/29/2b/93292bb6-7b91-f3f0-a27e-2b2aa2dc191b/475e2e5e-9d4e-4cb9-a5bc-cd68fd09dd83_8_1242_2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/78/4b/5e/784b5e0d-ab12-4134-cd40-0a23084cd272/95110afa-c1ae-453e-ba03-31e0c5f2f232_9_1242_2208.jpg/392x696bb.jpg"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/a0/06/ff/a006ff41-49bb-0bab-3ea9-ef04d9798146/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg",
            trackName: "카카오 T - 택시, 대리, 주차, 바이크, 항공, 퀵",
            trackId: 981110422,
            price: 0.0,
            averageUserRating: 4.72239,
            userRatingCount: 463215
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/b0/cd/f2/b0cdf2b6-3d66-e678-fdb6-582c00a6ae61/70c8141b-d792-44ee-aadd-ddfd34c0b7dc_1.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/1b/14/3e/1b143eb6-dfc9-ca61-4062-c581614784ef/40aa77e2-e5ef-4f54-acdf-22eee876e1ea_2.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/e1/2e/bf/e12ebf8a-3114-cb91-9a4d-848be35baf72/7e87309b-65b2-4933-b694-703a4f146953_4.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/7e/f3/58/7ef35807-7f6b-63a9-432e-0ab3c8f19928/c5748110-bc09-4da0-87b4-759ea318a0b6_3.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/8d/87/03/8d870335-b3af-1ca9-7519-8f18905213a7/66ab3365-a653-4244-9a71-d19aec610522_7.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/5c/59/a8/5c59a80f-4766-1c59-8455-da5dc2293c3e/6479dade-0291-40d3-88bc-3475e69460cd_8.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/e5/59/a4/e559a4b6-2699-3ad1-da7b-4fa6cd66a98c/9ed3cd0b-1ba0-4577-ae1b-59737eabde47_4.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/f8/08/b6/f808b624-f5dc-6a4b-df39-1e85ae1a6426/ede54016-b6e1-4edb-9b49-078b45b2c58f_5.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/cf/bd/52/cfbd52f9-1335-b074-7dcd-73d2b921bac4/7a457121-8f9b-4e75-b85b-ace5f4a067cd_6.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/3e/b9/e4/3eb9e450-a07c-9aca-b36e-6725bc9b7d71/bc42b811-345e-418f-a0e9-db41bb109d59_10.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/c6/1a/ef/c61aefb8-e0e0-ff12-dedd-d07bc9beb8f3/AppIcon-0-0-1x_U007epad-0-1-0-85-220.png/60x60bb.jpg",
            trackName: "카카오맵 - 대한민국 No.1 지도앱",
            trackId: 304608425,
            price: 0.0,
            averageUserRating: 4.67535,
            userRatingCount: 150092
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/00/81/6d/00816d79-d5bc-e391-85f9-fcc4e8d0b2cb/ios_1242x2208_01.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/04/d8/13/04d81313-e1e0-f6a0-9de8-391241fd05b2/ios_1242x2208_02.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/40/25/53/40255350-a550-923b-c841-e5a38b1082ff/ios_1242x2208_03.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/c6/93/a4/c693a410-2fce-2144-e813-689d41bff430/ios_1242x2208_04.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/fc/f4/8c/fcf48c59-1df8-2ac5-580c-76f3ff722f7a/ios_1242x2208_05.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/7b/b2/59/7bb259e4-69c9-8d47-52d5-763d4fd22be4/ios_1242x2208_06.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/1e/f7/cd/1ef7cd47-1de4-1f2c-dfdc-2c984f964482/ios_1242x2208_07.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/84/d8/4e/84d84e75-fb97-a8f3-f8cb-897665f6e9e9/AppIcon-0-0-1x_U007emarketing-0-11-0-85-220.png/60x60bb.jpg",
            trackName: "카카오페이",
            trackId: 1464496236,
            price: 0.0,
            averageUserRating: 4.63665,
            userRatingCount: 28738
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/18/fa/3c/18fa3c6d-3612-26eb-013a-c61fffa77eaa/Kakaotalk_iOS_SC_KR_01.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/54/35/99/543599ee-b5ef-0350-d440-3459e3605353/Kakaotalk_iOS_SC_KR_02.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/e3/ec/0f/e3ec0f20-2e01-cbee-d35c-cd28b6055202/Kakaotalk_iOS_SC_KR_03.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/61/1f/79/611f79bf-6f1c-6675-9548-af4137247402/Kakaotalk_iOS_SC_KR_06.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/62/0a/90/620a90fb-dd04-8432-5c33-20fe8dc1c950/Kakaotalk_iOS_SC_KR_04.jpg/392x696bb.jpg"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/c6/6e/8c/c66e8c5a-5a5b-f26f-b486-b479c3973853/AppIcon-0-0-1x_U007epad-0-0-0-1-0-0-sRGB-85-220.png/60x60bb.jpg",
            trackName: "카카오톡",
            trackId: 362057947,
            price: 0.0,
            averageUserRating: 3.00818,
            userRatingCount: 143836
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/53/07/f5/5307f5b2-e927-9ded-5a61-32d4f6f05db8/d88891ba-d3e8-49b7-97f5-a21fa60bcea8_04-1.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/e8/20/97/e820972d-66d8-92de-d268-e6718adf90f8/b309daf3-b372-45a9-a25e-5d231b49dc94_04-2.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/55/4b/f3/554bf3a5-2c56-4c39-5ed6-9864d7c0c9bd/e3cf469d-e2e5-4420-bb82-560233070a03_04-3.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/c1/8c/9d/c18c9d7b-14e3-a094-65b1-b05cb0a7e393/10e4cdd7-6263-44e4-a80e-f9d0d7f841d5_04-4.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/7a/e3/c2/7ae3c271-6283-2397-1ab7-b4b3dbc4e172/b94107da-1d63-4857-8f59-951b798b715e_04-5.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/6f/bb/5a/6fbb5a30-284f-dcb0-af1d-e6f40972187b/3bfd43a5-0c99-4cca-abc5-6ac9500e704b_04-6.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/35/85/41/3585417e-6243-77da-d1ee-e35dd3d45ac2/5ec13653-808c-4284-ac38-cf8d276184e8_04-7.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/e8/8a/51/e88a5172-b13b-fc85-4b1d-d6e8c57105c3/476cbe6e-2f19-4612-8b50-79b44b4ca4b9_04-8.jpg/392x696bb.jpg"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/6b/8e/0c/6b8e0c99-c023-b75d-ed90-abaa7f68c018/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg",
            trackName: "카카오웹툰 – KAKAO WEBTOON",
            trackId: 736602666,
            price: 0.0,
            averageUserRating: 4.07848,
            userRatingCount: 27981
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/ed/23/4f/ed234f0e-ff53-b73b-a60b-9edf2d772afe/iOS_5.5_01.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/3d/cf/52/3dcf52a0-604d-24d7-b5b2-5f820db5ad0a/iOS_5.5_02.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/bd/e9/fc/bde9fcd9-f6e0-cca6-c876-4f0f6be22229/iOS_5.5_03.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/43/66/d8/4366d87e-3207-9555-5609-2c87b015c739/iOS_5.5_04.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/3a/71/58/3a7158fc-42f5-d2af-35a3-25d76e67a244/iOS_5.5_05.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/27/b6/17/27b61713-7075-3fd0-318d-8bc35b530917/iOS_5.5_06.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/ba/02/71/ba02715a-c3d5-b062-8ec6-9c2c227c497f/iOS_5.5_07.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/18/8d/23/188d2351-be90-918a-17ae-4bedfd233828/iOS_5.5_08.jpg/392x696bb.jpg"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/83/5a/c6/835ac6cc-6077-d54f-4e4c-798e02cbf521/AppIcon_real-0-0-1x_U007ephone-0-1-0-85-220.png/60x60bb.jpg",
            trackName: "카카오뱅크",
            trackId: 1258016944,
            price: 0.0,
            averageUserRating: 3.34161,
            userRatingCount: 13284
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/98/0f/08/980f0806-3b35-d6ef-f205-41897a2d0df4/mzl.eykbgngq.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/75/54/8c/75548ca7-5d61-70f9-1c4b-4bbb4016512a/mzl.brxzixee.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/a3/1f/de/a31fdecb-0cb9-ee0c-612a-efe847187a77/mzl.jegfbixn.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/9a/61/3c/9a613c39-ea32-5af7-f7fd-97aacb36270c/mzl.rpnzyiig.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/3a/e8/40/3ae8403b-37b1-c86b-456e-1156ae686e4b/mzl.wmnptdnt.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/f0/af/4c/f0af4ca5-69a9-5968-0b20-01eab260be75/AppIcon-0-0-1x_U007emarketing-0-8-0-85-220.png/60x60bb.jpg",
            trackName: "카카오지하철",
            trackId: 1095533900,
            price: 0.0,
            averageUserRating: 1.68894,
            userRatingCount: 4025
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/eb/04/a9/eb04a9cc-aa8c-365a-7bb6-e6a1bfe02357/e7f3c4ec-57ec-4e6d-a01e-fa56bb5fecf8_ios_1242x2208_s1_1__U00281_U0029.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/8f/74/ee/8f74ee4d-1ea4-128c-a771-697ad0b4d160/e916e554-fc68-4069-a05b-4fdedb5553b1_ios_1242x2208_s1_2.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/23/8b/d7/238bd70f-5879-ab87-d8f4-28b6e829fc5d/ed77ab45-a89b-46ea-98c9-281377d961f1_ios_1242x2208_s6.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/3c/c0/b2/3cc0b221-77da-0fa0-afe9-fa975df684f0/3b23bc3b-003c-4f82-98a3-f7fb61cb4c4c_ios_1242x2208__U1102_U1162_U1107_U1175_U1112_U1169_U11b7.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/45/fa/4f/45fa4f23-292c-4c8e-4361-44bfae717c69/d508565e-a6de-4654-b184-052321ec5046_ios_1242x2208__U1100_U1167_U11bc_U1110_U1161_U11b7.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/56/ef/97/56ef97e3-d87c-c68a-a1a9-4d77a59fc87d/0404dfb0-0e3c-442c-ad7d-58d0a6286392_ios_1242x2208_s15.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/01/66/3e/01663eb2-588e-6fca-5e90-ec803bbbf59c/51d05ea5-8845-4dba-bc22-96b00e7409fb_ios_1242x2208_s14.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/d6/04/a8/d604a84a-a6ae-b1e6-350f-71c82f2b4c1b/78bc332a-d0b6-4cbf-a83f-d8b7be64de8d_ios_1242x2208_s13.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/6f/dc/d0/6fdcd0b1-a5ce-350e-d30a-d480ec0462ed/aaa4282f-24f9-40e2-b258-ef6259e5a947_ios_1242x2208_s7.jpg/392x696bb.jpg"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/38/9c/79/389c793a-da98-e2f8-15c0-6f8e56288a13/AppIcon-0-0-1x_U007epad-0-11-0-85-220.png/60x60bb.jpg",
            trackName: "카카오내비 - 주차,발렛,전기차충전,세차,보험,중고차",
            trackId: 417698849,
            price: 0.0,
            averageUserRating: 2.31931,
            userRatingCount: 8042
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/af/aa/76/afaa76d5-def6-e626-0f84-dad677f29fbe/1_1242_2208.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/f9/bd/f5/f9bdf5fa-2525-26b9-e0f2-0747ab29310f/2_1242_2208.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/45/d7/41/45d741bf-6a5b-0649-413a-0a304702804b/3_1242_2208.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/78/a6/16/78a616ec-d060-4f3c-b22d-bd28db491688/4_1242_2208.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/4c/f5/c1/4cf5c16a-313e-0c0d-f83b-352a7f394a31/5_1242_2208.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/b5/2d/18/b52d18a5-d762-5c2e-bbc8-b87fc28e0d69/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/60x60bb.jpg",
            trackName: "마메드네",
            trackId: 1173776109,
            price: 0.0,
            averageUserRating: 4.80539,
            userRatingCount: 72547
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/a5/13/d6/a513d64a-ee65-5ee0-98ea-514367354157/3151c7be-1987-48e2-86ff-b51a530288b0_1.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/86/31/b0/8631b08c-4f1e-0121-9262-1f2d41206356/a6a69e90-3ffb-407a-ad3f-c31c2b3e3af3_2.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/91/85/bd/9185bd70-7bbe-669e-36e1-330464f193f1/9868805a-6f89-4964-b1b8-234d8422489a_3.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/c3/94/c3/c394c3c5-b4cd-4b54-d5c7-fe2262f794cb/bc20f19b-5304-4735-83dd-4f3bcb9d9b96_4.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/d3/53/0d/d3530d86-9005-1e54-a958-c670d27bdb3e/d8c2e490-ace7-4218-aa75-517832f8e98c_5.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/92/3a/85/923a859d-9d0f-ccdf-dec1-8f217621a0a6/d99afb39-4a51-4114-8780-6a42c34acbc5_6.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/f9/c1/31/f9c1311e-8ec5-bef1-6bd8-22841923c62d/e820cd02-4b48-4728-8836-6912097706b0_7.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/98/99/d1/9899d15e-85fc-4e2a-a4b9-4111a1e45ec4/3ef8da6e-0643-4bac-87fe-e2b5a12f7693_8.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/48/5b/17/485b178b-2740-9f33-0ac2-5139af788599/8f990109-0339-4767-a031-3df7c8a743ba_9.jpg/392x696bb.jpg"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/21/5f/b2/215fb26e-3b9c-65ea-1d85-4830455c497e/AppIcon-0-0-1x_U007emarketing-0-8-0-85-220.png/60x60bb.jpg",
            trackName: "카카오페이지",
            trackId: 616643813,
            price: 0.0,
            averageUserRating: 2.57444,
            userRatingCount: 11714
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/Purple112/v4/ca/b1/8c/cab18ccf-6e60-7517-3c3f-afe05e3d218b/mzl.uvgdjovc.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/b6/be/26/b6be260c-37b9-8982-c2f3-a5b213fe7797/mzl.obsrpzqj.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple112/v4/11/9c/0d/119c0d99-2bfc-5a51-2c4c-09e0888f3761/mzl.survxtyl.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/06/8c/de/068cdefe-1b82-1010-3e3e-7e5b6e5c13a1/mzl.ruejalzk.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/72/c8/42/72c84233-61c9-8ac8-ae3e-656575ef97a1/AppIcon-0-0-1x_U007emarketing-0-5-0-85-220.png/60x60bb.jpg",
            trackName: "카카오뮤직 KakaoMusic",
            trackId: 696690152,
            price: 0.0,
            averageUserRating: 2.52842,
            userRatingCount: 774
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/76/5d/75/765d7562-5f38-5a3f-67f7-18de0bd79488/323418cb-4794-4ab1-ba0c-cd05db73020e_Tdriver_AOS_01_nonalpha.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/d6/fe/1d/d6fe1df7-ae0c-1cdc-1459-23a641cdfb26/cf73f848-996b-439a-9eb4-14623316984e_Tdriver_AOS_02.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/3e/52/ca/3e52ca4c-13f9-f46a-5486-5e6c9f184bbc/1534e01f-7998-4ba6-945a-c9f5dd24a8db_Tdriver_AOS_03.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/54/14/9d/54149d9d-2c4b-4c0e-ce73-d999403fc0f4/1cd81ff3-9e74-4b38-a034-1ffa45bd02c4_Tdriver_AOS_04.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/10/24/c1/1024c167-fd77-24cd-d872-5c2ea8abbe48/4a382c2b-1378-4f30-b2ae-5cd46c1666e5_Tdriver_AOS_05.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/1c/5e/a8/1c5ea8da-1b93-3506-8bb4-351736a4357c/400be723-1b9f-44d8-b72a-23088a2d7396_Tdriver_AOS_06.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/da/66/ea/da66ea85-9335-adb1-93c4-9b98e0e213db/f2e98e81-e290-43d5-8206-015e64c850f4_Tdriver_AOS_07.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/d0/79/71/d079719b-eee9-fed9-0c1c-8549af4ad4e2/AppIcon.release-0-0-1x_U007emarketing-0-6-0-85-220.png/60x60bb.jpg",
            trackName: "카카오 T 대리",
            trackId: 1110271804,
            price: 0.0,
            averageUserRating: 2.91935,
            userRatingCount: 496
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/bc/c6/5e/bcc65ecd-93f8-b558-5a8b-87cf54f29fa7/1242_2208_App_store_Screen_ios_03.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/86/c8/e4/86c8e45a-c550-f46e-f0e5-8cbfe8b73567/1242_2208_App_store_Screen_ios_03-1.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/30/f6/90/30f6901c-94e5-5d9f-fb2e-cba33beb5399/1242_2208_App_store_Screen_ios_03-2.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/f0/5b/0c/f05b0c74-d3f7-cd34-885f-1fb5112c5940/1242_2208_App_store_Screen_ios_03-3.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/61/53/c4/6153c479-03e3-2a68-9ba6-7ba6678611b0/1242_2208_App_store_Screen_ios_03-4.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/40/3e/52/403e5273-3344-71d4-cfd0-a8b4995bfa14/1242_2208_App_store_Screen_ios_03-5.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/5d/8a/e0/5d8ae028-7076-b0c0-f6c0-ff6e95cc946e/1242_2208_App_store_Screen_ios_03-6.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/d4/6c/35/d46c3548-7828-d2e7-7e6d-985ddf4123a0/AppIcon-0-0-1x_U007ephone-0-1-0-sRGB-85-220.png/60x60bb.jpg",
            trackName: "카카오골프예약",
            trackId: 1423489983,
            price: 0.0,
            averageUserRating: 4.79748,
            userRatingCount: 35329
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/8f/38/b4/8f38b4f1-5e22-1a3a-b127-91be8679cd1a/IOS_-_5.5_-_S01_-_U005bKorean__U0028South_Korea_U0029_U005d.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/95/fd/bd/95fdbd58-489a-949d-2639-07978d27d2e8/IOS_-_5.5_-_S02_-_U005bKorean__U0028South_Korea_U0029_U005d.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/a8/28/98/a828980e-094b-fd82-10a5-731694bf713e/IOS_-_5.5_-_S03_-_U005bKorean__U0028South_Korea_U0029_U005d.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/6d/19/7a/6d197a51-5471-8e8a-f508-3e68349b8594/IOS_-_5.5_-_S04_-_U005bKorean__U0028South_Korea_U0029_U005d.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/8e/a6/b7/8ea6b76d-f93c-886e-2a2e-264295ab16d4/IOS_-_5.5_-_S05_-_U005bKorean__U0028South_Korea_U0029_U005d.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/d1/bf/9b/d1bf9b61-13ff-01ab-f7f2-a3eaba0259f2/IOS_-_5.5_-_S06_-_U005bKorean__U0028South_Korea_U0029_U005d.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/9a/09/b3/9a09b348-6a0f-01a1-0a0e-697787bcebe4/IOS_-_5.5_-_S07_-_U005bKorean__U0028South_Korea_U0029_U005d.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/ea/e0/66/eae0669b-8c6b-45cc-d1da-32c7dd5ecf50/AppIcon-0-0-1x_U007emarketing-0-7-0-0-85-220.png/60x60bb.jpg",
            trackName: "Spotify (스포티파이) : 뮤직 & 팟캐스트 앱",
            trackId: 324684580,
            price: 0.0,
            averageUserRating: 4.79016,
            userRatingCount: 318756
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/76/1b/3b/761b3bcc-c038-1b71-be34-b7e77ec0a93a/82765daf-fc38-409e-af00-b8f737d9fa62_01.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/60/27/4f/60274fc1-b9b2-4f09-c902-46a39dd0943c/ea7014a0-e121-413c-a64d-bad73b1392d6_02.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/7d/70/88/7d7088b2-d2f9-a80a-e42d-a1f3f4485b73/a58ebdc0-fea2-4894-813f-ee49e3ec4a16_03.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/1a/5b/34/1a5b34de-ec43-8465-5721-df0f899ef83a/6ececcff-6f53-4a23-a473-5d2cc2952071_04.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/d6/8b/39/d68b396a-8e39-24f6-213a-8491f5c28c78/9dca7acc-3456-428b-8971-405c16f41148_05.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/e7/ff/4e/e7ff4ee1-243c-7327-f90a-b0a7ffbf0e49/59a2800f-ee51-4a47-9177-2e4e3c72d949_06.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/49/c5/81/49c581ec-99cb-9515-d31e-59e8d050ee7f/AppIcon-real-0-0-1x_U007epad-0-1-0-85-220.png/60x60bb.jpg",
            trackName: "카카오스토리",
            trackId: 486244601,
            price: 0.0,
            averageUserRating: 2.78818,
            userRatingCount: 6614
        ),
        SearchResult(
            screenshotUrls: [],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/94/a5/03/94a50354-e55c-3e43-2a85-9786d49e91b6/AppIcon-0-0-1x_U007epad-0-1-0-85-220.png/60x60bb.jpg",
            trackName: "카카오톡 채널 관리자",
            trackId: 990571676,
            price: 0.0,
            averageUserRating: 2.38405,
            userRatingCount: 690
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/Purple124/v4/12/f3/bd/12f3bd02-6fb2-0b5f-fb0e-a8a8f3709043/mzl.fihzixpj.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource124/v4/d0/40/a9/d040a99a-3afd-6c16-279f-7512c59a1222/e8e1467a-59fb-4fb7-92b4-ab89ac41c00e_appstore_screenshot_02.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource114/v4/29/7e/10/297e10b7-382c-5e0b-5fa7-2980bd2b6d48/439d8887-9840-4d25-95a6-23fc7ed62975_appstore_screenshot_03.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource114/v4/82/e6/af/82e6af02-f575-4740-6be3-885f1b543e52/0c438e3a-6669-4699-a26e-ed7b2f34e9ed_appstore_screenshot_07.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource114/v4/d0/ff/c3/d0ffc3ab-025f-2ca8-2785-1b785f68a055/d9231d5d-7d21-4446-a1cb-7e11a0c03f96_appstore_screenshot_08.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple124/v4/07/a4/5e/07a45e97-98d5-cdef-f476-306fc6f7ba7c/pr_source.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/Purple124/v4/23/8c/d0/238cd0ff-c747-87dd-7c80-adf02e2ff017/mzl.qnrxdnpw.png/392x696bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource114/v4/f4/6a/8d/f46a8d35-ea1d-0477-f7a1-572261160af3/376a5e56-f3f4-4e47-bf6e-6e41d9f56688_appstore_screenshot_06.png/392x696bb.png"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/3c/f7/87/3cf787c5-4056-543c-0c4d-3d254c132693/AppIcon-0-0-1x_U007emarketing-0-8-0-85-220.png/60x60bb.jpg",
            trackName: "헤이카카오 Hey Kakao",
            trackId: 1286618447,
            price: 0.0,
            averageUserRating: 2.28245,
            userRatingCount: 963
        ),
        SearchResult(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/7a/23/e9/7a23e90b-d8d6-adc3-4008-38d1400e35ef/05b2521e-f4ef-44e9-9712-97bdae5a183a__U7ad6_U7248_U9996_U56fe_1242x2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/e7/9f/51/e79f5169-de0d-2403-5018-a042750d6222/13f43eae-8bb4-4f8a-aa96-f59c618bdd3f__U7ad6_U72481_1242x2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/5a/2e/44/5a2e446e-4e72-5e2e-ebdc-5f8a9549e42d/ed4a35e3-2ced-4f74-b8e6-067acd2e67b2__U7ad6_U72482_1242x2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/e0/81/cd/e081cd22-9d56-6cde-40e2-273a8ad6875d/6fe17a13-acf8-44fa-80fd-06d416543576__U7ad6_U72483_1242x2208.jpg/392x696bb.jpg",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/59/16/6e/59166e4a-5d6e-3adc-8aa6-97056484384a/bdddd87d-a01b-4d0a-9ef5-56f95815f82c__U7ad6_U72484_1242x2208.jpg/392x696bb.jpg"
            ],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/49/c1/41/49c1411f-eb1c-3ab6-321f-a87a0af75ef4/AppIcon-0-0-1x_U007emarketing-0-9-0-85-220.png/60x60bb.jpg",
            trackName: "픽셀 히어로",
            trackId: 1670875186,
            price: 0.0,
            averageUserRating: 4.59128,
            userRatingCount: 23767
        )
    ]
}
