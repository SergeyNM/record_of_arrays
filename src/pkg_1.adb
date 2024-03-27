with Pkg_1.Child_1;
with Pkg_1.Child_2;

package body Pkg_1 is

   --  function Make_P_1_T (P_1_Param, C_1_Param, C_2_Param : Integer) return P_1_T is
   --     Temp_P_1_T : P_1_T :=
   --      (P_1 => P_1_Param,
   --       C_1 => Child_1.Make_C_1_T (C_1_Param => C_1_Param)'Access,
   --       C_2 => Child_2.Make_C_2_T (C_2_Param => C_2_Param)'Access);
   --  begin
   --     return Temp_P_1_T;
   --  end Make_P_1_T;

   procedure Init_P_1_T (Self : in out P_1_T; P_1_Param, C_1_Param, C_2_Param : Integer)
   is
   begin
      Self.P_1 := P_1_Param;
      Self.C_1.Init_C_1_T (C_1_Param);
      Self.C_2.Init_C_2_T (C_2_Param);
   end Init_P_1_T;

   -------------
   -- Get_C_1 --
   -------------

   function Get_C_1 (Self : P_1_T) return Child_1.C_1_T is
   begin
      return Self.C_1.all;
   end Get_C_1;

   procedure Set_C_1 (Self : in out P_1_T; Value : Child_1.C_1_T) is
   begin
      Self.C_1.all := Value;
   end Set_C_1;

   -------------
   -- Get_C_2 --
   -------------

   function Get_C_2 (Self : P_1_T) return Child_2.C_2_T is
   begin
      return Self.C_2.all;
   end Get_C_2;

   procedure Set_C_2 (Self : in out P_1_T; Value : Child_2.C_2_T) is
   begin
      Self.C_2.all := Value;
   end Set_C_2;

end Pkg_1;
