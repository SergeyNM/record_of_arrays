package Animals.Arrays.Registries is

   type Registry (Capacity : Positive) is tagged private;

   -- Registry --
   -- Primitive subprograms --
   --  procedure Append
   --    (Self : in out Registry; Height : Height_CM; Mass : Mass_KG) with
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

   type Height_Arr is array (Positive range <>) of Height_CM;
   type Mass_Arr is array (Positive range <>) of Mass_KG;

   type Registry (Capacity : Positive) is tagged record
      --  Heights : array (1 .. Capacity) of Height_CM;
      --  error: anonymous array not allowed as component
      Heights : Height_Arr (Positive'First .. Capacity);
      Masses  : Mass_Arr (Positive'First .. Capacity);
   end record;

end Animals.Arrays.Registries;
