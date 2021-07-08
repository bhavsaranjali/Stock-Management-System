
Create Procedure GetProductDet  
(  
@user_no varchar(50)    
)  
as  
begin  
Select Username from User_login where User_no=@user_no  
End   