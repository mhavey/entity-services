xquery version "1.0-ml";

(: 
 : This module was generated by MarkLogic Entity Services. 
 : The source entity type document was SchemaCompleteEntityType-0.0.1
 :
 : To use this module, examine how you wish to extract data from sources,
 : and modify the various extract-instance-{X} functions to 
 : create the instances you wish.
 :
 : You may wish to/need to alter
 : 1.  values.  For example, creating duration values from decimal months.
 : 2.  references.  This conversion module assumes you want to denormalize 
 :     instances when storing them in documents.  You may choose to remove 
 :     code that denormalizes, and just include reference values in your instances 
 :     instead.
 : 3.  Source XPath expressions.  The data coming into the extract-instance={X} 
 :     functions will probably not be exactly what this module predicts.
 :
 : After modifying this file, put it in your project for deployment to the modules 
 : database of your application, and check it into your source control system.
 :
 : Modification History:
 :   Generated at timestamp: 2016-04-18T15:37:02.031938-07:00
 :   Persisted by AUTHOR
 :   Date: DATE
 :)
module namespace schemaCompleteEntityType = "http://marklogic.com/testing-entity-type#SchemaCompleteEntityType-0.0.1";

import module namespace es = "http://marklogic.com/entity-services" 
    at "/MarkLogic/entity-services/entity-services.xqy";

import module namespace i = "http://marklogic.com/entity-services-instance" 
    at "/MarkLogic/entity-services/entity-services-instance.xqy";


(:
 :  extract-instance-{entity-type} functions 
 :
 :  These functions take together take a source document and create a nested
 :  map structure from it.
 :  The resulting map is used by instance-to-canonical-xml to create documents
 :  in the database.
 :  
 :  There are numerous customizations you may wish to apply to this module.
 :)

(:~
 : Creates a map:map representation of an entity instance from some source
 : document.
 : @param $source-node  A document or node that contains data for populating a SchemaCompleteEntityType
 : @return A map:map instance that holds the data for this entity type.
 :)
