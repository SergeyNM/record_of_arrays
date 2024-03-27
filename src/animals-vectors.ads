limited with Animals.Vectors.Registries;

package Animals.Vectors is

   type Animal is tagged private;

   -- Animal --
   -- Primitive subprograms --
   function Make
     (Data : access Registries.Registry; Index : Positive) return Animal with
     Inline;
   function Get_Height (Self : Animal) return Height_CM with
     Inline;
   procedure Set_Height (Self : Animal; Height : Height_CM) with
     Inline;

   function Get_Mass (Self : Animal) return Mass_KG with
     Inline;
   procedure Set_Mass (Self : Animal; Mass : Mass_KG) with
     Inline;

private

   type Animal is tagged record
      Data  : access Registries.Registry;
      Index : Positive;
   end record;

end Animals.Vectors;
