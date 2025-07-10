package com.smhrd.web.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.web.entity.DataMember;
/**
 * jpa 사용시 대상이 되는 테이블 내부에 pk가 정수라면?
 *  <> => 제네릭 기법을 사용하기 때문에 정수 형태도 int 의 객체 형태인
 *   warpper class인 Integer로 사용해야함 / or Long 사용
 */
@Repository
public interface DataMemberRepository extends JpaRepository<DataMember, String> {
    
    // Hibernate 구현체를 사용하는 용도로 만든 도구
    // DB 연결과 관련된 기능을 구현하는 클래스

  
    /*
     *   hibernate가 메소드 명칭을 보고 -> sql 구문을 제작
     *  기본적으로 제공되는 메소드
     *  1. find() >> 조회할 때 사용
     *  : SELECT * FROM datamember;
     *  2.findById(String id) >> PK기준으로 로 조회할 때 사용
     * ===== 여러개 단어를 하나로 작성할 때 반드시 카멜식 기법을 따라야 한다 =====
     *  3.save(Datamember m) 
     *  : 데이터를 추가할때 사용 (insert 구문) / 데이터를 수정 할 때도 사용 (update)
     *  ====== id 가 null 이면 insert, id가 있으면 update ======
     *  4. deleteById(String id)
     *  : 삭제 할때 사용
    */


    // 나만의 커스터 마이징 하는 기능을 만들고 싶다면?
    // ->> JPA 규칙을 지켜주자
    // find.... select 구문 동작 >> ... 컬럼이름들이 들어올 수 있음
    // By : 조건을 부여하겠다
    // 테이블의 컬럼이들을 카멜 식으로 표현 (And, Or, Between a And b 등등)
    // 조건절에 들어오는 매개변수의 이름은 반드시 테이블의 컬럼명과 일치해야 한다
    // ex1) id와 pw 가 일치한 데이터를 조회
    // ID >> PK이다, 서로 매개변수와 이름이 같아야 한다
    public DataMember findByIdAndPw(String id, String pw);

    // 회원가입
    public DataMember save(DataMember member);
    
    
}
