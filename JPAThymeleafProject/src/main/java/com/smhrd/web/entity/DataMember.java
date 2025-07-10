package com.smhrd.web.entity;

import jakarta.persistence.Id;

import org.hibernate.annotations.ColumnDefault;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity // 엔티티 클래스임을 나타내는 annotation
@Table(name = "datamember") // DB 테이블 이름과 매핑 (선택 사항)
public class DataMember {
    // DB 테이블 자체를 의마하는 클래스

    // @Id : primary key 를 의미
    @Id // 제공하는 package가 persistence 여야함 다른패키지랑 헷갈리지 말것
    @Column(name = "id") // @Column : 해당하는 필드에 대응되는 테이블 컬럼의 디테일한 설정 가능
    private String id;
    @Column(name = "pw", nullable = false, length=100)
    private String pw;
    /** @ColumnDefault: DDL에서만 작동 (테이블 생성 시 DEFAULT 'USER') */
    @ColumnDefault("'users'")
    @Column(nullable = false, insertable = false)
    private String roles;

}
