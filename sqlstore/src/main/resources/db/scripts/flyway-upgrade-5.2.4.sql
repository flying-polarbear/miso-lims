-- This script must be run when upgrading from Flyway version 3.2.1 to 5.2.4
-- due to enforcement of SQL comment syntax and changed checksum method

RENAME TABLE schema_version TO flyway_schema_history;
ALTER TABLE flyway_schema_history DROP COLUMN version_rank;

UPDATE flyway_schema_history SET checksum =  '-641246264' WHERE version = '0001' AND checksum = '68049289';
UPDATE flyway_schema_history SET checksum =  '345627387' WHERE version = '0002' AND checksum = '918021264';
UPDATE flyway_schema_history SET checksum =  '203044836' WHERE version = '0003' AND checksum = '1973840476';
UPDATE flyway_schema_history SET checksum =  '-611709414' WHERE version = '0004' AND checksum = '1318021893';
UPDATE flyway_schema_history SET checksum =  '-2083735627' WHERE version = '0005' AND checksum = '-1990226649';
UPDATE flyway_schema_history SET checksum =  '-2058878346' WHERE version = '0009' AND checksum = '193995217';
UPDATE flyway_schema_history SET checksum =  '-8103528' WHERE version = '0010' AND checksum = '740584588';
UPDATE flyway_schema_history SET checksum =  '-1888132891' WHERE version = '0011' AND checksum = '-499620604';
UPDATE flyway_schema_history SET checksum =  '1537469732' WHERE version = '0012' AND checksum = '-916359825';
UPDATE flyway_schema_history SET checksum =  '1695710476' WHERE version = '0013' AND checksum = '-2032284664';
UPDATE flyway_schema_history SET checksum =  '-810894560' WHERE version = '0014' AND checksum = '-548833076';
UPDATE flyway_schema_history SET checksum =  '-2008706205' WHERE version = '0015' AND checksum = '181281887';
UPDATE flyway_schema_history SET checksum =  '189158770' WHERE version = '0016' AND checksum = '1473452482';
UPDATE flyway_schema_history SET checksum =  '1196783209' WHERE version = '0017' AND checksum = '-1198753346';
UPDATE flyway_schema_history SET checksum =  '-71064219' WHERE version = '0018' AND checksum = '1407347512';
UPDATE flyway_schema_history SET checksum =  '124600818' WHERE version = '0019' AND checksum = '-2036716741';
UPDATE flyway_schema_history SET checksum =  '-1035867600' WHERE version = '0020' AND checksum = '1914706211';
UPDATE flyway_schema_history SET checksum =  '888426668' WHERE version = '0021' AND checksum = '-1507075943';
UPDATE flyway_schema_history SET checksum =  '1905382513' WHERE version = '0022' AND checksum = '1102723374';
UPDATE flyway_schema_history SET checksum =  '636381829' WHERE version = '0023' AND checksum = '1353001722';
UPDATE flyway_schema_history SET checksum =  '-738546865' WHERE version = '0024' AND checksum = '1624940875';
UPDATE flyway_schema_history SET checksum =  '-429929585' WHERE version = '0025' AND checksum = '1328990185';
UPDATE flyway_schema_history SET checksum =  '-2020174709' WHERE version = '0026' AND checksum = '1145855527';
UPDATE flyway_schema_history SET checksum =  '-1811770234' WHERE version = '0027' AND checksum = '915939858';
UPDATE flyway_schema_history SET checksum =  '-1345685002' WHERE version = '0028' AND checksum = '-1101059539';
UPDATE flyway_schema_history SET checksum =  '-2128875715' WHERE version = '0029' AND checksum = '-1184852118';
UPDATE flyway_schema_history SET checksum =  '25390276' WHERE version = '0030' AND checksum = '-636025407';
UPDATE flyway_schema_history SET checksum =  '-911939250' WHERE version = '0031' AND checksum = '-172625885';
UPDATE flyway_schema_history SET checksum =  '-1016231424' WHERE version = '0032' AND checksum = '-1727079657';
UPDATE flyway_schema_history SET checksum =  '-1607115820' WHERE version = '0033' AND checksum = '-2080753716';
UPDATE flyway_schema_history SET checksum =  '1439849896' WHERE version = '0034' AND checksum = '2087939801';
UPDATE flyway_schema_history SET checksum =  '428264834' WHERE version = '0035' AND checksum = '-1216131543';
UPDATE flyway_schema_history SET checksum =  '-1410000920' WHERE version = '0036' AND checksum = '-2045119694';
UPDATE flyway_schema_history SET checksum =  '367009303' WHERE version = '0037' AND checksum = '-1324260534';
UPDATE flyway_schema_history SET checksum =  '-645247331' WHERE version = '0040' AND checksum = '-1779838021';
UPDATE flyway_schema_history SET checksum =  '1232874545' WHERE version = '0050' AND checksum = '1060284586';
UPDATE flyway_schema_history SET checksum =  '-1301507539' WHERE version = '0060' AND checksum = '1578857733';
UPDATE flyway_schema_history SET checksum =  '-396527119' WHERE version = '0070' AND checksum = '1941769430';
UPDATE flyway_schema_history SET checksum =  '554848362' WHERE version = '0080' AND checksum = '2088314988';
UPDATE flyway_schema_history SET checksum =  '-1815293537' WHERE version = '0090' AND checksum = '674676981';
UPDATE flyway_schema_history SET checksum =  '850037390' WHERE version = '0100' AND checksum = '-1004966705';
UPDATE flyway_schema_history SET checksum =  '-1049496165' WHERE version = '0110' AND checksum = '-1574139657';
UPDATE flyway_schema_history SET checksum =  '1166143582' WHERE version = '0120' AND checksum = '-209722790';
UPDATE flyway_schema_history SET checksum =  '-2115257708' WHERE version = '0130' AND checksum = '-636036117';
UPDATE flyway_schema_history SET checksum =  '163202824' WHERE version = '0140' AND checksum = '967384014';
UPDATE flyway_schema_history SET checksum =  '1637262896' WHERE version = '0150' AND checksum = '-1209810357';
UPDATE flyway_schema_history SET checksum =  '-1893193214' WHERE version = '0160' AND checksum = '151215568';
UPDATE flyway_schema_history SET checksum =  '1894569658' WHERE version = '0170' AND checksum = '402892850';
UPDATE flyway_schema_history SET checksum =  '-1697033881' WHERE version = '0180' AND checksum = '345352465';
UPDATE flyway_schema_history SET checksum =  '-929454658' WHERE version = '0190' AND checksum = '-490212215';
UPDATE flyway_schema_history SET checksum =  '2114932678' WHERE version = '0200' AND checksum = '1783274734';
UPDATE flyway_schema_history SET checksum =  '1635598577' WHERE version = '0210' AND checksum = '1842388832';
UPDATE flyway_schema_history SET checksum =  '-1627917997' WHERE version = '0220' AND checksum = '-1991861834';
UPDATE flyway_schema_history SET checksum =  '559936597' WHERE version = '0230' AND checksum = '1021417152';
UPDATE flyway_schema_history SET checksum =  '253477927' WHERE version = '0240' AND checksum = '-640802383';
UPDATE flyway_schema_history SET checksum =  '1641078006' WHERE version = '0250' AND checksum = '2025365592';
UPDATE flyway_schema_history SET checksum =  NULL WHERE version = '0251' AND checksum = 'NULL';
UPDATE flyway_schema_history SET checksum =  '-1653983137' WHERE version = '0260' AND checksum = '-1045346909';
UPDATE flyway_schema_history SET checksum =  '-2007942955' WHERE version = '0270' AND checksum = '-74045544';
UPDATE flyway_schema_history SET checksum =  '1908011467' WHERE version = '0280' AND checksum = '1946930069';
UPDATE flyway_schema_history SET checksum =  '2053396137' WHERE version = '0290' AND checksum = '-1332210640';
UPDATE flyway_schema_history SET checksum =  '818072513' WHERE version = '0300' AND checksum = '-168913902';
UPDATE flyway_schema_history SET checksum =  '358239481' WHERE version = '0310' AND checksum = '-1864300167';
UPDATE flyway_schema_history SET checksum =  '-484724217' WHERE version = '0320' AND checksum = '1887511837';
UPDATE flyway_schema_history SET checksum =  '103141336' WHERE version = '0330' AND checksum = '264562715';
UPDATE flyway_schema_history SET checksum =  '-1654853698' WHERE version = '0340' AND checksum = '-619241198';
UPDATE flyway_schema_history SET checksum =  '-682189694' WHERE version = '0350' AND checksum = '-1541514801';
UPDATE flyway_schema_history SET checksum =  '-474539804' WHERE version = '0360' AND checksum = '-1203845420';
UPDATE flyway_schema_history SET checksum =  '-1651556087' WHERE version = '0370' AND checksum = '1361368487';
UPDATE flyway_schema_history SET checksum =  '-1029210576' WHERE version = '0380' AND checksum = '-2055592168';
UPDATE flyway_schema_history SET checksum =  '-349714994' WHERE version = '0390' AND checksum = '-615902616';
UPDATE flyway_schema_history SET checksum =  '263035632' WHERE version = '0400' AND checksum = '-1375234105';
UPDATE flyway_schema_history SET checksum =  '-2035639814' WHERE version = '0410' AND checksum = '901162948';
UPDATE flyway_schema_history SET checksum =  '-1225087836' WHERE version = '0420' AND checksum = '-7516423';
UPDATE flyway_schema_history SET checksum =  '-894383517' WHERE version = '0430' AND checksum = '-201211659';
UPDATE flyway_schema_history SET checksum =  '836177828' WHERE version = '0440' AND checksum = '-200195761';
UPDATE flyway_schema_history SET checksum =  '1935983309' WHERE version = '0450' AND checksum = '-1363142241';
UPDATE flyway_schema_history SET checksum =  '-1091941904' WHERE version = '0460' AND checksum = '402710570';
UPDATE flyway_schema_history SET checksum =  '-1037138931' WHERE version = '0470' AND checksum = '-1707272236';
UPDATE flyway_schema_history SET checksum =  '-581883176' WHERE version = '0480' AND checksum = '1533181625';
UPDATE flyway_schema_history SET checksum =  '804956433' WHERE version = '0490' AND checksum = '906852527';
UPDATE flyway_schema_history SET checksum =  '-1092732846' WHERE version = '0500' AND checksum = '-988224433';
UPDATE flyway_schema_history SET checksum =  '409364962' WHERE version = '0510' AND checksum = '1974627207';
UPDATE flyway_schema_history SET checksum =  '-456445127' WHERE version = '0520' AND checksum = '1058195320';
UPDATE flyway_schema_history SET checksum =  '1524927881' WHERE version = '0530' AND checksum = '-1617674622';
UPDATE flyway_schema_history SET checksum =  '-505273861' WHERE version = '0540' AND checksum = '1754119173';
UPDATE flyway_schema_history SET checksum =  '-159940084' WHERE version = '0550' AND checksum = '-2090277653';
UPDATE flyway_schema_history SET checksum =  '487214119' WHERE version = '0560' AND checksum = '558532412';
UPDATE flyway_schema_history SET checksum =  '11485049' WHERE version = '0570' AND checksum = '2140114576';
UPDATE flyway_schema_history SET checksum =  '555788663' WHERE version = '0580' AND checksum = '-525061964';
UPDATE flyway_schema_history SET checksum =  '1977652476' WHERE version = '0590' AND checksum = '-500269761';
UPDATE flyway_schema_history SET checksum =  '1238560014' WHERE version = '0600' AND checksum = '-387295172';
UPDATE flyway_schema_history SET checksum =  '-439809651' WHERE version = '0610' AND checksum = '408732202';
UPDATE flyway_schema_history SET checksum =  NULL WHERE version = '0611' AND checksum = 'NULL';
UPDATE flyway_schema_history SET checksum =  '1823540411' WHERE version = '0620' AND checksum = '987465534';
UPDATE flyway_schema_history SET checksum =  '1572274234' WHERE version = '0630' AND checksum = '659180750';
UPDATE flyway_schema_history SET checksum =  '19134098' WHERE version = '0640' AND checksum = '1470931797';
UPDATE flyway_schema_history SET checksum =  '63901428' WHERE version = '0650' AND checksum = '1896083917';
UPDATE flyway_schema_history SET checksum =  '-1115469337' WHERE version = '0660' AND checksum = '2041156669';
UPDATE flyway_schema_history SET checksum =  '-5013801' WHERE version = '0670' AND checksum = '1550592849';
UPDATE flyway_schema_history SET checksum =  '-1624303916' WHERE version = '0680' AND checksum = '1492730595';
UPDATE flyway_schema_history SET checksum =  '618765666' WHERE version = '0690' AND checksum = '-1451671609';
UPDATE flyway_schema_history SET checksum =  '-1462233367' WHERE version = '0700' AND checksum = '-1203819470';
UPDATE flyway_schema_history SET checksum =  '-1908523395' WHERE version = '0710' AND checksum = '-1387914700';
UPDATE flyway_schema_history SET checksum =  '106866713' WHERE version = '0720' AND checksum = '1852548286';
UPDATE flyway_schema_history SET checksum =  '-1905703139' WHERE version = '0730' AND checksum = '-41022767';
UPDATE flyway_schema_history SET checksum =  '712721606' WHERE version = '0740' AND checksum = '-768583437';
UPDATE flyway_schema_history SET checksum =  '-1666050825' WHERE version = '0750' AND checksum = '1477239163';
UPDATE flyway_schema_history SET checksum =  '-1645390747' WHERE version = '0760' AND checksum = '1803601792';
UPDATE flyway_schema_history SET checksum =  '1093149747' WHERE version = '0770' AND checksum = '1091782584';
UPDATE flyway_schema_history SET checksum =  '1824749778' WHERE version = '0780' AND checksum = '1775313938';
UPDATE flyway_schema_history SET checksum =  '-2125970421' WHERE version = '0790' AND checksum = '-1570140071';
UPDATE flyway_schema_history SET checksum =  '-1786810864' WHERE version = '0800' AND checksum = '-598008793';
UPDATE flyway_schema_history SET checksum =  '-545825570' WHERE version = '0810' AND checksum = '1734468778';
UPDATE flyway_schema_history SET checksum =  '-1328989476' WHERE version = '0820' AND checksum = '201146762';

