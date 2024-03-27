--  with Pkg_1.Child_2;

--  private
package Pkg_1.Child_1 is

   type C_1_T is tagged private;
   --  function Make_C_1_T (C_1_Param : Integer) return C_1_T;
   procedure Init_C_1_T (Self : in out C_1_T; C_1_Param : Integer);

private

   type C_1_T is tagged record
      C_1 : Integer;
      C_1_2 : Integer;
      --  C_2 : access Child_2.C_2_T;
   end record;

end Pkg_1.Child_1;
