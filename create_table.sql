drop table immutableProperties;
drop table compulsoryProperties;
drop table childObjectList;
drop table nonContainerObjectProperties;
drop table containerObjectProperties;
drop table nonContainerObjects;
drop table containerObjects;
drop table objects		;
drop table nonContainerConcreteTypeProperties;
drop table containerConcreteTypeProperties ;
drop table measurementUnits;
drop table propertyTypes;
drop table properties;
drop table nonContainerConcreteTypeFaces;
drop table nonContainerConcreteTypes;
drop table containerConcreteTypeFacesDoors;
drop table containerConcreteTypeFaces;
drop table wall;
drop table containerConcreteTypes;
drop table typeInheritance;
drop table types;

create table types(
     type_id text primary key,
     type_name text unique,
     description text,
     CONSTRAINT validate_name CHECK (length("type_name") > 0 AND ("type_name") IS NOT NULL ),
     CONSTRAINT validate_description CHECK (length("description") > 0  AND ("description") IS NOT NULL ));


create table typeInheritance (
    type_id text references types(type_id),
    super_type_id text references types(type_id),
    primary key(type_id, super_type_id));


create table containerConcreteTypes (
    containerConcreteTypeId text primary key references types(type_id) unique,
    containerLengthAB integer, 
    containerLengthAD integer, 
    containerLengthAE integer, 
    containerThickness integer,
    userObjectCommentGlobal text,
    CONSTRAINT validate_LengthAB CHECK ("containerlengthab" > 0 AND ("containerlengthab") IS NOT NULL ),
    CONSTRAINT validate_LengthAD CHECK ("containerlengthad" > 0 AND ("containerlengthad") IS NOT NULL ),
    CONSTRAINT validate_LengthAE CHECK ("containerlengthae" > 0 AND ("containerlengthae") IS NOT NULL ),
    CONSTRAINT validate_thickness CHECK ("containerthickness" > 0 AND ("containerthickness") IS NOT NULL));


create table wall(
    wallID text primary key,
    colourAlongRed int check(colourAlongRed>=0 and colourAlongRed <=255)default(0),
    colourAlongGreen int check(colourAlongGreen>=0 and colourAlongGreen <=255)default(0),
    colourAlongBlue int check(colourAlongBlue>=0 and colourAlongBlue <=255)default(0),
    wallLengthAB integer,
    wallLengthAD integer,
    CONSTRAINT validate_LengthAB CHECK ("walllengthab" > 0 AND ("walllengthab") IS NOT NULL ),
    CONSTRAINT validate_LengthAD CHECK ("walllengthad" > 0 AND ("walllengthad") IS NOT NULL )
   );

create table containerConcreteTypeFaces (
    containerConcreteTypeId text references containerConcreteTypes (containerConcreteTypeId) NOT NULL,
    containerRoofWallID text references wall(wallID),
    containerBottomWallID text references wall(wallID),
    containerLeftWallID text references wall(wallID),
    containerRightWallID text references wall(wallID),
    containerFrontWallID text references wall(wallID),
    containerBackWallID text references wall(wallID)
 ); 

create table containerConcreteTypeFacesDoors (
   wallID text references wall(wallID),
   containerConcreteTypeFacesDoorsId text primary key,
   containerConcreteTypeId text references containerConcreteTypes (containerConcreteTypeId),
   doorDisplacementAlongAB integer,
   doorDisplacementAlongAD integer,
   doorAlignmentAlongAB integer,
   doorAlignmentAlongAD integer,
   colourAlongRed int check(colourAlongRed>=0 and colourAlongRed <=255)default(0),
   colourAlongGreen int check(colourAlongGreen>=0 and colourAlongGreen <=255)default(0),
   colourAlongBlue int check(colourAlongBlue>=0 and colourAlongBlue <=255)default(0),
   CONSTRAINT validate_DisplacementAlongAB CHECK ("doordisplacementalongab" > 0 AND ("doordisplacementalongab") IS NOT NULL ),
   CONSTRAINT validate_DisplacementAlongAD CHECK ("doordisplacementalongad" > 0 AND ("doordisplacementalongad") IS NOT NULL ),
   CONSTRAINT validate_AlignmentAlongAB CHECK ("dooralignmentalongab" > 0 AND ("dooralignmentalongab") IS NOT NULL ),
   CONSTRAINT validate_AlignmentAlongAD CHECK ("dooralignmentalongad" > 0 AND ("dooralignmentalongad") IS NOT NULL )
);


create table nonContainerConcreteTypes(
    nonContainerConcreteTypeId text primary key references types(type_id) unique,
    nonContainerLengthAB integer , 
    nonContainerLengthAD integer , 
    nonContainerLengthAE integer , 
    userObjectCommentGlobal text ,
    CONSTRAINT validate_LengthAB CHECK ("noncontainerlengthab" > 0 AND ("noncontainerlengthab") IS NOT NULL ),
    CONSTRAINT validate_LengthAD CHECK ("noncontainerlengthad" > 0 AND ("noncontainerlengthad") IS NOT NULL ),
    CONSTRAINT validate_LengthAE CHECK ("noncontainerlengthae" > 0 AND ("noncontainerlengthae") IS NOT NULL )
);


