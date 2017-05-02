xquery version '1.0-ml';
module namespace sameTgt-from-sameSrc
    = 'http://marklogic.com/sameSrcTgt/sameTgt-0.0.2-from-sameSrc-0.0.1';

import module namespace es = 'http://marklogic.com/entity-services'
    at '/MarkLogic/entity-services/entity-services.xqy';

declare option xdmp:mapping 'false';

(:
 This module was generated by MarkLogic Entity Services.
 Its purpose is to create instances of entity types
 defined in
 sameTgt, version 0.0.2
 from documents that were persisted according to model
 sameSrc, version 0.0.1

 Modification History:
 Generated at timestamp: 2016-12-02T14:15:45.023386-08:00
 Persisted by AUTHOR
 Date: DATE

 Target Model sameTgt-0.0.2 Info:

 Type Customer: 
    primaryKey: CustomerID, ( in source: CustomerID )
    required: None, ( in source: None )
    range indexes: None, ( in source: None )
    word lexicons: None, ( in source: None )
 
 Type Product: 
    primaryKey: None, ( in source: None )
    required: None, ( in source: None )
    range indexes: None, ( in source: None )
    word lexicons: None, ( in source: None )
 
:)


(:~
 : Creates a map:map instance representation of the target
 : entity type Customer from an envelope document
 : containing a source entity instance, that is, instance data
 : of type Customer, version 0.0.1.
 : @param $source  An Entity Services envelope document (<es:envelope>)
 :  or a canonical XML instance of type Customer.
 : @return A map:map instance that holds the data for Customer,
 :  version 0.0.2.
 :)

declare function sameTgt-from-sameSrc:convert-instance-Customer(
    $source as node()
) as map:map
{
    let $source-node := sameTgt-from-sameSrc:init-source($source, 'Customer')

    return
    json:object()
    (: If the source is an envelope or part of an envelope document,
     : copies attachments to the target
     :)
    =>sameTgt-from-sameSrc:copy-attachments($source-node)
    (: The following line identifies the type of this instance.  Do not change it. :)
    =>map:with("$type", "Customer")
    (: The following lines are generated from the "Customer" entity type. :)    =>   map:with('CustomerID',             xs:string($source-node/CustomerID))
    =>es:optional('CompanyName',            xs:string($source-node/CompanyName))
    =>es:optional('Country',                xs:string($source-node/Country))
    =>es:optional('ContactName',            xs:string($source-node/ContactName))

};
    
(:~
 : Creates a map:map instance representation of the target
 : entity type Product from an envelope document
 : containing a source entity instance, that is, instance data
 : of type Product, version 0.0.1.
 : @param $source  An Entity Services envelope document (<es:envelope>)
 :  or a canonical XML instance of type Product.
 : @return A map:map instance that holds the data for Product,
 :  version 0.0.2.
 :)

declare function sameTgt-from-sameSrc:convert-instance-Product(
    $source as node()
) as map:map
{
    let $source-node := sameTgt-from-sameSrc:init-source($source, 'Product')

    return
    json:object()
    (: If the source is an envelope or part of an envelope document,
     : copies attachments to the target
     :)
    =>sameTgt-from-sameSrc:copy-attachments($source-node)
    (: The following line identifies the type of this instance.  Do not change it. :)
    =>map:with("$type", "Product")
    (: The following lines are generated from the "Product" entity type. :)    =>es:optional('ProductName',            xs:string($source-node/ProductName))
    =>es:optional('UnitPrice',              xs:integer($source-node/UnitPrice))
    =>es:optional('SupplierID',             xs:integer($source-node/SupplierID))
    =>es:optional('Discontinued',           xs:boolean($source-node/Discontinued))

};
    


declare private function sameTgt-from-sameSrc:init-source(
    $source as node()*,
    $entity-type-name as xs:string
) as node()*
{
    if ( ($source//es:instance/element()[node-name(.) eq xs:QName($entity-type-name)]))
    then $source//es:instance/element()[node-name(.) eq xs:QName($entity-type-name)]
    else $source
};


declare private function sameTgt-from-sameSrc:copy-attachments(
    $instance as json:object,
    $source as node()*
) as json:object
{
    $instance
    =>es:optional('$attachments',
        $source ! fn:root(.)/es:envelope/es:attachments/node())
};