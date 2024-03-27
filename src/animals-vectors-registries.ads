with Ada.Containers.Vectors;

package Animals.Vectors.Registries is

   type Registry is tagged private;

   -- Registry --
   -- Primitive subprograms --
   procedure Append
     (Self : in out Registry; Height : Height_CM; Mass : Mass_KG) with
     Inline;

   --  function Get_Animal
   --    (Self : in out Registry; Index : Positive) return Animal with
   --    Inline;
   function Get_Animal
     (Self : aliased in out Registry; Index : Positive) return Animal with
     Inline;

   procedure Set_Animal
     (Self  : in out Registry; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive) with
     Inline;

   -- Helper Primitive subprograms --
   function Get_Height
     (Self : Registry; Index : Positive) return Height_CM with
     Inline;
   procedure Set_Height
     (Self : in out Registry; Height : Height_CM; Index : Positive) with
     Inline;

   function Get_Mass (Self : Registry; Index : Positive) return Mass_KG with
     Inline;
   procedure Set_Mass
     (Self : in out Registry; Mass : Mass_KG; Index : Positive) with
     Inline;

private

   package Height_Vectors is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Height_CM);

   package Mass_Vectors is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Mass_KG);

   type Registry is tagged record
      Heights : Height_Vectors.Vector;
      Masses  : Mass_Vectors.Vector;
   end record;

end Animals.Vectors.Registries;
