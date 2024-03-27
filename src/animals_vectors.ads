limited with Animals_Vectors.Registries;

package Animals_Vectors is

   type Animal is tagged private;

   -- Animal --
   -- Primitive subprograms --
   function Make
     (Data : access Registries.Registry; Index : Positive) return Animal;
   function Get_Height (Self : Animal) return Registries.Height_CM;
   procedure Set_Height (Self : Animal; Height : Registries.Height_CM);

   function Get_Mass (Self : Animal) return Registries.Mass_KG;
   procedure Set_Mass (Self : Animal; Mass : Registries.Mass_KG);

private

   type Animal is tagged record
      Data  : access Registries.Registry;
      Index : Positive;
   end record;

end Animals_Vectors;