declare function schemaCompleteEntityType:extract-instance-SchemaCompleteEntityType(
    $source-node as node()
) as map:map
{
    json:object()
        (: This line identifies the type of this instance.  Do not change it. :)
        =>i:with(true(), '$type', 'SchemaCompleteEntityType')
        (: This line adds the original source document as an attachment.
         : If this entity type is not the root of a document, you should remove this.
         : If the source document is JSON, you should wrap the $source-node in xdmp:quote()
         : because you cannot preserve JSON nodes with the XML envelope verbatim.
         :)
        =>i:with(true(), '$attachments', $source-node)
        (: The following lines are generated from the SchemaCompleteEntityType entity type 
         : You need to ensure that all of the property paths are correct for your source
         : data to populate instances.
         :)
        =>i:with($source-node/SchemaCompleteEntityType/orderId,'orderId',                                    data($source-node/SchemaCompleteEntityType/orderId))
        =>i:with($source-node/SchemaCompleteEntityType/anyURIKey,'anyURIKey',                                    data($source-node/SchemaCompleteEntityType/anyURIKey))
        =>i:with($source-node/SchemaCompleteEntityType/base64BinaryKey,'base64BinaryKey',                                    data($source-node/SchemaCompleteEntityType/base64BinaryKey))
        =>i:with($source-node/SchemaCompleteEntityType/booleanKey,'booleanKey',                                    data($source-node/SchemaCompleteEntityType/booleanKey))
        =>i:with($source-node/SchemaCompleteEntityType/byteKey,'byteKey',                                    data($source-node/SchemaCompleteEntityType/byteKey))
        =>i:with($source-node/SchemaCompleteEntityType/dateKey,'dateKey',                                    data($source-node/SchemaCompleteEntityType/dateKey))
        =>i:with($source-node/SchemaCompleteEntityType/dateTimeKey,'dateTimeKey',                                    data($source-node/SchemaCompleteEntityType/dateTimeKey))
        =>i:with($source-node/SchemaCompleteEntityType/dayTimeDurationKey,'dayTimeDurationKey',                                    data($source-node/SchemaCompleteEntityType/dayTimeDurationKey))
        =>i:with($source-node/SchemaCompleteEntityType/decimalKey,'decimalKey',                                    data($source-node/SchemaCompleteEntityType/decimalKey))
        =>i:with($source-node/SchemaCompleteEntityType/doubleKey,'doubleKey',                                    data($source-node/SchemaCompleteEntityType/doubleKey))
        =>i:with($source-node/SchemaCompleteEntityType/durationKey,'durationKey',                                    data($source-node/SchemaCompleteEntityType/durationKey))
        =>i:with($source-node/SchemaCompleteEntityType/floatKey,'floatKey',                                    data($source-node/SchemaCompleteEntityType/floatKey))
        =>i:with($source-node/SchemaCompleteEntityType/gDayKey,'gDayKey',                                    data($source-node/SchemaCompleteEntityType/gDayKey))
        =>i:with($source-node/SchemaCompleteEntityType/gMonthKey,'gMonthKey',                                    data($source-node/SchemaCompleteEntityType/gMonthKey))
        =>i:with($source-node/SchemaCompleteEntityType/gMonthDayKey,'gMonthDayKey',                                    data($source-node/SchemaCompleteEntityType/gMonthDayKey))
        =>i:with($source-node/SchemaCompleteEntityType/gYearKey,'gYearKey',                                    data($source-node/SchemaCompleteEntityType/gYearKey))
        =>i:with($source-node/SchemaCompleteEntityType/gYearMonthKey,'gYearMonthKey',                                    data($source-node/SchemaCompleteEntityType/gYearMonthKey))
        =>i:with($source-node/SchemaCompleteEntityType/hexBinaryKey,'hexBinaryKey',                                    data($source-node/SchemaCompleteEntityType/hexBinaryKey))
        =>i:with($source-node/SchemaCompleteEntityType/intKey,'intKey',                                    data($source-node/SchemaCompleteEntityType/intKey))
        =>i:with($source-node/SchemaCompleteEntityType/integerKey,'integerKey',                                    data($source-node/SchemaCompleteEntityType/integerKey))
        =>i:with($source-node/SchemaCompleteEntityType/negativeIntegerKey,'negativeIntegerKey',                                    data($source-node/SchemaCompleteEntityType/negativeIntegerKey))
        =>i:with($source-node/SchemaCompleteEntityType/nonNegativeIntegerKey,'nonNegativeIntegerKey',                                    data($source-node/SchemaCompleteEntityType/nonNegativeIntegerKey))
        =>i:with($source-node/SchemaCompleteEntityType/positiveIntegerKey,'positiveIntegerKey',                                    data($source-node/SchemaCompleteEntityType/positiveIntegerKey))
        =>i:with($source-node/SchemaCompleteEntityType/nonPositiveIntegerKey,'nonPositiveIntegerKey',                                    data($source-node/SchemaCompleteEntityType/nonPositiveIntegerKey))
        =>i:with($source-node/SchemaCompleteEntityType/longKey,'longKey',                                    data($source-node/SchemaCompleteEntityType/longKey))
        =>i:with($source-node/SchemaCompleteEntityType/shortKey,'shortKey',                                    data($source-node/SchemaCompleteEntityType/shortKey))
        =>i:with($source-node/SchemaCompleteEntityType/stringKey,'stringKey',                                    data($source-node/SchemaCompleteEntityType/stringKey))
        =>i:with($source-node/SchemaCompleteEntityType/timeKey,'timeKey',                                    data($source-node/SchemaCompleteEntityType/timeKey))
        =>i:with($source-node/SchemaCompleteEntityType/unsignedByteKey,'unsignedByteKey',                                    data($source-node/SchemaCompleteEntityType/unsignedByteKey))
        =>i:with($source-node/SchemaCompleteEntityType/unsignedIntKey,'unsignedIntKey',                                    data($source-node/SchemaCompleteEntityType/unsignedIntKey))
        =>i:with($source-node/SchemaCompleteEntityType/unsignedLongKey,'unsignedLongKey',                                    data($source-node/SchemaCompleteEntityType/unsignedLongKey))
        =>i:with($source-node/SchemaCompleteEntityType/unsignedShortKey,'unsignedShortKey',                                    data($source-node/SchemaCompleteEntityType/unsignedShortKey))
        =>i:with($source-node/SchemaCompleteEntityType/yearMonthDurationKey,'yearMonthDurationKey',                                    data($source-node/SchemaCompleteEntityType/yearMonthDurationKey))
        =>i:with($source-node/SchemaCompleteEntityType/iriKey,'iriKey',                                    data($source-node/SchemaCompleteEntityType/iriKey))
        =>i:with($source-node/SchemaCompleteEntityType/arrayKey,'arrayKey',                                    json:to-array($source-node/SchemaCompleteEntityType/arrayKey ! data(.)))
        =>i:with($source-node/SchemaCompleteEntityType/arrayStringKey,'arrayStringKey',                                    json:to-array($source-node/SchemaCompleteEntityType/arrayStringKey ! data(.)))
        =>i:with($source-node/SchemaCompleteEntityType/referenceInThisFile,'referenceInThisFile',                                    
            if ($source-node/SchemaCompleteEntityType/referenceInThisFile/element())
            then json:to-array($source-node/SchemaCompleteEntityType/referenceInThisFile ! schemaCompleteEntityType:extract-instance-OrderDetails(.))
            else data($source-node/SchemaCompleteEntityType/referenceInThisFile))
        =>i:with($source-node/SchemaCompleteEntityType/arrayreferenceInThisFile,'arrayreferenceInThisFile',                                    
            if ($source-node/SchemaCompleteEntityType/arrayreferenceInThisFile/element())
            then json:to-array($source-node/SchemaCompleteEntityType/arrayreferenceInThisFile ! schemaCompleteEntityType:extract-instance-OrderDetails(.))
            else data($source-node/SchemaCompleteEntityType/arrayreferenceInThisFile))
        =>i:with($source-node/SchemaCompleteEntityType/externalReference,'externalReference',                                    $source-node/SchemaCompleteEntityType/externalReference/node())
        =>i:with($source-node/SchemaCompleteEntityType/externalArrayReference,'externalArrayReference',                                    $source-node/SchemaCompleteEntityType/externalArrayReference/node())
   
};
    
