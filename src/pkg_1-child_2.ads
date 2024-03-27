--  with Pkg_1.Child_1;

--  private
package Pkg_1.Child_2 is

   type C_2_T is tagged private;
   --  function Make_C_2_T (C_2_Param : Integer) return C_2_T;
   procedure Init_C_2_T (Self : in out C_2_T; C_2_Param : Integer);

private

   type C_2_T is tagged record
      C_2 : Integer;
      --  C_1 : access Child_1.C_1_T;
   end record;

end Pkg_1.Child_2;
