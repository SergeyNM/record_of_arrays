with Animals.Vectors.Registries;

package body Animals.Vectors is

   ----------
   -- Make --
   ----------

   function Make
     (Data : access Registries.Registry; Index : Positive) return Animal is
     ((Data => Data, Index => Index));

   ----------------
   -- Get_Height --
   ----------------

   function Get_Height (Self : Animal) return Height_CM is
     (Self.Data.Get_Height (Self.Index));

   ----------------
   -- Set_Height --
   ----------------

   procedure Set_Height (Self : Animal; Height : Height_CM) is
   begin
      Self.Data.Set_Height (Height => Height, Index => Self.Index);
   end Set_Height;

   --------------
   -- Get_Mass --
   --------------

   function Get_Mass (Self : Animal) return Mass_KG is
     (Self.Data.Get_Mass (Self.Index));

   --------------
   -- Set_Mass --
   --------------

   procedure Set_Mass (Self : Animal; Mass : Mass_KG) is
   begin
      Self.Data.Set_Mass (Mass => Mass, Index => Self.Index);
   end Set_Mass;

end Animals.Vectors;
