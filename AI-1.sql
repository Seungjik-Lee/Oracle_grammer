--Length, Lengthb, concat
--
--(LENGTH �� ���ڿ��� ���̸� LENGTHB�� ���ڿ��� �Ҵ�� BYTE ���� ��ȯ)
SELECT LENGTH('�ѱ�'), LENGTH('AB'), LENGTHB('�ѱ�'),LENGTHB('AB') FROM DUAL;

--(CONCAT(���ڿ�1, ���ڿ�2) �Ǵ� || �� ���ڿ��� �̾��ش�)
SELECT CONCAT('�̰���', 'Oracle�̴�'), '�̰���' || 'Oracle�̴�' FROM DUAL;



--Instr, Instrb
--
--(���ڿ��� �����ϴ� ��ġ ��ȯ)
SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�') FROM DUAL;

SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2) FROM DUAL;

--(���ڿ��� �����ϴ� ��ġ�� BYTE������ ���� ��ȯ)
SELECT INSTRB('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2) FROM DUAL;