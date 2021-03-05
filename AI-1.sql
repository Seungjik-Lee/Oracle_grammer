--Length, Lengthb, concat
--
--(LENGTH 는 문자열의 길이를 LENGTHB는 문자열에 할당된 BYTE 수를 반환)
SELECT LENGTH('한글'), LENGTH('AB'), LENGTHB('한글'),LENGTHB('AB') FROM DUAL;

--(CONCAT(문자열1, 문자열2) 또는 || 는 문자열을 이어준다)
SELECT CONCAT('이것이', 'Oracle이다'), '이것이' || 'Oracle이다' FROM DUAL;



--Instr, Instrb
--
--(문자열이 시작하는 위치 반환)
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다', '이것') FROM DUAL;

SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다', '이것', 2) FROM DUAL;

--(문자열이 시작하는 위치를 BYTE단위로 세서 반환)
SELECT INSTRB('이것이 Oracle이다. 이것도 오라클이다', '이것', 2) FROM DUAL;