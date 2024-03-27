limited with Pkg_1.Child_1;
limited with Pkg_1.Child_2;

package Pkg_1 is

   type P_1_T is tagged private;

   --  function Make_P_1_T (P_1_Param, C_1_Param, C_2_Param : Integer) return P_1_T;
   procedure Init_P_1_T (Self : in out P_1_T; P_1_Param, C_1_Param, C_2_Param : Integer);

   function Get_C_1 (Self : P_1_T) return Child_1.C_1_T;
   procedure Set_C_1 (Self : in out P_1_T; Value : Child_1.C_1_T);
   function Get_C_2 (Self : P_1_T) return Child_2.C_2_T;
   procedure Set_C_2 (Self : in out P_1_T; Value : Child_2.C_2_T);

private

   type P_1_T is tagged record
      P_1 : Integer;
      C_1 : access Child_1.C_1_T;
      C_2 : access Child_2.C_2_T;
   end record;

end Pkg_1;
