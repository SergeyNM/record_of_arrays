package body Animals_Vectors.Registries is

   ------------
   -- Append --
   ------------

   procedure Append
     (Self : in out Registry; Height : Height_CM; Mass : Mass_KG)
   is
   begin
      Self.Heights.Append (Height);
      Self.Masses.Append (Mass);
   end Append;

   ----------------
   -- Get_Animal --
   ----------------

   function Get_Animal (Self : in out Registry; Index : Positive) return Animal
   is
   begin
      return Make (Data => Self'Access, Index => Index);
      --  error: access-to-variable designates constant
      --  solution: must be in out : Self : in out Registry
   end Get_Animal;

   ----------------
   -- Set_Animal --
   ----------------

   procedure Set_Animal
     (Self  : in out Registry; Height : Height_CM; Mass : Mass_KG;
      Index :        Positive)
   is
   begin
      Self.Heights (Index) := Height;
      Self.Masses (Index)  := Mass;
   end Set_Animal;

   function Get_Height (Self : Registry; Index : Positive) return Height_CM is
   begin
      return Self.Heights (Index);
   end Get_Height;

   procedure Set_Height
     (Self : in out Registry; Height : Height_CM; Index : Positive)
   is
   begin
      Self.Heights (Index) := Height;
   end Set_Height;

   function Get_Mass (Self : Registry; Index : Positive) return Mass_KG is
   begin
      return Self.Masses (Index);
   end Get_Mass;

   procedure Set_Mass
     (Self : in out Registry; Mass : Mass_KG; Index : Positive)
   is
   begin
      Self.Masses (Index) := Mass;
   end Set_Mass;

end Animals_Vectors.Registries;
