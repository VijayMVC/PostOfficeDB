/* Add mail */
CREATE OR REPLACE PROCEDURE ClerkAddMail(pRegistration IN VARCHAR2, pPostalCode IN VARCHAR2, pReturnAddress IN VARCHAR2,
pDeliveryAddress IN VARCHAR2, pWeight IN NUMBER, pTotalPostage IN NUMBER, pSender IN VARCHAR2, pReceiver IN VARCHAR2) AS
BEGIN
  INSERT INTO MAIL VALUES (MailIdSequence.NEXTVAL, pRegistration, pPostalCode, pReturnAddress, pDeliveryAddress, 2, 2, NULL, pSender, pReceiver, NULL, NULL);
END;
 
 
EXECUTE ClerkAddMail('registered', '90872', 'none', 'none', 7, 9, 'john doe', 'joe doe');
 
/* Get shipping cost */
CREATE OR REPLACE FUNCTION CalculateTotalCost(tempMailId IN VARCHAR2) RETURN NUMBER
IS
TotalCost NUMBER(38,3);
TotalPostage NUMBER(38);
Weight NUMBER(38);
Fee NUMBER(38,3);
MailCountry VARCHAR2(64);
BEGIN
  SELECT weight, Country INTO Weight, MailCountry FROM mail WHERE mailId = tempMailId;
  SELECT price INTO Fee FROM price WHERE Country = mailCountry AND Weight BETWEEN MIN AND MAX;
  TotalCost := (Weight + Fee);
  RETURN TotalCost;
END;
 
CREATE OR REPLACE PROCEDURE TESTCALC AS
TotalCost NUMBER(38,3);
BEGIN
   TotalCost := CalculateTotalCost('M1');
   DBMS_OUTPUT.PUT_LINE('Total Cost: ' || TotalCost);
END;
 
EXECUTE TESTCALC;
 
 
CREATE OR REPLACE PROCEDURE GetMailByRoute(pRouteID IN varchar2, csr OUT SYS_REFCURSOR) AS
BEGIN
 OPEN csr FOR
  SELECT mailid, deliveryaddress, returnAddress, senderName, receiverName, weight FROM mail
  JOIN postalcode USING(postalcode)
  WHERE routeId = pRouteID;
  --close csr;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No Mail for this route '||pRouteId);
END;
 
 
CREATE OR REPLACE FUNCTION GetMailByRouteTest(pCode IN VARCHAR) RETURN sys_refcursor
 AS
 rc sys_refcursor;
 BEGIN
 GetMailByRoute(pCode,rc);
 RETURN rc;
 END;      
SELECT GetMailByRouteTest('R1') FROM dual;
 
CREATE OR REPLACE PROCEDURE GetMailByPostalCode(pCode IN varchar2, csr OUT SYS_REFCURSOR) AS
BEGIN
--carriers view the mailroute and truck are assigned to
  dbms_output.put_line('ALL mail for PostalCode '||pCode);
 OPEN csr FOR
  SELECT mailid, deliveryaddress, returnAddress, senderName, receiverName, weight FROM mail
  WHERE postalcode = pCode;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No Mail for this postalcode '||pCode);
END;
 
CREATE OR REPLACE FUNCTION GetMailByPostalTest(pCode IN VARCHAR) RETURN sys_refcursor
 AS
 rc sys_refcursor;
 BEGIN
 GetMailByPostalCode(pCode,rc);
 RETURN rc;
 END;      
SELECT GetMailByPostalTest('H4J 1W2') FROM dual;
 
 
CREATE OR REPLACE PROCEDURE GetMailBySenderName(pSender IN varchar2, csr OUT SYS_REFCURSOR) AS
BEGIN
 OPEN csr FOR
  SELECT mailid, deliveryaddress, returnAddress, senderName, receiverName, weight FROM mail
  WHERE senderName = pSender;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No Mail for this sender '||pSender);
END;
 
CREATE OR REPLACE PROCEDURE GetMailByReceiverName(pReceiver IN varchar2, csr OUT SYS_REFCURSOR) AS
BEGIN
 OPEN csr FOR
  SELECT mailid, deliveryaddress, returnAddress, senderName, receiverName, weight FROM mail
  WHERE receiverName = pReceiver;
  close csr;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No Mail for this receiver '||pReceiver);
END;
 
