#include <cstddef>
#include <vector>

typedef float Height_CM;
typedef float Mass_KG;

class Person;

struct Persons_Data
{
  friend class Person;

public:
  Person Get_Person (size_t i);

private:
  // data vectors will be private
  std::vector<Height_CM> Heights;
  std::vector<Mass_KG> Masses;
  // ...
};

class Person
{
public:
  Person (Persons_Data &d, size_t i) : Data{ d }, Index{ i } {}

  const Height_CM &
  Get_Height () const
  {
    return Data.Heights[Index];
  }

  void
  Set_Height (const Height_CM &Height)
  {
    Data.Heights[Index] = Height;
  }

  const Mass_KG &
  Get_Mass () const
  {
    return Data.Masses[Index];
  }

  void
  Set_Mass (const Mass_KG &Mass)
  {
    Data.Masses[Index] = Mass;
  }

  // methods for accessing other data

private:
  Persons_Data &Data;
  size_t Index;
};

inline Person
Persons_Data::Get_Person (size_t i)
{
  return Person (*this, i);
}
