# Dummy schema

SOCIETY (fundamental unit)
  Name
  
  has_one
    Technological development
      production
      communications 
      comparison
    History
      boundary disputes
      ethnic disputes
      social disputes
    Environment
      geography
      biodiversity
    Governmental organization
      military
      judicial
      legislative
    Economic organization
      standard of living
      means of access to livelihood (wage, donations)
      diversity
      dependency on foreign relations
    Culture
      values
      diversity
      architecture
      music
      architecture
      cuisine
      religion
      folklore/mythology
    Education
      degree of access for average citizen
      diversity
      means of authentication
    Language
      linguistic diversity
      official language
  has many:
    Social groups
      description
      legitimation
    conflicts (join between different social groups)
      group_1_id
      group_2_id
      description
