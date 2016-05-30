--���ݿ��ʼ���ű�

--�������ݿ�
create database seckill;
--ʹ�����ݿ�
use seckill;
--������ɱ����
create table seckill(
 `seckill_id`  bigint NOT NULL AUTO_INCREMENT COMMENT '��Ʒ���id',
 `name`  varchar(120) NOT NULL COMMENT '��Ʒ����',
 `number` int NOT NULL COMMENT '�������',
 `start_time` timestamp NOT NULL COMMENT '��ɱ��ʼʱ��',
 `end_time` timestamp NOT NULL COMMENT '��ɱ����ʱ��',
 `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
 PRIMARY KEY (seckill_id),
 key idx_start_time(start_time),
 key idx_end_time(end_time),
 key idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='��ɱ����';

--��ʼ������
insert into 
    seckill(name,number,start_time,end_time) 
values
    ('1000Ԫ��ɱip6',100,'2015-11-01 00:00:00','2015-11-02 00:00:00'),
    ('200Ԫ��ɱipad2',200,'2015-11-01 00:00:00','2015-11-02 00:00:00'),
    ('500Ԫ��ɱС��4',300,'2015-11-01 00:00:00','2015-11-02 00:00:00'),
    ('300Ԫ��ɱ����note',400,'2015-11-01 00:00:00','2015-11-02 00:00:00');
    
--��ɱ�ɹ���ϸ��
--�û���½��֤��ص���Ϣ
 
create table success_killed(
	`seckill_id` BIGINT NOT NULL COMMENT '��ɱ��Ʒid',
	`user_phone` BIGINT NOT NULL COMMENT '�û��ֻ���',
	`state` tinyint NOT NULL DEFAULT -1 COMMENT '״̬��ʾ��-1��Ч��0�ɹ���1�Ѹ��2�ѷ��������ջ�',
	`create_time` timestamp NOT NULL COMMENT '����ʱ��',
	PRIMARY KEY(seckill_id,user_phone),/*��������*/
	key idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɱ�ɹ���ϸ��';


--�������ݿ����̨
mysql -uroot -proot