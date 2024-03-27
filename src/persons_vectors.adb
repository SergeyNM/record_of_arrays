package body Persons_Vectors is

   ----------
   -- Make --
   ----------

   function Make
     (Data : access Persons_Data'Class; Index : Positive) return Person
   is
   begin
      return (Data => Data, Index => Index);
   end Make;

   ----------------
   -- Get_Height --
   ----------------

   function Get_Height (Self : Person) return Height_CM is
   begin
      return Self.Data.Heights (Self.Index);
   end Get_Height;

   ----------------
   -- Set_Height --
   ----------------

   procedure Set_Height (Self : Person; Height : Height_CM) is
   begin
      Self.Data.Heights (Self.Index) := Height;
   end Set_Height;

   --------------
   -- Get_Mass --
   --------------

   function Get_Mass (Self : Person) return Mass_KG is
   begin
      return Self.Data.Masses (Self.Index);
   end Get_Mass;

   --------------
   -- Set_Mass --
   --------------

   procedure Set_Mass (Self : Person; Mass : Mass_KG) is
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

   function Get_Person
     (Self : in out Persons_Data; Index : Positive) return Person'Class
   is
   begin
      return Make (Data => Self'Access, Index => Index);
   end Get_Person;

   ----------------
   -- Set_Person --
   ----------------

   procedure Set_Person
     (Self  : in out Persons_Data; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive)
   is
   --     use type Ada.Containers.Count_Type;
   --  begin
   --     if Self.Heights.Length >= Ada.Containers.Count_Type (Index) then
   --        Self.Heights (Index) := Height;
   --        Self.Masses (Index)  := Mass;
   --     else
   --        Self.Heights.Append (Height);
   --        Self.Masses.Append (Mass);
   --     end if;
   begin
      Self.Heights (Index) := Height;
      Self.Masses (Index)  := Mass;
   end Set_Person;

end Persons_Vectors;
