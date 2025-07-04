CREATE TABLE log_Card( 
      PkData Integer,
      CardNumberFormatted Char(24),
      UserName Char(50),
      Email Char(64),
      Picture Blob
);

select PkData, CardNumberFormatted, UserName, Email, Picture from Card;
select top 1 PkData, CardNumberFormatted, UserName, Email, Picture from Card order by PkData desc;

/*CREATE or TRIGGER trg_insertCard ON Card AFTER INSERT 
BEGIN
	 INSERT INTO log_Card SELECT PkData, CardNumberFormatted, UserName, Email, Picture FROM __new; 
END;
DROP TRIGGER Card.trg_insertCard;*/

insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(79, '0000:22079', 'Nine User', 'nine@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(80, '0000:22080', 'Ten User', 'ten@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(82, '0000:22082', 'Tewlve User', 'twelve@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(86, '0000:22086', 'Sixteen User', 'sixteen@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(87, '0000:22087', 'Seventeen User', 'seventeen@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(88, '0000:22088', 'Eighteen User', 'eighteen@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(89, '0000:22089', 'Nineteen User', 'nineteen@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(90, '0000:22090', 'Twenty User', 'twenty@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(91, '0000:22091', 'Twenty-one User', 'twenty-one@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(92, '0000:22092', 'Twenty-two User', 'twenty-two@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(93, '0000:22093', 'Twenty-three User', 'twenty-three@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(94, '0000:22094', 'Twenty-four User', 'twenty-four@user.com');
insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(95, '0000:22095', 'Twenty-five User', 'twenty-five@user.com');

select PkData, CardNumberFormatted, UserName, Email, Picture from Card
select PkData, CardNumberFormatted, UserName, Email, Picture from log_Card

insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(97, '0000:22097', 'Twenty-seven User', 'twenty-seven@user.com');

select*from log_Card

insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(98, '0000:22098', 'Twenty-eight User', 'twenty-eight@user.com');

EXECUTE PROCEDURE sp_CreateEvent('evento_insert', 2);
/*CREATE TRIGGER card_insert on Card AFTER INSERT
BEGIN
	 EXECUTE PROCEDURE sp_SignalEvent('evento_insert', false, 0, ::stmt.TrigRowID);
END;*/
--DROP TRIGGER Card.card_insert;

insert into Card(PkData, CardNumberFormatted, UserName, Email) values
(99, '0000:22099', 'Twenty-nine User', 'twenty-nine@user.com');
select PkData, CardNumberFormatted, UserName, Email from Card where ROWID = 
( SELECT StringData FROM ( EXECUTE PROCEDURE sp_WaitForEvent( 'evento_insert', 0, 0, 0 )) Sig );
