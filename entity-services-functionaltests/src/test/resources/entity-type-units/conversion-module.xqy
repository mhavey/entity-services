xquery version '1.0-ml';

(:
 This module was generated by MarkLogic Entity Services.
 The source model was et-required-0.0.1

 For usage and extension points, see the Entity Services Developer's Guide

 https://docs.marklogic.com/guide/entity-services

 After modifying this file, put it in your project for deployment to the modules
 database of your application, and check it into your source control system.

 Generated at timestamp: 2017-07-12T16:28:06.14734-07:00
 :)

module namespace et-required
    = 'http://baloo/et-required-0.0.1';

import module namespace es = 'http://marklogic.com/entity-services'
    at '/MarkLogic/entity-services/entity-services.xqy';

declare option xdmp:mapping 'false';


(:~
 : Extracts instance data, as a map:map, from some source document.
 : @param $source-node  A document or node that contains
 :   data for populating a ETOne
 : @return A map:map instance with extracted data and
 :   metadata about the instance.
 :)
declare function et-required:extract-instance-ETOne(
    $source as item()?
) as map:map
{
    let $source-node := es:init-source($source, 'ETOne')
    (: begin customizations here :)
    let $a  :=             $source-node/a ! xs:integer(.)
    let $b  :=             $source-node/b ! xs:string(.)
    let $c  :=             $source-node/c ! xs:date(.)
    (: end customizations :)

    let $instance := es:init-instance($source-node, 'ETOne')
    (: Comment or remove the following line to suppress attachments :)
        =>es:add-attachments($source-node, $source)

    return
    if (empty($source-node/*)) 
    then $instance
    else $instance
        =>   map:with('a', $a)
        =>   map:with('b', $b)
        =>es:optional('c', $c)
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
declare function et-required:instance-to-canonical-xml(
    $entity-instance as map:map
) as element()
{
    (: Construct an element that is named the same as the Entity Type :)
    element { map:get($entity-instance, '$type') }  {
        if ( map:contains($entity-instance, '$ref') )
        then map:get($entity-instance, '$ref')
        else
            for $key in map:keys($entity-instance)
            let $instance-property := map:get($entity-instance, $key)
            where ($key castable as xs:NCName)
            return
                typeswitch ($instance-property)
                (: This branch handles embedded objects.  You can choose to prune
                   an entity's representation of extend it with lookups here. :)
                case json:object+
                    return
                        for $prop in $instance-property
                        return element { $key } { et-required:instance-to-canonical-xml($prop) }
                (: An array can also treated as multiple elements :)
                case json:array
                    return
                        for $val in json:array-values($instance-property)
                        return
                            if ($val instance of json:object)
                            then element { $key } {
                                attribute datatype { 'array' },
                                et-required:instance-to-canonical-xml($val) }
                            else element { $key } {
                                attribute datatype { 'array' },
                                $val }
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
declare function et-required:instance-to-envelope(
    $entity-instance as map:map
) as document-node()
{
    document {
        element es:envelope {
            element es:instance {
                element es:info {
                    element es:title { map:get($entity-instance,'$type') },
                    element es:version { '0.0.1' }
                },
                et-required:instance-to-canonical-xml($entity-instance)
            },
            element es:attachments {
                map:get($entity-instance, '$attachments')
            }
        }
    }
};