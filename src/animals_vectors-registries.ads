with Ada.Containers.Vectors;

package Animals_Vectors.Registries is

   type Height_CM is new Float range 0.0 .. 300.0;
   type Mass_KG is new Float range 0.0 .. 500.0;

   type Registry is tagged private;

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

   package Height_Vectors is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Height_CM);

   package Mass_Vectors is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Mass_KG);

   type Registry is tagged record
      Heights : Height_Vectors.Vector;
      Masses  : Mass_Vectors.Vector;
   end record;

end Animals_Vectors.Registries;