(:~
 : Creates a map:map representation of an entity instance from some source
 : document.
 : @param $source-node  A document or node that contains data for populating a OrderDetails
 : @return A map:map instance that holds the data for this entity type.
 :)
declare function schemaCompleteEntityType:extract-instance-OrderDetails(
    $source-node as node()
) as map:map
{
    json:object()
        (: This line identifies the type of this instance.  Do not change it. :)
        =>i:with(true(), '$type', 'OrderDetails')
        (: This line adds the original source document as an attachment.
         : If this entity type is not the root of a document, you should remove this.
         : If the source document is JSON, you should wrap the $source-node in xdmp:quote()
         : because you cannot preserve JSON nodes with the XML envelope verbatim.
         :)
        =>i:with(true(), '$attachments', $source-node)
        (: The following lines are generated from the OrderDetails entity type 
         : You need to ensure that all of the property paths are correct for your source
         : data to populate instances.
         :)
        =>i:with($source-node/OrderDetails/quantity, 'quantity',                        data($source-node/OrderDetails/quantity))
        =>i:with($source-node/OrderDetails/productName,'productName',                        data($source-node/OrderDetails/productName))
   
};
    

(:~
 : Turns an entity instance into an XML structure.
 : This out-of-the box implementation traverses a map structure
 : and turns it deterministically into an XML tree.
 : Using this function as-is should be sufficient for most use
 : cases, and will play well with other generated artifacts.
 : @param $entity-instance A map:map instance returned from one of the extract-instance
 :    functions.
 : @return An XML element that encodes the instance.
 :)
declare function schemaCompleteEntityType:instance-to-canonical-xml(
    $entity-instance as map:map
) as element()
{
    (: Construct an element that is named the same as the Entity Type :)
    element { map:get($entity-instance, "$type") }  {
        for $key in map:keys($entity-instance)
        let $instance-property := map:get($entity-instance, $key)
        where ($key castable as xs:NCName and $key ne "$type")
        return
            typeswitch ($instance-property)
            (: This branch handles embedded objects.  You can choose to prune
               an entity's representation of extend it with lookups here. :)
            case json:object+ 
                return
                    for $prop in $instance-property
                    return element { $key } { schemaCompleteEntityType:instance-to-canonical-xml($prop) }
            (: An array can also treated as multiple elements :)
            case json:array
                return 
                    for $val in json:array-values($instance-property)
                    return
                        if ($val instance of json:object)
                        then element { $key } { schemaCompleteEntityType:instance-to-canonical-xml($val) }
                        else element { $key } { $val }
            (: A sequence of values should be simply treated as multiple elements :)
            case item()+
                return 
                    for $val in $instance-property
                    return element { $key } { $val }
            default return element { $key } { $instance-property }
    }
};


(: 
 : Wraps a canonical instance (returned by instance-to-canonical-xml())
 : within an envelope patterned document, along with the source
 : document, which is stored in an attachments section.
 : @param $entity-instance an instance, as returned by an extract-instance
 : function
 : @return A document which wraps both the canonical instance and source docs.
 :)
declare function schemaCompleteEntityType:instance-to-envelope(
    $entity-instance as map:map
) as document-node()
{
    document {
        element es:envelope {
            element es:instance {
                element es:info {
                    element es:title { "SchemaCompleteEntityType" },
                    element es:version { "0.0.1" }
                },
                schemaCompleteEntityType:instance-to-canonical-xml($entity-instance)
            },
            element es:attachments {
                map:get($entity-instance, "$attachments") 
            }
        }
    }
};
