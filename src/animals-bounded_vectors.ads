limited with Animals.Bounded_Vectors.Registries;

package Animals.Bounded_Vectors is

   type Animal is tagged private;

   -- Animal --
   -- Primitive subprograms --
   function Make
     (Data : access Registries.Registry; Index : Positive) return Animal;
   function Get_Height (Self : Animal) return Height_CM;
   procedure Set_Height (Self : Animal; Height : Height_CM);

   function Get_Mass (Self : Animal) return Mass_KG;
   procedure Set_Mass (Self : Animal; Mass : Mass_KG);

private

   type Animal is tagged record
      Data  : access Registries.Registry;
      Index : Positive;
   end record;

end Animals.Bounded_Vectors;
