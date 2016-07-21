# Dummy schema

## Concept

Create a structure that mimicks Wikipedia in that it is crowdsourced, but which does not end up with a single interpretation or even a strictly factual interpretation.

## Methods

Clone and Merge

clone would let someone create a new instance of a SOCIETY with all the same information, but tied to the user that cloned it and editable only to them.

merge would take the information from a single subcategory of society and copy that under the same heading in their chosen 

## Schema

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


Users
Users can merge all information from any submodule of someone else's model into their own, allowing some form of social connectivity without forcing a single dominant interpretation. Every merge creates necessitates a Society to be merged into, but creates a separate instance of the information, allowing it to be edited or reinterpreted.
