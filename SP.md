# 새로 추가할 기능

> ## 구매시 결제 기능 추가

> > ### 물품 구매 테이블[Sale_Table]

> > > #### Sale 테이블에 데이터 삽입 전, 간의 결제 팝업을 띄워 결제가 완료되면 구매.

---

> ## 한정 상품 추첨 기능 추가

[Nike SNKRS](https://www.nike.com/kr/launch/?type=feed)

> > 응모 테이블[Draw]

| Draw          | 추첨           |
| ------------- | -------------- |
| draw_code     | 추첨 코드      |
| date          | 시작일         |
| entryPeriod   | 참여 기간      |
| maxWinner     | 최대 당첨 인원 |
| entryMemberId | 참여자 정보    |
| item          | 추첨 상품      |
| result        | 당첨 결과 여부 |

> > > ### 참여자 id로 조회한 메일로 결과 발송
