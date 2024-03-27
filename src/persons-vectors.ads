with Ada.Containers.Vectors;

package Persons.Vectors is

   type Person is tagged private;
   type Persons_Data is tagged private;

   -- Person --
   -- Primitive subprograms --
   --  overriding
   function Make
     (Data : access Abstract_Persons_Data'Class; Index : Positive)
      return Person;
   function Get_Height (Self : Person) return Height_CM;
   procedure Set_Height (Self : Person; Height : Height_CM);

   function Get_Mass (Self : Person) return Mass_KG;
   procedure Set_Mass (Self : Person; Mass : Mass_KG);

   -- Persons_Data --
   --  Primitive subprograms  --
   procedure Append
     (Self  : in out Persons_Data; Height : Height_CM; Mass : Mass_KG);
   function Get_Person
     (Self : in out Persons_Data; Index : Positive)
      return Abstract_Person'Class;
   procedure Set_Person
     (Self  : in out Persons_Data; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive);

private

   package Height_Vectors is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Height_CM);

   package Mass_Vectors is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Mass_KG);

   type Persons_Data is new Abstract_Persons_Data with record
      Heights : Height_Vectors.Vector;
      Masses  : Mass_Vectors.Vector;
   end record;

   type Person is new Abstract_Person with record
      Data  : access Persons_Data;
      Index : Positive;
   end record;

end Persons.Vectors;
