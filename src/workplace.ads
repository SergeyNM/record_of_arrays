package Workplace is

   type Employee is private;
   type Department is private;

   --  error: operation can be dispatching in only one type
   procedure Assign_Employee (E : in out Employee; D : in out Department);
   type Dept_Ptr is access all Department;
   function Current_Department (E : Employee) return Dept_Ptr;

   --  error: operation can be dispatching in only one type
   procedure Choose_Manager (D : in out Department; M : in out Employee);

private
   --  type Employee is tagged record
   type Employee is record
      null;
   end record;

   --  type Department is tagged record
   type Department is record
      null;
   end record;

end Workplace;
