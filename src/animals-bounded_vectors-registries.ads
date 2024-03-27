with Ada.Containers.Bounded_Vectors;

package Animals.Bounded_Vectors.Registries is

   type Registry (Capacity : Ada.Containers.Count_Type) is tagged private;

   -- Registry --
   -- Primitive subprograms --
   procedure Append
     (Self : in out Registry; Height : Height_CM; Mass : Mass_KG);
   function Get_Animal
     (Self : in out Registry; Index : Positive) return Animal;
   procedure Set_Animal
     (Self  : in out Registry; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive);

   -- Helper Primitive subprograms --
   function Get_Height (Self : Registry; Index : Positive) return Height_CM;
   procedure Set_Height
     (Self : in out Registry; Height : Height_CM; Index : Positive);

   function Get_Mass (Self : Registry; Index : Positive) return Mass_KG;
   procedure Set_Mass
     (Self : in out Registry; Mass : Mass_KG; Index : Positive);

private

   package Height_Vectors is new Ada.Containers.Bounded_Vectors
     (Index_Type => Positive, Element_Type => Height_CM);

   package Mass_Vectors is new Ada.Containers.Bounded_Vectors
     (Index_Type => Positive, Element_Type => Mass_KG);

   type Registry (Capacity : Ada.Containers.Count_Type) is tagged record
      Heights : Height_Vectors.Vector (Capacity);
      Masses  : Mass_Vectors.Vector (Capacity);
   end record;

end Animals.Bounded_Vectors.Registries;
