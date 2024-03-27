with Ada.Text_IO;

with Persons_Arrays;
--  with Persons_Nested_Packages;
with Persons_Vectors;
with Persons.Vectors;

with Animals_Vectors.Registries;
with Animals.Vectors.Registries;
with Animals.Arrays.Registries;

procedure Record_Of_Arrays is
   package TIO renames Ada.Text_IO;

   package People is new Persons_Arrays (Number_Of_Persons => 3);
   People_Data : aliased People.Persons_Data;
   Some_Person : People.Person;

   --  package People_2 is new Persons_Nested_Packages (Number_Of_Persons => 3);
   --  People_Data_2 : aliased People_2.Physical.Registry;
   --  Some_Person_2 : People_2.Person;

   People_Data_2 : aliased Persons_Vectors.Persons_Data;
   Some_Person_2 : Persons_Vectors.Person;
   --  Other_Person : Persons_Vectors.Person'Class;
   --  error: initialization required in class-wide declaration

   People_Data_3 : aliased Persons.Vectors.Persons_Data;
   --  Some_Person_3 : Persons.Vectors.Person;

   Animals_Data_4 : aliased Animals_Vectors.Registries.Registry;
   Some_Animal_4  : Animals_Vectors.Animal;

   Animals_Data_5 : aliased Animals.Vectors.Registries.Registry;
   Some_Animal_5  : Animals.Vectors.Animal;

   Animals_Data_6 : aliased Animals.Arrays.Registries.Registry (Capacity => 3);
   Some_Animal_6  : Animals.Arrays.Animal;
begin

   People_Data.Set_Person (Height => 182.0, Mass => 78.0, Index => 1);
   People_Data.Set_Person (Height => 178.0, Mass => 72.0, Index => 2);
   People_Data.Set_Person (Height => 173.0, Mass => 67.0, Index => 3);

   --  Some_Person := People.Make (Registries => People_Data'Access, Index => 5);
   --  raised CONSTRAINT_ERROR : Persons_Arrays.adb:38 index check failed
   --  [I:\Projects\Ada_Examples\record_of_arrays\bin\record_of_arrays.exe]
   --  0x7ff772177d20 Record_Of_Arrays.People at Persons_Arrays.adb:38
   --  0x7ff7721771e0 Record_Of_Arrays at record_of_arrays.adb:22

   Some_Person := People.Make (Data => People_Data'Access, Index => 1);
   TIO.Put_Line
     ("Mass of person, with Index = 1, is: " & Some_Person.Get_Mass'Image);
   TIO.Put_Line
     ("Height of person, with Index = 1, is: " & Some_Person.Get_Height'Image);

   TIO.Put_Line ("Line for Debug Breakpoint");

   People_Data_2.Append (Height => 182.0, Mass => 78.0);
   People_Data_2.Append (Height => 178.0, Mass => 72.0);
   People_Data_2.Append (Height => 173.0, Mass => 67.0);

   Some_Person_2 :=
     Persons_Vectors.Make (Data => People_Data_2'Access, Index => 2);
   TIO.Put_Line
     ("Mass of person, with Index = 2, is: " & Some_Person_2.Get_Mass'Image);
   TIO.Put_Line
     ("Height of person, with Index = 2, is: " &
      Some_Person_2.Get_Height'Image);

   --  Some_Person_2 := People_Data_2.Get_Person (Index => 3);
   --  Dynamically tagged expression not allowed.
   --  https://groups.google.com/g/comp.lang.ada/c/G-CCYSuMXy4
   --
   --  Other_Person := People_Data_2.Get_Person (Index => 3);
   --  error: initialization required in class-wide declaration
   --
   Some_Person_2 :=
     Persons_Vectors.Person (People_Data_2.Get_Person (Index => 3));

   TIO.Put_Line
     ("Mass of person, with Index = 3, is: " & Some_Person_2.Get_Mass'Image);
   TIO.Put_Line
     ("Height of person, with Index = 3, is: " &
      Some_Person_2.Get_Height'Image);

   TIO.Put_Line ("Line for Debug Breakpoint");

   People_Data_3.Append (Height => 182.0, Mass => 78.0);
   People_Data_3.Append (Height => 178.0, Mass => 72.0);
   People_Data_3.Append (Height => 173.0, Mass => 67.0);

   --  error: invalid tagged conversion, not compatible with type
   --  "Abstract_Person'Class"
   --  Some_Person_3 :=
   --    Persons.Vectors.Person (People_Data_3.Get_Person (Index => 3));
   declare
      Some_Person_3 : constant Persons.Abstract_Person'Class :=
        People_Data_3.Get_Person (Index => 3);
   begin
      TIO.Put_Line
        ("Mass of person, with Index = 3, is: " &
         Some_Person_3.Get_Mass'Image);
      TIO.Put_Line
        ("Height of person, with Index = 3, is: " &
         Some_Person_3.Get_Height'Image);
      --  TIO.Put_Line
      --    ({"Height of person, with Index = 3, is: {Some_Person_3.Get_Height}"});
      TIO.Put_Line ("Line for Debug Breakpoint");
   end;

   Animals_Data_4.Append (Height => 182.0, Mass => 78.0);
   Animals_Data_4.Append (Height => 178.0, Mass => 72.0);
   Animals_Data_4.Append (Height => 173.0, Mass => 67.0);

   Some_Animal_4 := Animals_Data_4.Get_Animal (Index => 3);
   TIO.Put_Line
     ("Mass of animal, with Index = 3, is: " & Some_Animal_4.Get_Mass'Image);
   TIO.Put_Line
     ("Height of animal, with Index = 3, is: " &
      Some_Animal_4.Get_Height'Image);

   Animals_Data_5.Append (Height => 182.0, Mass => 78.0);
   Animals_Data_5.Append (Height => 178.0, Mass => 72.0);
   Animals_Data_5.Append (Height => 173.0, Mass => 67.0);

   TIO.Put_Line ("Line for Debug Breakpoint");

   Some_Animal_5 := Animals_Data_5.Get_Animal (Index => 1);
   TIO.Put_Line
   ("Mass of animal, with Index = 1, is: " & Some_Animal_5.Get_Mass'Image);
   TIO.Put_Line
   ("Height of animal, with Index = 1, is: "
    & Some_Animal_5.Get_Height'Image);

   TIO.Put_Line ("Line for Debug Breakpoint");

   Animals_Data_6.Set_Animal (Height => 182.0, Mass => 78.0, Index => 1);
   Animals_Data_6.Set_Animal (Height => 178.0, Mass => 72.0, Index => 2);
   Animals_Data_6.Set_Animal (Height => 173.0, Mass => 67.0, Index => 3);

   Some_Animal_6 := Animals_Data_6.Get_Animal (Index => 2);
   TIO.Put_Line
   ("Mass of animal, with Index = 2, is: " & Some_Animal_6.Get_Mass'Image);
   TIO.Put_Line
   ("Height of animal, with Index = 2, is: "
    & Some_Animal_6.Get_Height'Image);

   TIO.Put_Line ("Line for Debug Breakpoint");

end Record_Of_Arrays;
