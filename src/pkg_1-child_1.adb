package body Pkg_1.Child_1 is

   ----------------
   -- Init_C_1_T --
   ----------------

   procedure Init_C_1_T (Self : in out C_1_T; C_1_Param : Integer) is
   begin
      Self.C_1 := C_1_Param;
   end Init_C_1_T;

end Pkg_1.Child_1;
