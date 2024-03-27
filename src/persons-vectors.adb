package body Persons.Vectors is

   -- Person --

   ----------
   -- Make --
   ----------

   overriding function Make
     (Data : access Abstract_Persons_Data'Class; Index : Positive)
      return Person
   is
   begin
      return (Data => Persons_Data (Data.all)'Access, Index => Index);
   end Make;

   -- Primitive subprograms --

   ----------------
   -- Get_Height --
   ----------------

   overriding function Get_Height (Self : Person) return Height_CM is
   begin
      return Self.Data.Heights (Self.Index);
   end Get_Height;

   ----------------
   -- Set_Height --
   ----------------

   overriding procedure Set_Height (Self : Person; Height : Height_CM) is
   begin
      Self.Data.Heights (Self.Index) := Height;
   end Set_Height;

   --------------
   -- Get_Mass --
   --------------

   overriding function Get_Mass (Self : Person) return Mass_KG is
   begin
      return Self.Data.Masses (Self.Index);
   end Get_Mass;

   --------------
   -- Set_Mass --
   --------------

   overriding procedure Set_Mass (Self : Person; Mass : Mass_KG) is
   begin
      Self.Data.Masses (Self.Index) := Mass;
   end Set_Mass;

   -- Persons_Data --
   -- Primitive subprograms --

   ------------
   -- Append --
   ------------

   procedure Append
     (Self  : in out Persons_Data; Height : Height_CM; Mass : Mass_KG)
   is
   begin
         Self.Heights.Append (Height);
         Self.Masses.Append (Mass);
   end Append;

   ----------------
   -- Get_Person --
   ----------------

   overriding function Get_Person
     (Self : in out Persons_Data; Index : Positive)
      return Abstract_Person'Class
   is
   begin
      return Persons.Vectors.Make (Data => Self'Access, Index => Index);
   end Get_Person;

   ----------------
   -- Set_Person --
   ----------------

   overriding procedure Set_Person
     (Self  : in out Persons_Data; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive)
   is
   begin
      Self.Heights (Index) := Height;
      Self.Masses (Index)  := Mass;
   end Set_Person;

end Persons.Vectors;
