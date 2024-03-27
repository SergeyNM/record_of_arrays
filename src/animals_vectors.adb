with Animals_Vectors.Registries;

package body Animals_Vectors is

   ----------
   -- Make --
   ----------

   function Make
     (Data : access Registries.Registry; Index : Positive) return Animal
   is
   begin
      return (Data => Data, Index => Index);
   end Make;

   ----------------
   -- Get_Height --
   ----------------

   function Get_Height (Self : Animal) return Registries.Height_CM is
   begin
      return Self.Data.Get_Height (Self.Index);
   end Get_Height;

   ----------------
   -- Set_Height --
   ----------------

   procedure Set_Height (Self : Animal; Height : Registries.Height_CM) is
   begin
      Self.Data.Set_Height (Height => Height, Index => Self.Index);
   end Set_Height;

   --------------
   -- Get_Mass --
   --------------

   function Get_Mass (Self : Animal) return Registries.Mass_KG is
   begin
      return Self.Data.Get_Mass (Self.Index);
   end Get_Mass;

   --------------
   -- Set_Mass --
   --------------

   procedure Set_Mass (Self : Animal; Mass : Registries.Mass_KG) is
   begin
      Self.Data.Set_Mass (Mass => Mass, Index => Self.Index);
   end Set_Mass;

end Animals_Vectors;
