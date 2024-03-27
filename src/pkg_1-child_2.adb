package body Pkg_1.Child_2 is

   ----------------
   -- Init_C_2_T --
   ----------------

   procedure Init_C_2_T (Self : in out C_2_T; C_2_Param : Integer) is
   begin
      Self.C_2 := C_2_Param;
   end Init_C_2_T;

end Pkg_1.Child_2;
