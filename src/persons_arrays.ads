--------------------
-- Persons_Arrays --
--------------------

--  Operation can be dispatching in only one type
--  https://stackoverflow.com/questions/11646421/
--  operation-can-be-dispatching-in-only-one-type
--
--  Trouble with "operation can be dispatching in only one type"
--  https://comp.lang.ada.narkive.com/o65IJ03X/
--  trouble-with-operation-can-be-dispatching-in-only-one-type
--
--  Comments:
--  Do you actually need Person or Persons_Data to be tagged?
--  Split to two packages?
--  Use 'Class?
--
--  For Index_Type, see also Ada_Examples\func_ret_val_err\src\lineups.ad(s,b)
generic
   Number_Of_Persons : Positive;

package Persons_Arrays is

   --  subtype Index_Type is Positive range Positive'First .. Number_Of_Persons
   type Height_CM is new Float range 0.0 .. 300.0;
   type Mass_KG is new Float range 0.0 .. 500.0;

   type Person is tagged private;
   type Persons_Data is tagged private;

   -- Person --
   -- Primitive subprograms --
   function Make
     (Data : access Persons_Data'Class; Index : Positive) return Person;
   --  function Make
   --  (Data : access Persons_Data; Index : Positive) return Person
   --  with Dispatching_Type;
   procedure Make (Self : in out Person;
                   Data  : access Persons_Data'Class;
                   Index : Positive);
   function Get_Height (Self : Person) return Height_CM;
   procedure Set_Height (Self : Person; Height : Height_CM);

   function Get_Mass (Self : Person) return Mass_KG;
   procedure Set_Mass (Self : Person; Mass : Mass_KG);

   -- Persons_Data --
   -- Primitive subprograms --
   function Get_Person
     (Self : in out Persons_Data; Index : Positive) return Person'Class;

   procedure Get_Person (Self        : in out Persons_Data;
                         Index       : Positive;
                         That_Person : in out Person'Class);

   procedure Set_Person
     (Self  : in out Persons_Data; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive);

private

   type Height_Arr is array (Positive range <>) of Height_CM;
   type Mass_Arr is array (Positive range <>) of Mass_KG;

   type Persons_Data is tagged record
      Heights : Height_Arr (1 .. Number_Of_Persons);
      Masses  : Mass_Arr (1 .. Number_Of_Persons);
   end record;

   type Person is tagged record
      Data  : access Persons_Data;
      Index : Positive;
   end record;

end Persons_Arrays;
