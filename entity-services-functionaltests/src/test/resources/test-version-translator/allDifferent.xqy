xquery version "1.0-ml";
module namespace test-3-from-test-6 = "http://marklogic.com/test/Test-3-0.0.1-from-Test-6-0.0.1";

import module namespace es = "http://marklogic.com/entity-services" 
    at "/MarkLogic/entity-services/entity-services.xqy";

(: 
 : This module was generated by MarkLogic Entity Services. 
 : Its purpose is to create instances of entity types
 : defined in
 : $tar
 : from documents that were persisted 
 : according to entity type
 : $source
 :
 : Modification History:
 :   Generated at timestamp: 2016-07-22T15:14:42.419411-07:00
 :   Persisted by AUTHOR
 :   Date: DATE
 :)


(:~
 : Creates a map:map instance representation of the target entity type
 : from a document that contains the source entity instance.
 : @param $source-node  A document or node that contains data conforming to the
 : source entity type
 : @return A map:map instance that holds the data for this entity type.
 :)
declare function test-3-from-test-6:convert-instance-Product(
    $source-node as node()
) as map:map
{
    json:object()
(: The following line identifies the type of this instance.  Do not change it. :)
        =>map:with('$type', 'Product')
(: The following lines are generated from the 'Product' entity type.                :)
(: The following property was missing from the source type                          :)
    =>   map:with('ProductName',            xs:string#1( () ))
 (: The following property was missing from the source type                          :)
    =>es:optional('UnitPrice',              xs:integer#1( () ))
 (: The following property was missing from the source type                          :)
    =>es:optional('SupplierID',             xs:integer#1( () ))
 (: The following property was missing from the source type                          :)
    =>es:optional('Discontinued',           xs:boolean#1( () ))

};
    
(: Entity type Customer is in source document
 : but not in target document.
 : The following XPath expressions should get values from the source
 : instances but there is no specified target
 :
 :)
    

(:~
 : This function includes an array if there are items to put in it.
 : If there are no such items, then it returns an empty sequence.
 : TODO EA-4? move to es: module
 :)
declare function test-3-from-test-6:extract-array(
    $path-to-property as item()*,
    $fn as function(*)
) as json:array?
{
    if (empty($path-to-property))
    then ()
    else json:to-array($path-to-property ! $fn(.))
};