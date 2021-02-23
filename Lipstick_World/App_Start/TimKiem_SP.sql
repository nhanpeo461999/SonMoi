Create proc spSanPham
@term nvarchar(50)
as
Begin
    Select TenSP from San_Pham where TenSP like '%' + @term + '%'
End