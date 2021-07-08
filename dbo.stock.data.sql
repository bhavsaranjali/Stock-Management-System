create Procedure GetPDet(
@model Varchar(50)
)
as  
begin  
Select Warrenty,Price from Battery where Model_No=@model  
End  
