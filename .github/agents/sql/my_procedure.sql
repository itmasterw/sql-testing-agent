CREATE PROCEDURE [dbo].[Get_MajorAcount]
--@MaAcct As bit
AS

--Declare @MaAcct As Bit = 1
BEGIN

;With CteChecks ([Cust Name],[Major Acount]) 
As
(
SELECT TOP 30 
       [Cust Name],
      [Major Acount]
  FROM [North2].[dbo].[tblCust]
)
SELECT TOP 1000 tc.[Cust Name]
      ,[Address]
      ,[city]
      ,[state]
      ,[Zip]
      ,tc.[CustID],
	  Case ck.[Major Acount] WHEN 1 THEN 'Yes'
	                         WHEN 0 THEN 'No'
							 ELSE 'Both' 
      END AS "Major Acount Exps",
      tc.[Major Acount]  
  FROM [North2].[dbo].[tblCust] tc
  INNER JOIN CteChecks ck
  ON tc.[Cust Name] = ck.[Cust Name]
 WHERE (ck.[Major Acount] IN(@MaAcct))
   
  END


GO
