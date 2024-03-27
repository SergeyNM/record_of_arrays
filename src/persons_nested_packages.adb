package body Persons_Nested_Packages is

   --------------
   -- Physical --
   --------------

   package body Physical is

      ----------------
      -- Get_Person --
      ----------------

      function Get_Person
        (Self : in out Physical_Type; Index : Positive) return Person
      is
      begin
         return Make (Data => Self'Access, Index => Index);
      end Get_Person;

      ----------------
      -- Set_Person --
      ----------------

      procedure Set_Person
        (Self  : in out Physical_Type; Height : Height_CM; Mass : Mass_KG;
         Index :        Positive)
      is
      begin
         Self.Heights (Index) := Height;
         Self.Masses (Index)  := Mass;
      end Set_Person;

   end Physical;

   ----------
   -- Make --
   ----------

   function Make
     (Data : access Physical.Physical_Type; Index : Positive) return Person
   is
   begin
      return (Phy_Data => Data, Index => Index);
   end Make;

   ----------------
   -- Get_Height --
   ----------------

   function Get_Height (Self : Person) return Height_CM is
   begin
      return Self.Phy_Data.Heights (Self.Index);
      --  return Self.Get_Phy_Data.Heights (Self.Index);
   end Get_Height;

   ----------------
   -- Set_Height --
   ----------------

   procedure Set_Height (Self : Person; Height : Height_CM) is
   begin
      Self.Phy_Data.Heights (Self.Index) := Height;
   end Set_Height;

   --------------
   -- Get_Mass --
   --------------

   function Get_Mass (Self : Person) return Mass_KG is
   begin
      return Self.Phy_Data.Masses (Self.Index);
      --  return Self.Get_Phy_Data.Masses (Self.Index);
   end Get_Mass;

   --------------
   -- Set_Mass --
   --------------

   procedure Set_Mass (Self : Person; Mass : Mass_KG) is
   begin
      Self.Phy_Data.Masses (Self.Index) := Mass;
   end Set_Mass;

   --  function Get_Phy_Data (Self : Person) return access Physical.Physical_Type is
   --  begin
   --     return Self.Phy_Data;
   --  end Get_Phy_Data;

end Persons_Nested_Packages;
