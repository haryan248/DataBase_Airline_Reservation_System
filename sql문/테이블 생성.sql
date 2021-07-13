CREATE TABLE ��(
��id VARCHAR2(20) PRIMARY KEY,
���� VARCHAR2(10) NOT NULL,
���� VARCHAR2(20) NOT NULL,
��й�ȣ CHAR(30) NOT NULL,
���� NUMBER(5) NOT NULL,
��_��� VARCHAR2(10) NOT NULL,
���ϸ��� NUMBER(15) NOT NULL
);

CREATE TABLE ��_����ó( 
��id VARCHAR2 (20),
����ó VARCHAR2 (20),
CONSTRAINT PK_��_����ó PRIMARY KEY(��id,����ó),
CONSTRAINT FK_��ID FOREIGN KEY(��id) REFERENCES ��(��id)
);

CREATE TABLE �Խñ�(
�۹�ȣ NUMBER(10)PRIMARY KEY,
�۳��� VARCHAR2(40),
������ VARCHAR2(20) NOT NULL,
�ۼ����� VARCHAR2(20) NOT NULL,
��id VARCHAR2(20),
CONSTRAINT FK_�Խñ� FOREIGN KEY(��id) REFERENCES ��(��id)
);


CREATE TABLE ����(
����_��ȣ CHAR(15),
����_�̸� VARCHAR2(10),
CONSTRAINT PK_���� PRIMARY KEY(����_��ȣ)
);

CREATE TABLE ������(
������_�ڵ� VARCHAR2(10) NOT NULL,
����� VARCHAR2(20),
������ VARCHAR2(20),
���_��¥ CHAR(10),
����_��¥ CHAR(10) NOT NULL,
����_��ȣ CHAR(15) NOT NULL,
���_�ð� CHAR(10) NOT NULL,
����_�ð� CHAR(10) NOT NULL,
CONSTRAINT PK_������ PRIMARY KEY(������_�ڵ�),
CONSTRAINT FK_������1 FOREIGN KEY(����_��ȣ) REFERENCES ����(����_��ȣ),
CONSTRAINT CHK_dates CHECK(���_��¥=����_��¥),
CONSTRAINT CHK_TIME CHECK(���_�ð�<����_�ð�)
);

CREATE TABLE ����_���(
���id VARCHAR2(20),
������_�ڵ� VARCHAR2(20),
���ڳ�̼� number(20),
�����Ͻ��� number(20),
�۽�Ʈ�� number(20),
CONSTRAINT PK_����_��� PRIMARY KEY(���id,������_�ڵ�),
CONSTRAINT FK_����_��� FOREIGN KEY(������_�ڵ�) REFERENCES ������(������_�ڵ�)
);

CREATE TABLE ����(
����_��ȣ VARCHAR2(10) NOT NULL,
������_�ڵ� VARCHAR2(20) NOT NULL,
��id VARCHAR2(20) NOT NULL,
�¼���ȣ VARCHAR2(20) NOT NULL,
����_��¥ VARCHAR2(20) NOT NULL,
����_��ȣ NUMBER(20) NOT NULL UNIQUE,
CONSTRAINT PK_���� PRIMARY KEY(����_��ȣ, ������_�ڵ�, ��id),
CONSTRAINT FK_���� FOREIGN KEY(������_�ڵ�) REFERENCES ������(������_�ڵ�),
CONSTRAINT FK_����2 FOREIGN KEY(��id) REFERENCES ��(��id)
);

CREATE TABLE ȯ��(
ȯ��_����_�ڵ� VARCHAR2(20),
ȯ��_���� VARCHAR2(30),
CONSTRAINT PK_ȯ�� PRIMARY KEY(ȯ��_����_�ڵ�)
);

CREATE TABLE ȯ��_��û(
ȯ��_����_��ȣ VARCHAR2(20),
��id VARCHAR2(20),
ȯ��_����_�ڵ� VARCHAR2(20),
ȯ��_���� VARCHAR2(10),
CONSTRAINT PK_ȯ��_��û PRIMARY KEY(ȯ��_����_��ȣ, ��id, ȯ��_����_�ڵ�),
CONSTRAINT FK_ȯ��_��û1 FOREIGN KEY(��id) REFERENCES ��(��id),
CONSTRAINT FK_ȯ��_��û2 FOREIGN KEY(ȯ��_����_�ڵ�) REFERENCES ȯ��(ȯ��_����_�ڵ�)
);

CREATE TABLE �װ���(
�װ���id VARCHAR2(20),
�װ���_�̸� VARCHAR2(40),
�װ���_Ȩ������ VARCHAR2(40),
CONSTRAINT PK_�װ��� PRIMARY KEY(�װ���id)
);

CREATE TABLE �����(
�����_��ȣ CHAR(40),
�¼��� NUMBER(5) NOT NULL,
�װ���id VARCHAR2(40) NOT NULL,
CONSTRAINT PK_����� PRIMARY KEY(�����_��ȣ),
CONSTRAINT FK_����� FOREIGN KEY(�װ���id) REFERENCES �װ���(�װ���id),
CONSTRAINT CHK_�¼� CHECK(�¼���<=400),
CONSTRAINT CHK_������ȣ CHECK(�����_��ȣ LIKE '%-%')
);

CREATE TABLE ����(
������_�ڵ� VARCHAR2(20) NOT NULL,
�����_��ȣ CHAR (40) NOT NULL,
CONSTRAINT PK_���� PRIMARY KEY(������_�ڵ�, �����_��ȣ),
CONSTRAINT FK_����1 FOREIGN KEY(������_�ڵ�) REFERENCES ������(������_�ڵ�),
CONSTRAINT FK_����2 FOREIGN KEY(�����_��ȣ) REFERENCES �����(�����_��ȣ)
);

