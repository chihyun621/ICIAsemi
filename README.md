# **전자결재 시스템(JSP기반)**
**개요**

웹으로 사용 할 수 있는 전자결재 시스템을 간단히 구현해보았습니다. 

첫 개인 프로젝트이기에 많이 부족했습니다.

작업기간: 2021.04.12 ~ 2021.04.18(7일)

투입인원: 개인

개발도구:
- 언어 - JAVA 
- IDE 도구 - Eclipse
- DB - Oracle
- 웹서버 – Apache Tomcat 8.0


**공통기능**
---
1. 페이징(검색,정렬,다음페이지,이전페이지)
2. CRUD기능

---
**전자결제 홈**
---
![전자결재 홈](https://user-images.githubusercontent.com/72686897/126278279-3cd41497-6848-4c7a-894b-6bbe5ac5bb6f.png)

**직원**
---
**직원 List**
![전자결재 직원목록](https://user-images.githubusercontent.com/72686897/126278344-c6021d51-865d-4895-b2cf-b0e40fec917b.png)

  * Handlebars를 이용하여 List 출력

**직원 Insert**
![전자결재 직원추가](https://user-images.githubusercontent.com/72686897/126279052-850ff71a-8cbc-4412-8714-130eaec0fe94.png)

**직원 Read,Update,Delete**
![전자결재 직원정보](https://user-images.githubusercontent.com/72686897/126279078-647c1638-dec5-4f5e-9f49-dd1d1a05ee99.png)

---
**기안**
---
**기안 List**
![전자결재 기안목록](https://user-images.githubusercontent.com/72686897/126279761-b0af1232-a854-4ed3-a408-adbb43157669.png)
  
  * Handlebars를 이용하여 List 출력
  * Handlebars registerHelper를 이용하여 상태 표시

**기안 Insert**
![전자결재 기안작성](https://user-images.githubusercontent.com/72686897/126279794-ef49c613-d84c-411e-a08c-663303c2cf5a.png)

**기안 Read,Update,Delete**
![전자결재 기안상세보기](https://user-images.githubusercontent.com/72686897/126279812-afccd013-1225-4e59-9f39-93a3d463f5a1.png)
