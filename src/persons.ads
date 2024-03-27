package Persons is

   type Height_CM is new Float range 0.0 .. 300.0;
   type Mass_KG is new Float range 0.0 .. 500.0;

   type Abstract_Person is abstract tagged null record;
   type Abstract_Persons_Data is abstract tagged null record;

   -- Abstract_Person --
   -- Primitive subprograms --
   function Make
     (Data : access Abstract_Persons_Data'Class; Index : Positive)
      return Abstract_Person is abstract;
   --  function Make
   --    (Data : access Abstract_Persons_Data'Class; Index : Positive)
   --     return Abstract_Person'Class;
   function Get_Height (Self : Abstract_Person) return Height_CM is abstract;
   procedure Set_Height
     (Self : Abstract_Person; Height : Height_CM) is abstract;

   function Get_Mass (Self : Abstract_Person) return Mass_KG is abstract;
   procedure Set_Mass (Self : Abstract_Person; Mass : Mass_KG) is abstract;

   -- Abstract_Persons_Data --
   -- Primitive subprograms --
   function Get_Person
     (Self : in out Abstract_Persons_Data; Index : Positive)
      return Abstract_Person'Class is abstract;
   procedure Set_Person
     (Self  : in out Abstract_Persons_Data; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive) is abstract;

end Persons;
