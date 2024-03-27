---------------------
-- Persons_Vectors --
---------------------

--  Operation can be dispatching in only one type
--  https://stackoverflow.com/questions/11646421/
--  operation-can-be-dispatching-in-only-one-type
--
--  Trouble with "operation can be dispatching in only one type"
--  https://comp.lang.ada.narkive.com/o65IJ03X/
--  trouble-with-operation-can-be-dispatching-in-only-one-type
--
--  Comments:
--  Do you actually need Persons_Vectors or Persons_Data to be tagged?
--  Split to two packages?
--  Use 'Class?

with Ada.Containers.Vectors;

package Persons_Vectors is

   type Height_CM is new Float range 0.0 .. 300.0;
   type Mass_KG is new Float range 0.0 .. 500.0;

   type Person is tagged private;
   type Persons_Data is tagged private;

   -- Person --
   function Make
     (Data : access Persons_Data'Class; Index : Positive) return Person;
   -- Primitive subprograms --
   function Get_Height (Self : Person) return Height_CM;
   procedure Set_Height (Self : Person; Height : Height_CM);

   function Get_Mass (Self : Person) return Mass_KG;
   procedure Set_Mass (Self : Person; Mass : Mass_KG);

   -- Persons_Data --
   -- Primitive subprograms --
   procedure Append
     (Self  : in out Persons_Data; Height : Height_CM; Mass : Mass_KG);
   function Get_Person
     (Self : in out Persons_Data; Index : Positive) return Person'Class;
   procedure Set_Person
     (Self  : in out Persons_Data; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive);

private

   package Height_Vectors is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Height_CM);

   package Mass_Vectors is new Ada.Containers.Vectors
     (Index_Type => Positive, Element_Type => Mass_KG);

   type Persons_Data is tagged record
      Heights : Height_Vectors.Vector;
      Masses  : Mass_Vectors.Vector;
   end record;

   type Person is tagged record
      Data  : access Persons_Data;
      Index : Positive;
   end record;

end Persons_Vectors;