create table nonContainerConcreteTypeFaces (
    nonContainerConcreteTypeId text references nonContainerConcreteTypes (nonContainerConcreteTypeId),
    nonContainerRoofWallId text references wall(wallID),
    nonContainerBottomWallID text references wall(wallID),
    nonContainerLeftWallID text references wall(wallID),
    nonContainerRightWallID text references wall(wallID),
    nonContainerFrontWallID text references wall(wallID),
    nonContainerBackWallID text references wall(wallID),
    colourAlongRed int check(colourAlongRed>=0 and colourAlongRed <=255)default(0),
    colourAlongGreen int check(colourAlongGreen>=0 and colourAlongGreen <=255)default(0),
    colourAlongBlue int check(colourAlongBlue>=0 and colourAlongBlue <=255)default(0)
);


create table properties (
    propertyID text primary key, 
    propertyName text unique,
    userDescription text,
    CONSTRAINT validate_propertyname CHECK (length("propertyname") > 0 AND ("propertyname") IS NOT NULL )
);


create table propertyTypes (
    propertyTypeID text primary key,
     propertyID text references properties(propertyID)NOT NULL,
    propertyType text, /* only from a list - date, string, bool, number, list of string, bool, number*/
    userDescription text,
   CONSTRAINT validate_propertyType CHECK (length("propertytype") > 0 AND ("propertytype") IS NOT NULL )
);

create table measurementUnits (
      measurementUnitID text primary key,
      measurementUnitName text unique,
      CONSTRAINT validate_unitname CHECK (length("measurementunitname") > 0 AND ("measurementunitname") IS NOT NULL )
);


create table containerConcreteTypeProperties (
    containerConcreteTypeId text references containerConcreteTypes (containerConcreteTypeId),
    propertyID text references properties(propertyID),
    propertyValue text NOT NULL,
    measurementUnitID text references measurementUnits(measurementUnitID),  
    userCommentGlobal text,
    primary key( containerConcreteTypeId, propertyID)
);

create table nonContainerConcreteTypeProperties (
    nonContainerConcreteTypeId text references nonContainerConcreteTypes (nonContainerConcreteTypeId),
    propertyID text references properties(propertyID), 
    propertyValue text NOT NULL, 
    measurementUnitID text references measurementUnits(measurementUnitID),  
    userCommentGlobal text,
    primary key(nonContainerConcreteTypeId, propertyID)
);


create table objects (
   objectID text primary key 
);


create table containerObjects (
    objectID text primary key references objects(objectID) unique,
     containerConcreteTypeId text references containerConcreteTypes (containerConcreteTypeId),
       userLabel text,
    userObjectCommentLocal text
);

create table nonContainerObjects (
    objectID text primary key NOT NULL references objects(objectID) unique,
    nonContainerConcreteTypeId text references nonContainerConcreteTypes (nonContainerConcreteTypeId),
    userLabel text,
    userObjectCommentLocal text
);

create table containerObjectProperties (
    objectID text references containerObjects(objectID),
    userAssignedID text unique,
    propertyID text references properties(propertyID), 
    propertyValue text NOT NULL,
    userCommentLocal text,
    userLabel text,
   primary key(objectID, propertyID),
   CONSTRAINT validate_AssignedID CHECK (length("userassignedid") > 0 AND ("userassignedid") IS NOT NULL )
);

create table nonContainerObjectProperties (
    objectID text references nonContainerObjects (objectID),
    userAssignedID text unique,
    propertyID text references properties(propertyID), 
    propertyValue text NOT NULL,
    userCommentLocal text,
    userLabel text NOT NULL,
    primary key(objectID, propertyID),
    CONSTRAINT validate_AssignedID CHECK (length("userassignedid") > 0 AND ("userassignedid") IS NOT NULL )
);

create table childObjectList (
    containerObjectId text references containerObjects(objectID),
    childObjectId text references objects(objectID),
    displacementAlongAB integer,
    displacementAlongAE integer,
    displacementAlongAD integer,
    alignmentWithParentsRoof text,
    alignmentWithParentsFront text,
    CONSTRAINT validate_displacementAB CHECK ("displacementalongab" > 0 AND ("displacementalongab") IS NOT NULL ),
    CONSTRAINT validate_displacementAE CHECK ("displacementalongae" > 0 AND ("displacementalongae") IS NOT NULL ),
    CONSTRAINT validate_displacementAD CHECK ("displacementalongad" > 0 AND ("displacementalongad") IS NOT NULL ),
    CONSTRAINT validate_alignmentWithParentsRoof CHECK (length("alignmentwithparentsroof") > 0 AND ("alignmentwithparentsroof") IS NOT NULL ),
    CONSTRAINT validate_alignmentWithParentsFront CHECK (length("alignmentwithparentsfront") > 0 AND ("alignmentwithparentsfront") IS NOT NULL )
);


create table compulsoryProperties (
  propertyID text references properties(propertyID) unique
 );

create table immutableProperties ( 
  propertyID text references properties(propertyID) unique  
);







