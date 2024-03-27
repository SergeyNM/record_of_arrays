

generic
   Number_Of_Persons : Positive;

package Persons_Nested_Packages is

   --  subtype Index_Type is Positive range Positive'First .. Number_Of_Persons
   type Height_CM is new Float range 0.0 .. 300.0;
   type Mass_KG is new Float range 0.0 .. 500.0;

   type Person is tagged private;

   package Physical is
      type Physical_Type is tagged private;

   -- Physical_Type --
   -- Primitive subprograms --
      function Get_Person
     (Self : in out Physical_Type; Index : Positive) return Person;
      procedure Set_Person
     (Self  : in out Physical_Type; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive);

   private
      type Height_Arr is array (Positive range <>) of Height_CM;
      type Mass_Arr is array (Positive range <>) of Mass_KG;

      type Physical_Type is tagged record
         Heights : Height_Arr (1 .. Number_Of_Persons);
         Masses  : Mass_Arr (1 .. Number_Of_Persons);
      end record;
   end Physical;

   -- Person --
   -- Primitive subprograms --
   function Make
     (Data : access Physical.Physical_Type; Index : Positive) return Person;
   function Get_Height (Self : Person) return Height_CM;
   procedure Set_Height (Self : Person; Height : Height_CM);

   function Get_Mass (Self : Person) return Mass_KG;
   procedure Set_Mass (Self : Person; Mass : Mass_KG);

private
   type Person is tagged record
      Phy_Data  : access Physical.Physical_Type;
      Index : Positive;
   end record;

end Persons_Nested_Packages;
