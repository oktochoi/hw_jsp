-- 파일 업로드 및 부가 기능을 위한 DB 테이블 수정
-- Walab DB 서버에 적용할 SQL 스크립트

-- 1. 파일 업로드를 위한 필드 추가
ALTER TABLE board 
ADD COLUMN filename VARCHAR(255) NULL COMMENT '업로드된 파일명',
ADD COLUMN filepath VARCHAR(500) NULL COMMENT '파일 저장 경로';

-- 2. 조회수 필드 추가
ALTER TABLE board 
ADD COLUMN viewcount INT DEFAULT 0 COMMENT '조회수';

-- 변경사항 확인
-- DESC board;


