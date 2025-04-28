//
//  SearchDetail.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import Foundation

struct SearchDetail: Decodable, Sendable {
    let artworkUrl100: String
    let screenshotUrls: [String]
    let trackName: String
    let contentAdvisoryRating: String
    let price: Double?
    let currentVersionReleaseDate: String?
    let releaseNotes: String?
    let version: String
    let description: String
    let genres: [String]
    let minimumOsVersion: String
    let sellerName: String
}

extension SearchDetail {
    static let mock: SearchDetail = SearchDetail(
        artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/83/5a/c6/835ac6cc-6077-d54f-4e4c-798e02cbf521/AppIcon_real-0-0-1x_U007ephone-0-1-0-85-220.png/100x100bb.jpg",
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
        trackName: "카카오뱅크",
        contentAdvisoryRating: "4+",
        price: 0.0,
        currentVersionReleaseDate: "2025-04-16T02:02:54Z",
        releaseNotes: "● '주택담보대출 비교하기' 서비스를 추가했어요(4월 오픈 예정).\n- 카카오뱅크와 제휴사의 대출 상품 금리와 한도를 한 번에 비교할 수 있어요.\n- 더욱 편리한 서비스 제공을 위해 기능 개선 및 불편 사항 해소 작업도 함께 진행했어요.",
        version: "2.47.1",
        description: """
        금융을 바꾸다 생활을 바꾸다
        제1금융권 은행, 카카오뱅크

        ■ 대한민국 대표 인터넷은행
        • 365일 언제나 지점 방문 없이 모든 은행 업무를 모바일에서
        • 계좌번호를 몰라도 카카오톡 친구에게 손쉬운 이체

        ■ 눈에 바로 보이는 혜택
        • 복잡한 가입 조건이나 우대 조건 없이, 누구에게나 경쟁력 있는 금리 제공
        • 혜택탭에서 매일 미션 달성하고 통장으로 바로 받는 캐시백

        ■ 함께 쓰고 같이 보는 통장
        • 카카오톡 친구들을 손쉽게 모임 멤버로 초대
        • 잔액과 입출금 현황을 모임 멤버들과 실시간으로 공유
        • 모임 전용 체크카드로 더욱 크게 누리는 혜택

        ■ 천원부터 시작하는 26주간의 도전
        • 26주 동안 매주 차곡차곡 쌓아가는 적금
        • 카카오프렌즈 응원과 함께하면 어느덧 만기 달성이 눈앞에!

        ■ 쓰는만큼 돌려받는 체크카드
        • 쓸 때마다 캐시백 받는 모두를 위한 체크카드
        • 사장님에게 필요한 혜택만 담은 사업자 전용 체크카드
        • 랜덤 캐시백으로 또다른 재미를 누리는 모임 전용 체크카드

        ■ 챗봇으로 쉽고 빠른 주택자금대출
        • 구입 자금부터 전월세 보증금, 갈아타기까지 간편하게 신청
        • 내 대출 조건에 맞는 금리와 한도를 한번에 조회
        • 번거로운 대출서류 준비 과정 없이 모바일로 쉽고 빠르게 제출

        ■ 간편하게 시작하는 투자 생활
        • 한 번에 비교하고 이용하는 증권사 주식계좌
        • 소액으로 시작하는 금융상품 투자
        • 환전 수수료 없이 쉽게 모으고 자유롭게 꺼내는 달러 투자

        ■ 파격적인 수수료로 해외송금
        • 365일 언제 어디서나 이용 가능한 해외송금(보내기 및 받기)
        • 해외계좌 및 웨스턴유니온(WU)을 통해 전 세계 200여 개국으로 해외송금 가능
        • 거래외국환은행 지정, 연장 업무도 모바일에서 신청 가능

        ■ 7세부터 시작하는 mini
        • 우리 아이 용돈 관리 mini로 편리하게
        • 결제와 티머니 충전이 모두 가능한 카드

        ■ 사장님에게 쉽고 편한 개인사업자 뱅킹
        • 간편한 사업용 통장 개설과 다양한 사업자 대출 상품
        • 꼭 필요한 혜택만 담은 사업자 전용 카드 제공
        • 세금 신고, 사업장 신용정보 조회 등 사업 필수 서비스 지원

        ■ 이체수수료 및 ATM 수수료 면제
        • 타행 이체 및 자동이체 수수료 면제
        • 국내 모든 ATM(은행, 제휴 VAN사 기기) 입금/출금/이체 수수료 면제

        * ATM/CD기 입금/출금/이체 수수료는 향후 정책에 따라 변경될 수 있습니다. 정책이 변경되는 경우 시행 1개월 전에 카카오뱅크 앱 및 홈페이지를 통해 미리 알려드립니다.

        ■ 고객센터 운영 시간 안내
        • 예/적금, 대출, 카드, 앱 문의 : 1599-3333 (평일 08:00 ~ 19:00)
        • 외환, 펀드 문의 : 1599-3333 (평일 09:00 ~ 18:00)
        • 전월세보증금 대출, 주택담보대출 문의 : 1599-8787 (평일 09:00 ~ 18:00)
        • 사고신고 : 1599-8888 (24시간 365일)

        ■ 챗봇 운영 시간 안내
        • 카카오톡 채널 "카카오뱅크 고객센터" (24시간 365일)
        • 챗봇 상담 및 상담원 채팅상담 지원

        ■ 카카오뱅크 앱 이용을 위한 권한 및 목적 안내
        • 카메라(선택) : 신분증 촬영 및 서류 제출, 영상통화, 프로필 사진 등록, 사진이체
        • 사진(선택) : 이체⁄송금⁄출금 확인증, 카드매출전표 저장
        • 위치(선택) : 부정가입방지 및 부정거래탐지
        • 건강(선택) : 매일 걷고 혜택 받기 걸음수 측정

        * 선택 접근권한은 동의하지 않아도 서비스를 이용하실 수 있습니다.
        """,
        genres: ["금융"],
        minimumOsVersion: "15.0",
        sellerName: "KakaoBank Corp."
    )
}
