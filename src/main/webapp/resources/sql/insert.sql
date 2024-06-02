INSERT INTO game VALUES('AE0001', '에이몽어스', 5000, 'OuttererSloth', '죽기 싫다면 찾아라, 그리고 너는 숨어라!', 'Unique Games','추리', '2018/06/15', 'AE0001.png', 0, 0, '살다살다 이렇게 재밌는 게임은 처음봤어요!!');
	
INSERT INTO game VALUES('LI0001', '리브바이데이라이트', 10000, '비긴헤이비어', '끝까지 도망쳐라, 그렇다면 살아남을 것이다!', '증기', '공포', '2016/06/14', 'LI0001.jpg', 0, 0, '찬구끼리는 하고 싶지만 가족끼리는 하기 싫은 게임.');
	
INSERT INTO game VALUES('MO0001', '나만의 마블', 2000, '엠투플레이', '나만을 마블 나만 해', '인터넷마블', '오락', '2013/06/09', 'MO0001.jpg', 0, 0, '와...');
	
INSERT INTO game VALUES('SU001', '서든방어', 0, '녹슨지티', '아이고~ 깜짝이야!', '돈슨', '슈팅', '2005/04/11', 'SU001.jpg', 0, 0, '추억을 떠오르게 하는 향수를 불러 일으키는 게임');

desc game;
SELECT * FROM GAME;

drop table game;

DELETE FROM game WHERE g_name = '웹서버프로그래밍';