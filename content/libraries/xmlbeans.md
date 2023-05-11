title=Apache XMLBeans
tags=library, jvm, xml, xsd
summary=A technology for accessing XML by binding it to Java types.
~~~~~~

[Website](https://xmlbeans.apache.org/) | [Source](https://xmlbeans.apache.org/samples/index.html) | [Docs](https://xmlbeans.apache.org/documentation/index.html)

### Getting Started Tutorial

Given this XSD (`easypo.xsd`):
```
<xs:schema
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:po="http://openuri.org/easypo"
    targetNamespace="http://openuri.org/easypo"
    elementFormDefault="qualified">
    <xs:element name="purchase-order">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="customer" type="po:customer"/>
                <xs:element name="date" type="xs:dateTime"/>
                <xs:element name="line-item" type="po:line-item" minOccurs="0" maxOccurs="unbounded"/>
                <xs:element name="shipper" type="po:shipper" minOccurs="0" maxOccurs="1"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>
    <xs:complexType name="customer">
        <xs:sequence>
            <xs:element name="name" type="xs:string"/>
            <xs:element name="address" type="xs:string"/>
        </xs:sequence>
        <xs:attribute name="age" type="xs:int"/>
        <xs:attribute name="moo" type="xs:int" default="100"/>
        <xs:attribute name="poo" type="xs:int" fixed="200"/>
    </xs:complexType>
    <xs:complexType name="line-item">
        <xs:sequence>
            <xs:element name="description" type="xs:string"/>
            <xs:element name="per-unit-ounces" type="xs:decimal"/>
            <xs:element name="price" type="xs:decimal"/>
            <xs:element name="quantity" type="xs:integer"/>
        </xs:sequence>
    </xs:complexType>
    <xs:complexType name="shipper">
        <xs:sequence>
            <xs:element name="name" type="xs:string"/>
            <xs:element name="per-ounce-rate" type="xs:decimal"/>
        </xs:sequence>
    </xs:complexType>
</xs:schema>
```

... and this document, which should be valid according to the `easypo.xsd` schema:
```
<purchase-order xmlns="http://openuri.org/easypo">
    <customer>
        <name>Gladys Kravitz</name>
        <address>Anytown, PA</address>
    </customer>
    <date>2003-01-07T14:16:00-05:00</date>
    <line-item>
        <description>Burnham's Celestial Handbook, Vol 1</description>
        <per-unit-ounces>5</per-unit-ounces>
        <price>21.79</price>
        <quantity>2</quantity>
    </line-item>
    <line-item>
        <description>Burnham's Celestial Handbook, Vol 2</description>
        <per-unit-ounces>5</per-unit-ounces>
        <price>19.89</price>
        <quantity>2</quantity>
    </line-item>
    <shipper>
        <name>ZipShip</name>
        <per-ounce-rate>0.74</per-ounce-rate>
    </shipper>
</purchase-order>
```

... generate a Java JAR file of code to bind the above document like so: `scomp -out tutorials\gettingstarted\lib\easypo.jar schemas\easypo\easypo.xsd`

... then we can write the following Java to update a PO:
```
import java.io.*;
import java.math.*;
import org.apache.xmlbeans.*;
import org.apache.easypo.*;

public class POUpdater
{
    public static void main(String[] args)
    {
        File poXmlFile = new File(args[0]);
        String updatedPoXml = addLineItem(poXmlFile, args[1], args[2],
            args[3], args[4]);
        System.out.println(updatedPoXml);
    }
    private static String addLineItem(File purchaseOrder, String itemDescription,
                                      String perUnitOuncesString,
                                      String itemPriceString, String itemQuantityString)
    {
        PurchaseOrderDocument poDoc = null;
        try
        {
            // Bind the incoming XML to an XMLBeans type.
            poDoc = PurchaseOrderDocument.Factory.parse(purchaseOrder);
        } catch (XmlException e)
        {
            e.printStackTrace();
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        // Convert incoming data to types that can be used in accessors.
        BigDecimal perUnitOunces = new BigDecimal(perUnitOuncesString);
        BigDecimal itemPrice = new BigDecimal(itemPriceString);
        BigInteger itemQuantity = new BigInteger(itemQuantityString);
        // Add the new <line-item> element.
        LineItem newItem = poDoc.getPurchaseOrder().addNewLineItem();
        newItem.setDescription(itemDescription);
        newItem.setPerUnitOunces(perUnitOunces);
        newItem.setPrice(itemPrice);
        newItem.setQuantity(itemQuantity);
        return poDoc.toString();
    }
}
```
