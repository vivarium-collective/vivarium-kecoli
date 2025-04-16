<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.44 (Build 295) (http://www.copasi.org) at 2025-04-16T21:06:13Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="44" versionDevel="295" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_13" name="Mass action (irreversible)" type="MassAction" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_13">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000163" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
<b>Mass action rate law for irreversible reactions</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does not include any reverse process that creates the reactants from the products. The change of a product quantity is proportional to the quantity of one reactant.
</p>
</body>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i>
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_80" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_81" name="substrate" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_14" name="Mass action (reversible)" type="MassAction" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_14">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000042" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
<b>Mass action rate law for reversible reactions</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does include a reverse process that creates the reactants from the products.
</p>
</body>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i>-k2*PRODUCT&lt;product_j>
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_69" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_68" name="substrate" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_78" name="k2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_79" name="product" order="3" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="Function for PGK" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T08:49:30Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(MgADP*BPG-MgATP*PGA3/Keq)/(KmADPMg*KmBPG)/(1+MgADP/KmADPMg+BPG/KmBPG+MgADP/KmADPMg*BPG/KmBPG+MgATP/KmATPMg+PGA3/KmPGA3+MgATP/KmATPMg*PGA3/KmPGA3)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_280" name="BPG" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_279" name="Keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_278" name="KmADPMg" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_277" name="KmATPMg" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_276" name="KmBPG" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_266" name="KmPGA3" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_272" name="MgADP" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_273" name="MgATP" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_274" name="PGA3" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_275" name="Vmax" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="Function for TPI" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_42">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(DAP-GAP/Keq)/KmDAP/(1+DAP/KmDAP+GAP/KmGAP)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_286" name="DAP" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_285" name="GAP" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_284" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_283" name="KmDAP" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_282" name="KmGAP" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_281" name="Vmax" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="Function for GDH" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_44">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:43:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(P*GAP*NAD-BPG*NADH/Keq)/(KmP*KmGAP*KmNAD)/((1+P/KmP)*(1+GAP/KmGAP)*(1+NAD/KmNAD)+(1+BPG/KmBPG)*(1+NADH/KmNADH)-1)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_308" name="BPG" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_307" name="GAP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_306" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_305" name="KmBPG" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_304" name="KmGAP" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_303" name="KmNAD" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_302" name="KmNADH" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_301" name="KmP" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_300" name="NAD" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_299" name="NADH" order="9" role="product"/>
        <ParameterDescription key="FunctionParameter_298" name="P" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_297" name="Vmax" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Function for FBA" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-12-29T22:00:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(FDP-DAP*GAP/Keq)/KmFDP/(1+FDP/KmFDP+DAP/KmDAP+DAP/KmDAP*(GAP/KmGAP)+PEP/KmPEP)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_318" name="DAP" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_317" name="FDP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_316" name="GAP" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_315" name="Keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_314" name="KmDAP" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_313" name="KmFDP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_312" name="KmGAP" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_311" name="KmPEP" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_310" name="PEP" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_309" name="Vmax" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Function for PFK" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_46">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-12-29T22:03:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*n*(MgATP*F6P-MgADP*FDP/Keq)/(KirF6P*KmrATPMg)/(1+KmrFDP/KirFDP*(MgADP/KmrADP)+KmrF6P/KirF6P*(MgATP/KmrATPMg)+KmrFDP/KirFDP*(MgADP/KmrADP)*(F6P/KirF6P)+MgATP/KmrATPMg*(F6P/KirF6P)+MgADP/KirADP*(MgATP/KmrATPMg)*(F6P/KirF6P)+(1+(ATP-MgATP)/KirATP)*(F6P/KirF6P)+FDP/KirFDP+MgADP/KmrADP*(FDP/KirFDP)+KmrF6P/KirF6P*(MgATP/KmrATPMg)*(FDP/KirFDP)+Wr*(KmrF6P/KirF6P)*(MgADP/KirADP)*(MgATP/KmrATPMg)*(FDP/KmrFDP))/(1+L0*((1+KmtFDP/KitFDP*(MgADP/KmtADP)+KmtF6P/KitF6P*(MgATP/KmtATPMg)+KmtFDP/KitFDP*(MgADP/KmtADP)*(F6P/KitF6P)+MgATP/KmtATPMg*(F6P/KitF6P)+MgADP/KitADP*(MgATP/KmtATPMg)*(F6P/KitF6P)+(1+(ATP-MgATP)/KitATP)*(F6P/KitF6P)+FDP/KitFDP+MgADP/KmtADP*(FDP/KitFDP)+KmtF6P/KitF6P*(MgATP/KmtATPMg)*(FDP/KitFDP)+Wt*(KmtF6P/KitF6P)*(MgADP/KitADP)*(MgATP/KmtATPMg)*(FDP/KmtFDP))*(1+MgADP/KeftADP+PEP/KeftPEP+MgADP/KeftADP*(PEP/KeftPEP))/((1+KmrFDP/KirFDP*(MgADP/KmrADP)+KmrF6P*MgATP/(KirF6P*KmrATPMg)+KmrFDP/KirFDP*(MgADP/KmrADP)*(F6P/KirF6P)+MgATP/KmrATPMg*(F6P/KirF6P)+MgADP/KirADP*(MgATP/KmrATPMg)*(F6P/KirF6P)+(1+(ATP-MgATP)/KirATP)*(F6P/KirF6P)+FDP/KirFDP+MgADP/KmrADP*(FDP/KirFDP)+KmrF6P/KirF6P*(MgATP/KmrATPMg)*(FDP/KirFDP)+Wr*(KmrF6P/KirF6P)*(MgADP/KirADP)*(MgATP/KmrATPMg)*(FDP/KmrFDP))*(1+MgADP/KefrADP+PEP/KefrPEP+MgADP/KefrADP*(PEP/KefrPEP))))^n)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_350" name="ATP" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_349" name="F6P" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_348" name="FDP" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_347" name="KefrADP" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_346" name="KefrPEP" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_345" name="KeftADP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_344" name="KeftPEP" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_343" name="Keq" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_342" name="KirADP" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_341" name="KirATP" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_340" name="KirF6P" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_339" name="KirFDP" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_338" name="KitADP" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_337" name="KitATP" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_336" name="KitF6P" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_335" name="KitFDP" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_334" name="KmrADP" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_333" name="KmrATPMg" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_332" name="KmrF6P" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_331" name="KmrFDP" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_330" name="KmtADP" order="20" role="constant"/>
        <ParameterDescription key="FunctionParameter_329" name="KmtATPMg" order="21" role="constant"/>
        <ParameterDescription key="FunctionParameter_328" name="KmtF6P" order="22" role="constant"/>
        <ParameterDescription key="FunctionParameter_327" name="KmtFDP" order="23" role="constant"/>
        <ParameterDescription key="FunctionParameter_326" name="L0" order="24" role="constant"/>
        <ParameterDescription key="FunctionParameter_325" name="MgADP" order="25" role="modifier"/>
        <ParameterDescription key="FunctionParameter_324" name="MgATP" order="26" role="modifier"/>
        <ParameterDescription key="FunctionParameter_323" name="PEP" order="27" role="modifier"/>
        <ParameterDescription key="FunctionParameter_322" name="Vmax" order="28" role="constant"/>
        <ParameterDescription key="FunctionParameter_321" name="Wr" order="29" role="constant"/>
        <ParameterDescription key="FunctionParameter_320" name="Wt" order="30" role="constant"/>
        <ParameterDescription key="FunctionParameter_319" name="n" order="31" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="Function for ENO" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_47">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(PGA2-PEP/Keq)/KmPGA2/(1+PGA2/KmPGA2+PEP/KmPEP)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_356" name="Keq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_355" name="KmPEP" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_354" name="KmPGA2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_353" name="PEP" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_352" name="PGA2" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_351" name="Vmax" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="Function for PYK" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_48">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T08:51:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*n*PEP*MgADP/(KirPEP*KmrADPMg)/(1+KmrPEP/KirPEP*(MgADP/KmrADPMg)+MgATP/KirATP+MgADP/KmrADPMg*(PEP/KirPEP)+KmrADPMg/KmrADPMg*(1+(ADP-MgADP)/KirADP)*(PEP/KirPEP)+PYR/KirPYR+MgATP/KirPyrATP*(PYR/KirPYR))/(1+L0*((1+KmtPEP/KitPEP*(MgADP/KmtADPMg)+MgATP/KitATP+MgADP*PEP/(KitPEP*KmtADPMg)+(1+(ADP-MgADP)/KitADP)*(PEP/KitPEP)+PYR/KitPYR+MgATP/KitPyrATP*(PYR/KitPYR))*(1+SUCCOA/KeftSUCCOA+MgATP*SUCCOA/(KeftATP*KeftSUCCOA))/((1+KmrPEP/KirPEP*(MgADP/KmrADPMg)+MgATP/KirATP+MgADP/KmrADPMg*(PEP/KirPEP)+(1+(ADP-MgADP)/KirADP)*(PEP/KirPEP)+PYR/KirPYR+MgATP/KirPyrATP*(PYR/KirPYR))*(1+FDP/KefrFDP+G6P/KefrG6P+GL6P/KefrGL6P+R5P/KefrR5P+RU5P/KefrRU5P+S7P/KefrS7P+X5P/KefrX5P)))^n)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_395" name="ADP" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_394" name="FDP" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_393" name="G6P" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_392" name="GL6P" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_391" name="KefrFDP" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_390" name="KefrG6P" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_389" name="KefrGL6P" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_388" name="KefrR5P" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_387" name="KefrRU5P" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_386" name="KefrS7P" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_385" name="KefrX5P" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_384" name="KeftATP" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_383" name="KeftSUCCOA" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_382" name="KirADP" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_381" name="KirATP" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_380" name="KirPEP" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_379" name="KirPYR" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_378" name="KirPyrATP" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_377" name="KitADP" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_376" name="KitATP" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_375" name="KitPEP" order="20" role="constant"/>
        <ParameterDescription key="FunctionParameter_374" name="KitPYR" order="21" role="constant"/>
        <ParameterDescription key="FunctionParameter_373" name="KitPyrATP" order="22" role="constant"/>
        <ParameterDescription key="FunctionParameter_372" name="KmrADPMg" order="23" role="constant"/>
        <ParameterDescription key="FunctionParameter_371" name="KmrPEP" order="24" role="constant"/>
        <ParameterDescription key="FunctionParameter_370" name="KmtADPMg" order="25" role="constant"/>
        <ParameterDescription key="FunctionParameter_369" name="KmtPEP" order="26" role="constant"/>
        <ParameterDescription key="FunctionParameter_368" name="L0" order="27" role="constant"/>
        <ParameterDescription key="FunctionParameter_367" name="MgADP" order="28" role="modifier"/>
        <ParameterDescription key="FunctionParameter_366" name="MgATP" order="29" role="modifier"/>
        <ParameterDescription key="FunctionParameter_365" name="PEP" order="30" role="substrate"/>
        <ParameterDescription key="FunctionParameter_364" name="PYR" order="31" role="product"/>
        <ParameterDescription key="FunctionParameter_363" name="R5P" order="32" role="modifier"/>
        <ParameterDescription key="FunctionParameter_362" name="RU5P" order="33" role="modifier"/>
        <ParameterDescription key="FunctionParameter_361" name="S7P" order="34" role="modifier"/>
        <ParameterDescription key="FunctionParameter_360" name="SUCCOA" order="35" role="modifier"/>
        <ParameterDescription key="FunctionParameter_359" name="Vmax" order="36" role="constant"/>
        <ParameterDescription key="FunctionParameter_358" name="X5P" order="37" role="modifier"/>
        <ParameterDescription key="FunctionParameter_357" name="n" order="38" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_49" name="Function for GPM" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-13T10:20:43Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(PGA3-PGA2/Keq)/KmPGA3/(1+PGA3/KmPGA3+PGA2/KmPGA2)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_401" name="Keq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_400" name="KmPGA2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_399" name="KmPGA3" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_398" name="PGA2" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_397" name="PGA3" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_396" name="Vmax" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_50" name="Function for ZWF" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_50">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(G6P*NADP-GL6P*NADPH/Keq)/(KdG6P*KmNADP)/(1+G6P/KdG6P+KmG6P/KdG6P*(NADP/KmNADP)+G6P/KdG6P*(NADP/KmNADP)+KmGL6P/KdGL6P*(NADPH/KmNADPH)+GL6P/KdGL6P*(NADPH/KmNADPH))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_413" name="G6P" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_412" name="GL6P" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_411" name="KdG6P" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_410" name="KdGL6P" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_409" name="Keq" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_408" name="KmG6P" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_407" name="KmGL6P" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_406" name="KmNADP" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_405" name="KmNADPH" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_404" name="NADP" order="9" role="substrate"/>
        <ParameterDescription key="FunctionParameter_403" name="NADPH" order="10" role="product"/>
        <ParameterDescription key="FunctionParameter_402" name="Vmax" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="Function for PGL" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_51">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-12-29T22:03:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(GL6P-PGN/Keq)/KmGL6P/(1+GL6P/KmGL6P+PGN/KmPGN+G6P/KiG6P)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_421" name="G6P" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_420" name="GL6P" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_419" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_418" name="KiG6P" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_417" name="KmGL6P" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_416" name="KmPGN" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_415" name="PGN" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_414" name="Vmax" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_52" name="Function for GND" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_52">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:50:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(NADP*PGN-NADPH*RU5P*HCO3/Keq)/(KdNADP*KmPGN)/(1+NADP/KdNADP+FDP/KefFbP+NADP/KdNADP*(FDP/KefNADPFbP)+KmNADP/KdNADP*(PGN/KmPGN)+NADP/KdNADP*(PGN/KmPGN)+ATP/KefATP+ATP/KefNADPATP*(KmNADP/KdNADP)*(PGN/KmPGN)+HCO3/KdHCO3+NADPH/KdNADPH+RU5P/KdRu5P+HCO3/KdHCO3*(NADPH/KdHCO3NADPH)+HCO3/KdHCO3*(KmNADPH/KdHCO3NADPH)*(RU5P/KmRU5P)+HCO3/KdHCO3*(NADPH/KdHCO3NADPH)*(RU5P/KmRU5P)+KmHCO3/KdHCO3*(NADPH/KdHCO3NADPH)*(RU5P/KmRU5P))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_444" name="ATP" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_443" name="FDP" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_442" name="HCO3" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_441" name="KdHCO3" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_440" name="KdHCO3NADPH" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_439" name="KdNADP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_438" name="KdNADPH" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_437" name="KdRu5P" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_436" name="KefATP" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_435" name="KefFbP" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_434" name="KefNADPATP" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_433" name="KefNADPFbP" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_432" name="Keq" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_431" name="KmHCO3" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_430" name="KmNADP" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_429" name="KmNADPH" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_428" name="KmPGN" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_427" name="KmRU5P" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_426" name="NADP" order="18" role="substrate"/>
        <ParameterDescription key="FunctionParameter_425" name="NADPH" order="19" role="product"/>
        <ParameterDescription key="FunctionParameter_424" name="PGN" order="20" role="substrate"/>
        <ParameterDescription key="FunctionParameter_423" name="RU5P" order="21" role="product"/>
        <ParameterDescription key="FunctionParameter_422" name="Vmax" order="22" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_53" name="Function for RPE" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_53">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(RU5P-X5P/Keq)/KmRU5P/(1+RU5P/KmRU5P+X5P/KmX5P)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_450" name="Keq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_449" name="KmRU5P" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_448" name="KmX5P" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_447" name="RU5P" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_446" name="Vmax" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_445" name="X5P" order="5" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_54" name="Function for RPI" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_54">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(RU5P-R5P/Keq)/KmRU5P/(1+RU5P/KmRU5P+R5P/KmR5P+E4P/KmE4P)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_458" name="E4P" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_457" name="Keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_456" name="KmE4P" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_455" name="KmR5P" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_454" name="KmRU5P" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_453" name="R5P" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_452" name="RU5P" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_451" name="Vmax" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_55" name="Function for X5P_GAP_TKT" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_55">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-31T12:39:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kcat*(tkt*X5P-GAP*tktC2/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_464" name="GAP" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_463" name="Keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_462" name="X5P" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_461" name="kcat" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_460" name="tkt" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_459" name="tktC2" order="5" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_56" name="Function for F6P_E4P_TKT" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_56">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-12-29T22:00:24Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kcat*(E4P*tktC2-F6P*tkt/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_470" name="E4P" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_469" name="F6P" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_468" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_467" name="kcat" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_466" name="tkt" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_465" name="tktC2" order="5" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_57" name="Function for S7P_R5P_TKT" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_57">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kcat*(R5P*tktC2-S7P*tkt/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_476" name="Keq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_475" name="R5P" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_474" name="S7P" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_473" name="kcat" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_472" name="tkt" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_471" name="tktC2" order="5" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_58" name="Function for F6P_GAP_TAL" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_58">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-12-29T22:00:25Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kcat*(GAP*talC3-F6P*tal/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_482" name="F6P" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_481" name="GAP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_480" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_479" name="kcat" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_478" name="tal" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_477" name="talC3" order="5" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_59" name="Function for S7P_E4P_TAL" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_59">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kcat*(S7P*tal-E4P*talC3/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_488" name="E4P" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_487" name="Keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_486" name="S7P" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_485" name="kcat" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_484" name="tal" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_483" name="talC3" order="5" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_60" name="Function for FBP" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_60">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:42:50Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*n*MgFDP/KirFDPMg/(1+KmrFDP/KirFDP*(MG/KmrMg)+P/KirP+P/KirP*(MG/KirPMg)+F6P/KirF6P+F6P/KirF6P*(MG/KirF6PMg)+P/KirP*(F6P/KirPF6P)+P/KirP*(F6P/KirPF6P)*(MG/KirPF6PMg)+(FDP-MgFDP)/KirFDP+KdFDPMg/KmrMg*(MgFDP/KirFDP)+AMP/KirAMP+MgFDP/KirFDPMg+MgFDP/KirFDPMg*(MG/KirFDPMgMg)+AMP/KirAMP*((FDP-MgFDP)/KirAMPFDP))/(1+L0*((1+KmtFDP/KitFDP*(MG/KmtMg)+P/KitP+P/KitP*(MG/KitPMg)+F6P/KitF6P+F6P/KitF6P*(MG/KitF6PMg)+P/KitP*(F6P/KitPF6P)+P/KitP*(F6P/KitPF6P)*(MG/KitPF6PMg)+(FDP-MgFDP)/KitFDP+KdFDPMg/KmtMg*(MgFDP/KitFDP)+AMP/KitAMP+MgFDP/KitFDPMg+MgFDP/KitFDPMg*(MG/KitFDPMgMg)+AMP/KitAMP*((FDP-MgFDP)/KitAMPFDP))/(1+KmrFDP/KirFDP*(MG/KmrMg)+P/KirP+P/KirP*(MG/KirPMg)+F6P/KirF6P+F6P/KirF6P*(MG/KirF6PMg)+P/KirP*(F6P/KirPF6P)+P/KirP*(F6P/KirPF6P)*(MG/KirPF6PMg)+(FDP-MgFDP)/KirFDP+KdFDPMg/KmrMg*(MgFDP/KirFDP)+AMP/KirAMP+MgFDP/KirFDPMg+MgFDP/KirFDPMg*(MG/KirFDPMgMg)+AMP/KirAMP*((FDP-MgFDP)/KirAMPFDP)))^n)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_524" name="AMP" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_523" name="F6P" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_522" name="FDP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_521" name="KdFDPMg" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_520" name="KirAMP" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_519" name="KirAMPFDP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_518" name="KirF6P" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_517" name="KirF6PMg" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_516" name="KirFDP" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_515" name="KirFDPMg" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_514" name="KirFDPMgMg" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_513" name="KirP" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_512" name="KirPF6P" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_511" name="KirPF6PMg" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_510" name="KirPMg" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_509" name="KitAMP" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_508" name="KitAMPFDP" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_507" name="KitF6P" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_506" name="KitF6PMg" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_505" name="KitFDP" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_504" name="KitFDPMg" order="20" role="constant"/>
        <ParameterDescription key="FunctionParameter_503" name="KitFDPMgMg" order="21" role="constant"/>
        <ParameterDescription key="FunctionParameter_502" name="KitP" order="22" role="constant"/>
        <ParameterDescription key="FunctionParameter_501" name="KitPF6P" order="23" role="constant"/>
        <ParameterDescription key="FunctionParameter_500" name="KitPF6PMg" order="24" role="constant"/>
        <ParameterDescription key="FunctionParameter_499" name="KitPMg" order="25" role="constant"/>
        <ParameterDescription key="FunctionParameter_498" name="KmrFDP" order="26" role="constant"/>
        <ParameterDescription key="FunctionParameter_497" name="KmrMg" order="27" role="constant"/>
        <ParameterDescription key="FunctionParameter_496" name="KmtFDP" order="28" role="constant"/>
        <ParameterDescription key="FunctionParameter_495" name="KmtMg" order="29" role="constant"/>
        <ParameterDescription key="FunctionParameter_494" name="L0" order="30" role="constant"/>
        <ParameterDescription key="FunctionParameter_493" name="MG" order="31" role="modifier"/>
        <ParameterDescription key="FunctionParameter_492" name="MgFDP" order="32" role="modifier"/>
        <ParameterDescription key="FunctionParameter_491" name="P" order="33" role="product"/>
        <ParameterDescription key="FunctionParameter_490" name="Vmax" order="34" role="constant"/>
        <ParameterDescription key="FunctionParameter_489" name="n" order="35" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_61" name="Function for PPC" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_61">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:43:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*n*(PEP*HCO3-OAA*P/Keq)/(KdrPEP*KmrHCO3)/(1+KmrPEP/KdrPEP*(HCO3/KmrHCO3)+KmrOAA/KdrOAA*(P/KmrP)+OAA/KdrOAA+P/KmrP*(OAA/KdrOAA)+HCO3/KmrHCO3*(PEP/KdrPEP)+PEP/KdrPEP)/(1+L0*((1+ACCOA/KeftACCOA+FDP/KeftFDP+FDP/KeftFDP*(ACCOA/KeftFDPACCOA))*(1+KmtPEP/KdtPEP*(HCO3/KmtHCO3)+KmtOAA/KdtOAA*(P/KmtP)+OAA/KdtOAA+P/KmtP*(OAA/KdtOAA)+HCO3/KmtHCO3*(PEP/KdtPEP)+PEP/KdtPEP)*(1+ASP/KeftASP+CYS/KeftCYS+CIT/KeftCIT+FUM/KeftFUM+MAL/KeftMAL+SUC/KeftSUC)/((1+ACCOA/KefrACCOA+FDP/KefrFDP+FDP/KefrFDP*(ACCOA/KefrFDPACCOA))*(1+KmrPEP/KdrPEP*(HCO3/KmrHCO3)+KmrOAA/KdrOAA*(P/KmrP)+OAA/KdrOAA+P/KmrP*(OAA/KdrOAA)+HCO3/KmrHCO3*(PEP/KdrPEP)+PEP/KdrPEP)*(1+ASP/KefrASP+CYS/KefrCYS+CIT/KefrCIT+FUM/KefrFUM+MAL/KefrMAL+SUC/KefrSUC)))^n)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_570" name="ACCOA" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_569" name="ASP" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_568" name="CIT" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_567" name="CYS" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_566" name="FDP" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_565" name="FUM" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_564" name="HCO3" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_563" name="KdrOAA" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_562" name="KdrPEP" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_561" name="KdtOAA" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_560" name="KdtPEP" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_559" name="KefrACCOA" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_558" name="KefrASP" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_557" name="KefrCIT" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_556" name="KefrCYS" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_555" name="KefrFDP" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_554" name="KefrFDPACCOA" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_553" name="KefrFUM" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_552" name="KefrMAL" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_551" name="KefrSUC" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_550" name="KeftACCOA" order="20" role="constant"/>
        <ParameterDescription key="FunctionParameter_549" name="KeftASP" order="21" role="constant"/>
        <ParameterDescription key="FunctionParameter_548" name="KeftCIT" order="22" role="constant"/>
        <ParameterDescription key="FunctionParameter_547" name="KeftCYS" order="23" role="constant"/>
        <ParameterDescription key="FunctionParameter_546" name="KeftFDP" order="24" role="constant"/>
        <ParameterDescription key="FunctionParameter_545" name="KeftFDPACCOA" order="25" role="constant"/>
        <ParameterDescription key="FunctionParameter_544" name="KeftFUM" order="26" role="constant"/>
        <ParameterDescription key="FunctionParameter_543" name="KeftMAL" order="27" role="constant"/>
        <ParameterDescription key="FunctionParameter_542" name="KeftSUC" order="28" role="constant"/>
        <ParameterDescription key="FunctionParameter_541" name="Keq" order="29" role="constant"/>
        <ParameterDescription key="FunctionParameter_540" name="KmrHCO3" order="30" role="constant"/>
        <ParameterDescription key="FunctionParameter_539" name="KmrOAA" order="31" role="constant"/>
        <ParameterDescription key="FunctionParameter_538" name="KmrP" order="32" role="constant"/>
        <ParameterDescription key="FunctionParameter_537" name="KmrPEP" order="33" role="constant"/>
        <ParameterDescription key="FunctionParameter_536" name="KmtHCO3" order="34" role="constant"/>
        <ParameterDescription key="FunctionParameter_535" name="KmtOAA" order="35" role="constant"/>
        <ParameterDescription key="FunctionParameter_534" name="KmtP" order="36" role="constant"/>
        <ParameterDescription key="FunctionParameter_533" name="KmtPEP" order="37" role="constant"/>
        <ParameterDescription key="FunctionParameter_532" name="L0" order="38" role="constant"/>
        <ParameterDescription key="FunctionParameter_531" name="MAL" order="39" role="modifier"/>
        <ParameterDescription key="FunctionParameter_530" name="OAA" order="40" role="product"/>
        <ParameterDescription key="FunctionParameter_529" name="P" order="41" role="product"/>
        <ParameterDescription key="FunctionParameter_528" name="PEP" order="42" role="substrate"/>
        <ParameterDescription key="FunctionParameter_527" name="SUC" order="43" role="modifier"/>
        <ParameterDescription key="FunctionParameter_526" name="Vmax" order="44" role="constant"/>
        <ParameterDescription key="FunctionParameter_525" name="n" order="45" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_62" name="Function for PCK" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_62">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:54:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(MgATP*OAA-HCO3*MgADP*PEP/Keq)/(KmATP*KmOAA)/(1+HCO3/KmHCO3+HCO3/KmHCO3*(ADP/KmADP)+MgADP/KmADP+MgATP/KmATP+OAA/KmOAA+MgATP/KmATP*(OAA/KmOAA)+HCO3/KmHCO3*(PEP/KmPEP)+PEP/KmPEP+HCO3/KmHCO3*(MgADP/KmADP)*(PEP/KmPEP)+MgADP/KmADP*(PEP/KmPEP))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_583" name="ADP" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_582" name="HCO3" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_581" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_580" name="KmADP" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_579" name="KmATP" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_578" name="KmHCO3" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_577" name="KmOAA" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_576" name="KmPEP" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_575" name="MgADP" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_574" name="MgATP" order="9" role="modifier"/>
        <ParameterDescription key="FunctionParameter_573" name="OAA" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_572" name="PEP" order="11" role="product"/>
        <ParameterDescription key="FunctionParameter_571" name="Vmax" order="12" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_63" name="Function for PPS" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_63">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:43:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(MgATP*PYR-AMP*PEP*P*MG/Keq)/(KmATPMg*KmPYR)/(MgATP/KmATPMg+alpha*(P/KdP)*(MgATP/KmATPMg)+alpha*(AMP/KdAMP)*(MgATP/KmATPMg)+alpha*(P/KdP)*(AMP/KdAMP)*(MgATP/KmATPMg)+alpha*(MG/KdMg)*(P/KmP)*(AMP/KdAMP)*(MgATP/KdATPMgPPS)/(W*(1+MG/KdMg))+MgATP/KmATPMg*(AKG/KefAKG)+(1+MG/KdMg)*(AKG/KefAKG)*(PEP/KmPEP)/W+MgATP/KmATPMg*(OAA/KefOAA)+(1+MG/KdMg)*(OAA/KefOAA)*(PEP/KmPEP)/W+MG/KdMg*(P/KmP)*(AMP/KdAMP)/W+alpha*(P/KdP)*(AMP/KdAMP)*(PEP/KmPEP)/W+alpha*(MG/KdMg)*(P/KmP)*(AMP/KdAMP)*(PEP/KmPEP)/W+alpha*(1+MG/KdMg)*(KmAMP/KdAMP*(P/KmP)*(PEP/KmPEP)+AMP/KdAMP*(PEP/KmPEP))/W+(1+MG/KdMg)*(PYR/KmPYR)+MgATP/KmATPMg*(PYR/KmPYR)+KdADPMg/KdMg*(P/KmP)*(MgADP/KefADP)*(AMP/KdAMP)/(W*(1+MG/KdMg))+(ADP-MgADP)/KefADP*(PYR/KmPYR)+KdATPMg/KdMg*(P/KmP)*(AMP/KdAMP)*(MgATP/KefATP)/(W*(1+MG/KdMg))+(ATP-MgATP)/KefATP*(PYR/KmPYR)+(1+MG/KdMg)*(PEP/KmPEP)/W+alpha*(1+MG/KdMg)*(PEP/KdPEP)*(PYR/KmPYR)+(1+MG/KdMg)*(PYR/KdPYR)*(PEP/KmPEP)/W)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_615" name="ADP" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_614" name="AKG" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_613" name="AMP" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_612" name="ATP" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_611" name="KdADPMg" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_610" name="KdAMP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_609" name="KdATPMg" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_608" name="KdATPMgPPS" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_607" name="KdMg" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_606" name="KdP" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_605" name="KdPEP" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_604" name="KdPYR" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_603" name="KefADP" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_602" name="KefAKG" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_601" name="KefATP" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_600" name="KefOAA" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_599" name="Keq" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_598" name="KmAMP" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_597" name="KmATPMg" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_596" name="KmP" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_595" name="KmPEP" order="20" role="constant"/>
        <ParameterDescription key="FunctionParameter_594" name="KmPYR" order="21" role="constant"/>
        <ParameterDescription key="FunctionParameter_593" name="MG" order="22" role="modifier"/>
        <ParameterDescription key="FunctionParameter_592" name="MgADP" order="23" role="modifier"/>
        <ParameterDescription key="FunctionParameter_591" name="MgATP" order="24" role="modifier"/>
        <ParameterDescription key="FunctionParameter_590" name="OAA" order="25" role="modifier"/>
        <ParameterDescription key="FunctionParameter_589" name="P" order="26" role="product"/>
        <ParameterDescription key="FunctionParameter_588" name="PEP" order="27" role="product"/>
        <ParameterDescription key="FunctionParameter_587" name="PYR" order="28" role="substrate"/>
        <ParameterDescription key="FunctionParameter_586" name="Vmax" order="29" role="constant"/>
        <ParameterDescription key="FunctionParameter_585" name="W" order="30" role="constant"/>
        <ParameterDescription key="FunctionParameter_584" name="alpha" order="31" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_64" name="Function for MAD" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_64">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T23:46:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*n*MAL*NAD/(KmrMAL*KirNAD)/(1+KmrNAD/KirNAD*(MAL/KmrMAL)+NAD/KirNAD+MAL/KmrMAL*(NAD/KirNAD))*((MG/KmrMg+MN/KmrMn)/(1+MG/KmrMg+MN/KmrMn))/(1+L0*((1+ASP/KeftASP)*(1+MG/KmtMg+MN/KmtMn)*(1+ATP/KeftATP)*(1+ACCOA/KeftACCOA+COA/KeftCOA)*(1+KmtNAD/KitNAD*(MAL/KmtMAL)+NAD/KitNAD+MAL/KmtMAL*(NAD/KitNAD))/((1+ASP/KefrASP)*(1+MG/KmrMg+MN/KmrMn)*(1+ATP/KefrATP)*(1+ACCOA/KefrACCOA+COA/KefrCOA)*(1+KmrNAD/KirNAD*(MAL/KmrMAL)+NAD/KirNAD+MAL/KmrMAL*(NAD/KirNAD))))^n)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_644" name="ACCOA" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_643" name="ASP" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_642" name="ATP" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_641" name="COA" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_640" name="KefrACCOA" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_639" name="KefrASP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_638" name="KefrATP" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_637" name="KefrCOA" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_636" name="KeftACCOA" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_635" name="KeftASP" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_634" name="KeftATP" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_633" name="KeftCOA" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_632" name="KirNAD" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_631" name="KitNAD" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_630" name="KmrMAL" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_629" name="KmrMg" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_628" name="KmrMn" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_627" name="KmrNAD" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_626" name="KmtMAL" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_625" name="KmtMg" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_624" name="KmtMn" order="20" role="constant"/>
        <ParameterDescription key="FunctionParameter_623" name="KmtNAD" order="21" role="constant"/>
        <ParameterDescription key="FunctionParameter_622" name="L0" order="22" role="constant"/>
        <ParameterDescription key="FunctionParameter_621" name="MAL" order="23" role="substrate"/>
        <ParameterDescription key="FunctionParameter_620" name="MG" order="24" role="modifier"/>
        <ParameterDescription key="FunctionParameter_619" name="MN" order="25" role="modifier"/>
        <ParameterDescription key="FunctionParameter_618" name="NAD" order="26" role="substrate"/>
        <ParameterDescription key="FunctionParameter_617" name="Vmax" order="27" role="constant"/>
        <ParameterDescription key="FunctionParameter_616" name="n" order="28" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_65" name="Function for PDH" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_65">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T23:51:24Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(COA*NAD*PYR-ACCOA*NADH*HCO3/Keq)/(KmCOA*KmNAD*KmPYR)/(ACCOA/KmACCOA+NADH/KmNADH+ACCOA/KmACCOA*(NADH/KmNADH)+COA/KmCOA*(NADH/KmNADH)+ACCOA/KmACCOA*(COA/KmCOA)*(NADH/KmNADH)+NAD/KmNAD*(NADH/KmNADH)+COA/KmCOA*(NAD/KmNAD)*(NADH/KmNADH)+ACCOA/KmACCOA*(PYR/KmPYR)+ACCOA/KmACCOA*(COA/KmCOA)*(PYR/KmPYR)+COA/KmCOA*(1+NAD/KmNAD)*(PYR/KmPYR)+NAD/KmNAD*(1+COA/KmCOA+PYR/KmPYR))/(1+HCO3/KmHCO3)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_658" name="ACCOA" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_657" name="COA" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_656" name="HCO3" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_655" name="Keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_654" name="KmACCOA" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_653" name="KmCOA" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_652" name="KmHCO3" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_651" name="KmNAD" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_650" name="KmNADH" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_649" name="KmPYR" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_648" name="NAD" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_647" name="NADH" order="11" role="product"/>
        <ParameterDescription key="FunctionParameter_646" name="PYR" order="12" role="substrate"/>
        <ParameterDescription key="FunctionParameter_645" name="Vmax" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_66" name="Function for GLT" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_66">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T14:30:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(ACCOA*OAA-CIT*COA/Keq)/(KdACCOA0*KmOAA0)/(ACCOA/KdACCOA0*(1+AKG/Ki1AKG+NADH/Ki1NADH)+ACCOA/KdACCOA0*(OAA/KmOAA0)*(1+AKG/Ki2AKG+NADH/Ki2NADH)+(1+ATP/KiATP)*(1+KmACCOA0/KdACCOA0*(OAA/KmOAA0))+KmcsCOA/KdcsCOA*(CIT/KmcsCIT)+KmcsCOA/KdcsCOA*(ACCOA/KdACCOA0)*(CIT/KmcsCIT)+COA/KdcsCOA+CIT/KmcsCIT*(OAA/KmOAA0)+ACCOA/KdACCOA0*(CIT/KdcsCIT)*(OAA/KmOAA0)+KmACCOA0/KdACCOA0*(COA/KdcsCOA)*(OAA/KmOAA0)+CIT/KmcsCIT*(COA/KdcsCOA)*(OAA/KdcsOAA))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_680" name="ACCOA" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_679" name="AKG" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_678" name="ATP" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_677" name="CIT" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_676" name="COA" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_675" name="KdACCOA0" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_674" name="KdcsCIT" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_673" name="KdcsCOA" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_672" name="KdcsOAA" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_671" name="Keq" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_670" name="Ki1AKG" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_669" name="Ki1NADH" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_668" name="Ki2AKG" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_667" name="Ki2NADH" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_666" name="KiATP" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_665" name="KmACCOA0" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_664" name="KmOAA0" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_663" name="KmcsCIT" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_662" name="KmcsCOA" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_661" name="NADH" order="19" role="modifier"/>
        <ParameterDescription key="FunctionParameter_660" name="OAA" order="20" role="substrate"/>
        <ParameterDescription key="FunctionParameter_659" name="Vmax" order="21" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_69" name="Function for ICD" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_69">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T09:24:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        icd*kcat*(ICIT*NADP-AKG*NADPH/Keq)/(KmICIT*KmNADP)/((1+ICIT/KmICIT)*(1+NADP/KmNADP)+(1+AKG/KmAKG)*(1+NADPH/KmNADPH)-1)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_707" name="AKG" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_706" name="ICIT" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_705" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_704" name="KmAKG" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_703" name="KmICIT" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_702" name="KmNADP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_701" name="KmNADPH" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_700" name="NADP" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_699" name="NADPH" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_698" name="icd" order="9" role="modifier"/>
        <ParameterDescription key="FunctionParameter_697" name="kcat" order="10" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_70" name="Function for LPD" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_70">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T23:52:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*COA*AKG*NAD*(1-AKG/KdAKG)/(KmCOA*KmAKG*KmNAD)/(COA/KmCOA*(AKG/KmAKG)+COA/KmCOA*(NAD/KmNAD)+AKG/KmAKG*(NAD/KmNAD)+COA/KmCOA*(AKG/KmAKG)*(NAD/KmNAD)-AKG/KdAKG*(COA/KmCOA*(AKG/KmAKG)+AKG/KmAKG*(NAD/KmNAD)+alpha*(COA/KmCOA)*(AKG/KmAKG)*(NAD/KmNAD)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_716" name="AKG" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_715" name="COA" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_714" name="KdAKG" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_713" name="KmAKG" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_712" name="KmCOA" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_711" name="KmNAD" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_710" name="NAD" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_709" name="Vmax" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_708" name="alpha" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_71" name="Function for SK" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_71">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:44:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(ADP*SUCCOA*P-ATP*COA*SUC/Keq)/(KmADP*KmSUCCOA*KmP)/((1+ADP/KmADP)*(1+SUCCOA/KmSUCCOA)*(1+P/KmP)+(1+ATP/KmATP)*(1+COA/KmCOA)*(1+SUC/KmSUC)-1)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_730" name="ADP" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_729" name="ATP" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_728" name="COA" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_727" name="Keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_726" name="KmADP" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_725" name="KmATP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_724" name="KmCOA" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_723" name="KmP" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_722" name="KmSUC" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_721" name="KmSUCCOA" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_720" name="P" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_719" name="SUC" order="11" role="product"/>
        <ParameterDescription key="FunctionParameter_718" name="SUCCOA" order="12" role="substrate"/>
        <ParameterDescription key="FunctionParameter_717" name="Vmax" order="13" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_73" name="Function for FUMA" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_73">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-11T17:11:24Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(FUM-MAL/Keq)/KmFUM/(1+FUM/KmFUM+MAL/KmMAL)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_748" name="FUM" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_747" name="Keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_746" name="KmFUM" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_745" name="KmMAL" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_744" name="MAL" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_743" name="Vmax" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_74" name="Function for MQO" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_74">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T17:17:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(MAL*Q-OAA*QH2/Keq)/(KmMAL*KmQ)/((1+MAL/KmMAL)*(1+Q/KmQ)+(1+OAA/KmOAA)*(1+QH2/KmQH2)-1)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_758" name="Keq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_757" name="KmMAL" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_756" name="KmOAA" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_755" name="KmQ" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_754" name="KmQH2" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_753" name="MAL" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_752" name="OAA" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_751" name="Q" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_750" name="QH2" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_749" name="Vmax" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_75" name="Function for MDH" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_75">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T23:52:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(NADH*OAA-MAL*NAD/Keq)/(KiNADH*KmOAA)/(1+KmNAD/KiNAD*(MAL/KmMAL)+NAD/KiNAD+MAL/KmMAL*(NAD/KiNAD)+NADH/KiNADH+KmNAD/KiNAD*(MAL/KmMAL)*(NADH/KiNADH)+KmNADH/KiNADH*(OAA/KmOAA)+KmNADH/KiNADH*(NAD/KiNAD)*(OAA/KmOAA)+MAL*NAD*OAA/(KiNAD*KiOAA*KmMAL)+NADH/KiNADH*(OAA/KmOAA)+Keq*(KiNADH*KmOAA/(KiNAD*KmMAL))*(KmNAD/KiNAD)*(MAL/KmMAL)*(NADH/KmNADH)*(OAA/KiOAA))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_771" name="Keq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_770" name="KiNAD" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_769" name="KiNADH" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_768" name="KiOAA" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_767" name="KmMAL" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_766" name="KmNAD" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_765" name="KmNADH" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_764" name="KmOAA" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_763" name="MAL" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_762" name="NAD" order="9" role="modifier"/>
        <ParameterDescription key="FunctionParameter_761" name="NADH" order="10" role="modifier"/>
        <ParameterDescription key="FunctionParameter_760" name="OAA" order="11" role="substrate"/>
        <ParameterDescription key="FunctionParameter_759" name="Vmax" order="12" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_76" name="Function for ACEA" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_76">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T10:00:43Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(ICIT-GLX*SUC/Keq)/KmICIT/(1+ICIT/KmICIT*(1+PEP/KdPEPicit)+SUC/KdSUC*(1+ICIT/KdICITsuc)+KmSUC/KdSUC*(GLX/KmGLX)*(1+PEP/KdPEPglx)+GLX/KmGLX*(SUC/KdSUC)+PEP/KdPEP+PGA3/KdPGA3)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_787" name="GLX" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_786" name="ICIT" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_785" name="KdICITsuc" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_784" name="KdPEP" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_783" name="KdPEPglx" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_782" name="KdPEPicit" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_781" name="KdPGA3" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_780" name="KdSUC" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_779" name="Keq" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_778" name="KmGLX" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_777" name="KmICIT" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_776" name="KmSUC" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_775" name="PEP" order="12" role="modifier"/>
        <ParameterDescription key="FunctionParameter_774" name="PGA3" order="13" role="modifier"/>
        <ParameterDescription key="FunctionParameter_773" name="SUC" order="14" role="product"/>
        <ParameterDescription key="FunctionParameter_772" name="Vmax" order="15" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_77" name="Function for ACEB" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_77">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T14:32:44Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(ACCOA*GLX-COA*MAL/Keq)/(KmACCOA*KmGLX)/((1+ACCOA/KmACCOA)*(1+GLX/KmGLX)+(1+COA/KmCOA)*(1+MAL/KmMAL)-1)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_797" name="ACCOA" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_796" name="COA" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_795" name="GLX" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_794" name="Keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_793" name="KmACCOA" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_792" name="KmCOA" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_791" name="KmGLX" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_790" name="KmMAL" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_789" name="MAL" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_788" name="Vmax" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_78" name="Function for ACEK_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_78">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T13:25:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k*(ATP*icd-ADP*icdP/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_803" name="ADP" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_802" name="ATP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_801" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_800" name="icd" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_799" name="icdP" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_798" name="k" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_79" name="Function for ACEK_2" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_79">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T14:20:35Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k*(icdP-icd*P/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_808" name="Keq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_807" name="P" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_806" name="icd" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_805" name="icdP" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_804" name="k" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_80" name="Function for EDD" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_80">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(PGN-KDPG/Keq)/KmPGN/(1+PGN/KmPGN+KDPG/KmKDPG)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_814" name="KDPG" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_813" name="Keq" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_812" name="KmKDPG" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_811" name="KmPGN" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_810" name="PGN" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_809" name="Vmax" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_81" name="Function for EDA" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_81">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(KDPG-GAP*PYR/Keq)/KmKDPG/(1+KDPG/KmKDPG+(1+GAP/KmGAP)*(1+PYR/KmPYR)-1)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_822" name="GAP" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_821" name="KDPG" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_820" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_819" name="KmGAP" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_818" name="KmKDPG" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_817" name="KmPYR" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_816" name="PYR" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_815" name="Vmax" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_82" name="Function for PNT" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_82">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T13:50:16Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k*(NAD*NADPH-NADH*NADP/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_828" name="Keq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_827" name="NAD" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_826" name="NADH" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_825" name="NADP" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_824" name="NADPH" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_823" name="k" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_83" name="Function for ADK" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_83">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k*(AMP*ATP-ADP^2/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_833" name="ADP" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_832" name="AMP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_831" name="ATP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_830" name="Keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_829" name="k" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_85" name="Function for DOS" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_85">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k*(CAMP-AMP/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_844" name="AMP" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_843" name="CAMP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_842" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_841" name="k" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_86" name="Function for ACK" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_86">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:42:30Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        cell*Vmax*(ACP*ADP-ACEx*ATP/Keq)/(KmACP*KmADP)/((1+ACP/KmACP+ACEx/KmACE)*(1+ADP/KmADP+ATP/KmATP))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_855" name="ACEx" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_854" name="ACP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_853" name="ADP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_852" name="ATP" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_851" name="Keq" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_850" name="KmACE" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_849" name="KmACP" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_848" name="KmADP" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_847" name="KmATP" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_846" name="Vmax" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_845" name="cell" order="10" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_87" name="Function for ACS" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_87">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T14:33:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        cell*Vmax*ACEx*ATP*COA/(KmACE*KmATP*KmCOA)/((1+ACEx/KmACE)*(1+ATP/KmATP)*(1+COA/KmCOA))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_863" name="ACEx" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_862" name="ATP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_861" name="COA" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_860" name="KmACE" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_859" name="KmATP" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_858" name="KmCOA" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_857" name="Vmax" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_856" name="cell" order="7" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_88" name="Function for PTA" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_88">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:44:15Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(ACCOA*P-ACP*COA/Keq)/(KiACCOA*KmP)/(1+ACCOA/KiACCOA+P/KiP+ACP/KiACP+COA/KiCOA+ACCOA*P/(KiACCOA*KmP)+ACP*COA/(KmACP*KiCOA))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_875" name="ACCOA" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_874" name="ACP" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_873" name="COA" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_872" name="Keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_871" name="KiACCOA" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_870" name="KiACP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_869" name="KiCOA" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_868" name="KiP" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_867" name="KmACP" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_866" name="KmP" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_865" name="P" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_864" name="Vmax" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_89" name="Function for PTS_0" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_89">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-22T14:03:00Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kF*ei*PEP^2/(KmPEP^2+PEP^2)-kR*eiP*PYR^2/(KmPYR^2+PYR^2)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_883" name="KmPEP" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_882" name="KmPYR" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_881" name="PEP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_880" name="PYR" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_879" name="ei" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_878" name="eiP" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_877" name="kF" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_876" name="kR" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_91" name="Function for GLC_FEED" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_91">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2014-12-29T21:58:51Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        cell*FEED/extracellular
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_895" name="FEED" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_894" name="cell" order="1" role="volume"/>
        <ParameterDescription key="FunctionParameter_893" name="extracellular" order="2" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_102" name="Function for PGI_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_102">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(G6P-F6P/Keq)/KmG6P/(1+F6P/KmF6P+G6P/KmG6P+PEP/KmPEP+PGN/KmPGN)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_990" name="F6P" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_991" name="G6P" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_992" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_993" name="KmF6P" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_994" name="KmG6P" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_995" name="KmPEP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_996" name="KmPGN" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_997" name="PEP" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_998" name="PGN" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_999" name="Vmax" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_103" name="Function for ACN_1_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_103">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(CIT-ACO/Keq)/KmCIT_ACN/(1+CIT/KmCIT_ACN+ACO/KmACO_ACN+ICIT/KmICIT_ACN)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1159" name="ACO" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_1224" name="CIT" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1225" name="ICIT" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1157" name="Keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_987" name="KmACO_ACN" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1238" name="KmCIT_ACN" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1227" name="KmICIT_ACN" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1024" name="Vmax" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_104" name="Function for ACN_2_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_104">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(ACO-ICIT/Keq)/KmACO_ACN/(1+ACO/KmACO_ACN+ICIT/KmICIT_ACN+CIT/KmCIT_ACN)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1026" name="ACO" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1254" name="CIT" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1253" name="ICIT" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_1252" name="Keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1251" name="KmACO_ACN" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1250" name="KmCIT_ACN" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1249" name="KmICIT_ACN" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1248" name="Vmax" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_105" name="Function for SDH_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_105">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(SUC*FAD-FUM*FADH2/Keq)/(KefSUC*KmQ)/(1+FUM/KefFUM+KmSUC/KefSUC*(FAD/KmQ)+KmFUM/KefFUM*(FADH2/KmQH2)+FUM/KefFUM*(FADH2/KmQH2)+SUC/KefSUC+SUC/KefSUC*(FAD/KmQ))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_988" name="FAD" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1228" name="FADH2" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_1479" name="FUM" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_1478" name="KefFUM" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1477" name="KefSUC" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1476" name="Keq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_1475" name="KmFUM" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1474" name="KmQ" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1473" name="KmQH2" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_1472" name="KmSUC" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_1471" name="SUC" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1470" name="Vmax" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_106" name="Function for NDH1_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_106">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax/(1+(log(Hout/Hin)/log(10))^2)*(NADH*Q-NAD*QH2/KeqNDH)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1577" name="Hin" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1576" name="Hout" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_1575" name="KeqNDH" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1574" name="NAD" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_1223" name="NADH" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1547" name="Q" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1548" name="QH2" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_1450" name="Vmax" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_107" name="Function for ATP_SYN_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_107">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(log(Hout/Hin)/log(10))^4/(1+(log(Hout/Hin)/log(10))^4)*(ADP*P-ATP/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1596" name="ADP" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1597" name="ATP" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_1447" name="Hin" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_1607" name="Hout" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1608" name="Keq" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1609" name="P" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1610" name="Vmax" order="6" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_108" name="Function for CYA_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_108">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k*(ATP-CAMP*P^2/Keq)*eiiaP/(eiiaP+KaeiiaP)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1618" name="ATP" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1619" name="CAMP" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_1620" name="KaeiiaP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1621" name="Keq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1622" name="P" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_1623" name="eiiaP" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1624" name="k" order="6" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_109" name="Function for PTS_4_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_109">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        cell*(kF*eiicbP*GLCp/(KmGLC+GLCp)-kR*eiicb*G6P/(KmG6P+G6P))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1689" name="G6P" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_1690" name="GLCp" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1691" name="KmG6P" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1692" name="KmGLC" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1693" name="cell" order="4" role="volume"/>
        <ParameterDescription key="FunctionParameter_1694" name="eiicb" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_1695" name="eiicbP" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1696" name="kF" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1697" name="kR" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_110" name="Function for CYTBO_1" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_110">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax/(1+(log(Hout/Hin)/log(10))^2)*(QH2^2*O2-Q^2/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1708" name="Hin" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1709" name="Hout" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_1710" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1711" name="O2" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1712" name="Q" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_1713" name="QH2" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1714" name="Vmax" order="6" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_111" name="Function for SQR_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_111">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(FADH2*Q-FAD*QH2/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1595" name="FAD" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_1722" name="FADH2" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1723" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1724" name="Q" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1725" name="QH2" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_1726" name="Vmax" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_112" name="Function for NDH2_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_112">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(NADH*Q-NAD*QH2/KeqNDH)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1733" name="KeqNDH" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_1734" name="NAD" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_1735" name="NADH" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1736" name="Q" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1737" name="QH2" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_1738" name="Vmax" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_113" name="Function for GROWTH_1" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_113">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*G6P*E4P*PGA3*OAA*AKG*PYR*R5P*PEP*GAP*F6P*NADPH*ACCOA*NAD*ATP/(KmG6P*KmE4P*KmPGA3*KmOAA*KmAKG*KmPYR*KmR5P*KmPEP*KmGAP*KmF6P*KmNADPH*KmACCOA*KmNAD*KmATP)/((1+G6P/KmG6P)*(1+E4P/KmE4P)*(1+PGA3/KmPGA3)*(1+OAA/KmOAA)*(1+AKG/KmAKG)*(1+PYR/KmPYR)*(1+R5P/KmR5P)*(1+PEP/KmPEP)*(1+GAP/KmGAP)*(1+F6P/KmF6P)*(1+NADPH/KmNADPH)*(1+ACCOA/KmACCOA)*(1+NAD/KmNAD)*(1+ATP/KmATP))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1768" name="ACCOA" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1769" name="AKG" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1770" name="ATP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1771" name="E4P" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1772" name="F6P" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1773" name="G6P" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1774" name="GAP" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1775" name="KmACCOA" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_1776" name="KmAKG" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_1777" name="KmATP" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_1778" name="KmE4P" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_1779" name="KmF6P" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_1780" name="KmG6P" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_1781" name="KmGAP" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_1782" name="KmNAD" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_1783" name="KmNADPH" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_1784" name="KmOAA" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_1785" name="KmPEP" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_1786" name="KmPGA3" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_1787" name="KmPYR" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_1788" name="KmR5P" order="20" role="constant"/>
        <ParameterDescription key="FunctionParameter_1789" name="NAD" order="21" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1790" name="NADPH" order="22" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1791" name="OAA" order="23" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1792" name="PEP" order="24" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1793" name="PGA3" order="25" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1794" name="PYR" order="26" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1795" name="R5P" order="27" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1796" name="Vmax" order="28" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_114" name="Function for ATP_MAINTENANCE_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_114">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(ATP-ADP*P/Keq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1685" name="ADP" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_1750" name="ATP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1752" name="Keq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1760" name="P" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_1759" name="Vmax" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_115" name="Function for XCH_RMM_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_115">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(GLCx/Km-GLCp/Km)/(1+GLCx/Km+GLCp/Km)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1745" name="GLCp" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_1762" name="GLCx" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1754" name="Km" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1763" name="Vmax" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_116" name="Function for PIT_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_116">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*((log(Hout/Hin)/log(10))^2/(1+(log(Hout/Hin)/log(10))^2)*(Pp/(KmPp+Pp))-Kr/(1+(log(Hout/Hin)/log(10))^2)*(P/(KmP+P)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1753" name="Hin" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_1109" name="Hout" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1751" name="KmP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1826" name="KmPp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1827" name="Kr" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_1828" name="P" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_1829" name="Pp" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1830" name="Vmax" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_117" name="Function for XCH_RMM_2" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_117">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(Px/Km-Pp/Km)/(1+Px/Km+Pp/Km)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1748" name="Km" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_1686" name="Pp" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_1747" name="Px" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1707" name="Vmax" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_118" name="Function for XCH_RMM_3" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_118">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(ACEx/Km-ACEp/Km)/(1+ACEx/Km+ACEp/Km)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1843" name="ACEp" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_1844" name="ACEx" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1845" name="Km" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1846" name="Vmax" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_119" name="Function for XCH_RMM_4" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_119">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vmax*(ACEp/Km-ACEx_0/Km)/(1+ACEp/Km+ACEx_0/Km)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1853" name="ACEp" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1854" name="ACEx_0" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_1855" name="Km" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1856" name="Vmax" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_120" name="Function for GL6P_HYDROLYSIS_1" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_120">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KGl6Phydrol*(GL6P-PGN/KeqGl6Phydrol)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1861" name="GL6P" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1862" name="KGl6Phydrol" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_1863" name="KeqGl6Phydrol" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1864" name="PGN" order="3" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_0" name="Millard2016 - E. coli central carbon and energy metabolism" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mmol" type="deterministic" avogadroConstant="6.0221407599999999e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:vCard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <rdf:Description rdf:about="#Model_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-05-10T22:00:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <dcterms:creator>
      <rdf:Bag>
        <rdf:li>
          <rdf:Description>
            <vCard:EMAIL>millard@insa-toulouse.fr</vCard:EMAIL>
            <vCard:N>
              <rdf:Description>
                <vCard:Family>Millard</vCard:Family>
                <vCard:Given>Pierre</vCard:Given>
              </rdf:Description>
            </vCard:N>
            <vCard:ORG>
              <rdf:Description>
                <vCard:Orgname>INRA</vCard:Orgname>
              </rdf:Description>
            </vCard:ORG>
          </rdf:Description>
        </rdf:li>
        <rdf:li>
          <rdf:Description>
            <vCard:EMAIL>pedro.mendes@manchester.ac.uk</vCard:EMAIL>
            <vCard:N>
              <rdf:Description>
                <vCard:Family>Mendes</vCard:Family>
                <vCard:Given>Pedro</vCard:Given>
              </rdf:Description>
            </vCard:N>
            <vCard:ORG>
              <rdf:Description>
                <vCard:Orgname>University of Manchester</vCard:Orgname>
              </rdf:Description>
            </vCard:ORG>
          </rdf:Description>
        </rdf:li>
        <rdf:li>
          <rdf:Description>
            <vCard:EMAIL>kieran.smallbone@manchester.ac.uk</vCard:EMAIL>
            <vCard:N>
              <rdf:Description>
                <vCard:Family>Smallbone</vCard:Family>
                <vCard:Given>Kieran</vCard:Given>
              </rdf:Description>
            </vCard:N>
            <vCard:ORG>
              <rdf:Description>
                <vCard:Orgname>University of Manchester</vCard:Orgname>
              </rdf:Description>
            </vCard:ORG>
          </rdf:Description>
        </rdf:li>
      </rdf:Bag>
    </dcterms:creator>
    <dcterms:modified>
      <rdf:Description>
        <dcterms:W3CDTF>2015-05-10T22:00:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:modified>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <Comment>
      
  <body xmlns="http://www.w3.org/1999/xhtml">
    <pre>This model represents the central carbon and energy metabolic network of Escherichia coli growing under glucose limitation.</pre>
  </body>

    </Comment>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="cell_cytoplasm" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T16:22:10Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
      <Compartment key="Compartment_1" name="extracellular" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T16:22:10Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
      <Compartment key="Compartment_2" name="cell_periplasm" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-16T10:08:42Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_0" name="ACCOA" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-17T08:09:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1" name="ACO" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-14T12:22:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_2" name="ACP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-14T12:22:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="AKG" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-17T08:08:54Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_4" name="BPG" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T14:57:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="CIT" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_6" name="DAP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_6">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T10:03:10Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="E4P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-16T11:41:38Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_8" name="F6P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_8">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T16:25:24Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_9" name="FDP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_9">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T23:49:14Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_10" name="FUM" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_11" name="G6P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_12" name="GAP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_12">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-03T00:12:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_13" name="GL6P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_13">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T23:53:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_14" name="GLX" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_14">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T23:53:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_15" name="ICIT" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_15">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T14:59:12Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_16" name="KDPG" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_16">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-24T10:12:51Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_17" name="MAL" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_18" name="NAD" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_18">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T23:44:07Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_19" name="NADH" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_19">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T23:44:56Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_20" name="NADP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_20">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T17:09:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_21" name="NADPH" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_21">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:58:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_22" name="OAA" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_22">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:45:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_23" name="PEP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_23">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-24T16:37:45Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_24" name="PGA2" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_25" name="PGA3" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_26" name="PGN" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_27" name="PYR" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_27">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-31T12:41:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_28" name="Q" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_28">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-14T12:12:52Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_29" name="QH2" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_29">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-14T12:12:53Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_30" name="R5P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_31" name="RU5P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_32" name="S7P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_32">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-24T10:25:24Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_33" name="SUC" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_33">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:46:56Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_34" name="SUCCOA" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_34">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-14T13:47:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_35" name="X5P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_35">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-22T20:51:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_36" name="ei" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_36">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T14:56:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_37" name="eiP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_37">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_38" name="eiia" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_38">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-16T09:44:24Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_39" name="eiiaP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_39">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_40" name="eiicb" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_40">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_41" name="eiicbP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T11:48:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_42" name="hpr" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_42">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:47:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_43" name="hprP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-10T10:15:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_44" name="icd" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_44">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:53:36Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_45" name="icdP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:53:40Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_46" name="tal" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_46">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T10:37:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_47" name="talC3" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_47">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T10:37:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_48" name="tkt" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_48">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T10:37:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_49" name="tktC2" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T10:37:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_50" name="ADP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_50">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:47:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_51" name="AMP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_51">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:47:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_52" name="ATP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_52">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:47:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_53" name="CAMP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_53">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:47:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_54" name="COA" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_54">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T14:35:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_55" name="HCO3" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_55">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:47:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_56" name="P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_56">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:45:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_57" name="MG" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_57">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T23:50:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_58" name="MgADP" simulationType="assignment" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_58">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T00:28:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MG],Reference=Concentration>*&lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ADP],Reference=Concentration>/(&lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KdADPMg],Reference=Value>+&lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MG],Reference=Concentration>)
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_59" name="MgATP" simulationType="assignment" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_59">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-23T11:39:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MG],Reference=Concentration>*&lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ATP],Reference=Concentration>/(&lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KdATPMg],Reference=Value>+&lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MG],Reference=Concentration>)
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_60" name="MgFDP" simulationType="assignment" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_60">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T00:28:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MG],Reference=Concentration>*&lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[FDP],Reference=Concentration>/(&lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KdFDPMg],Reference=Value>+&lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MG],Reference=Concentration>)
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_61" name="ASP" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_61">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-14T12:17:44Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_62" name="CYS" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_62">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-16T14:03:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_63" name="MN" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_63">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-27T11:44:38Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_64" name="Hin" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_64">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T10:15:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_65" name="H2O" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_65">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T10:15:34Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_66" name="O2" simulationType="fixed" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_66">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T10:59:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_67" name="FAD" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_67">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T15:23:15Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_68" name="FADH2" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_68">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T15:23:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_69" name="ACE" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_69">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-14T12:22:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_70" name="GLCx" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_70">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T23:49:09Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_71" name="Px" simulationType="fixed" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_71">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-24T10:32:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_72" name="ACEx" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_72">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-03T00:04:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_73" name="Hout" simulationType="reactions" compartment="Compartment_2" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_73">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T10:15:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_74" name="GLCp" simulationType="reactions" compartment="Compartment_2" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_74">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-23T16:11:40Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_75" name="Pp" simulationType="reactions" compartment="Compartment_2" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_75">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-31T12:41:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_76" name="ACEp" simulationType="reactions" compartment="Compartment_2" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_76">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-03T00:12:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_0" name="FEED" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T10:22:21Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1" name="KdADPMg" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T19:54:50Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_2" name="KdATPMg" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-20T18:47:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_3" name="KdFDPMg" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-20T18:47:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_4" name="KmICIT_ACN" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-13T02:18:45Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_5" name="KmCIT_ACN" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-13T02:18:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_6" name="KmACO_ACN" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_6">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-13T02:19:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_7" name="KeqNDH" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-25T10:29:33Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="PGI" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T23:08:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_23" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_200" name="Keq" value="0.36"/>
          <Constant key="Parameter_201" name="KmF6P" value="0.147"/>
          <Constant key="Parameter_197" name="KmG6P" value="0.28"/>
          <Constant key="Parameter_199" name="KmPEP" value="1.999"/>
          <Constant key="Parameter_196" name="Vmax" value="2.32456"/>
          <Constant key="Parameter_195" name="KmPGN" value="0.515958"/>
        </ListOfConstants>
        <KineticLaw function="Function_102" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_990">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_991">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_992">
              <SourceParameter reference="Parameter_200"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_993">
              <SourceParameter reference="Parameter_201"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_994">
              <SourceParameter reference="Parameter_197"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_995">
              <SourceParameter reference="Parameter_199"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_996">
              <SourceParameter reference="Parameter_195"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_997">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_998">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_999">
              <SourceParameter reference="Parameter_196"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="PFK" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-07T10:52:04Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_52" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_50" stoichiometry="1"/>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_23" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_58" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_191" name="KefrADP" value="0.0735264"/>
          <Constant key="Parameter_189" name="KefrPEP" value="19.98"/>
          <Constant key="Parameter_188" name="KeftADP" value="9.009"/>
          <Constant key="Parameter_194" name="KeftPEP" value="0.26026"/>
          <Constant key="Parameter_192" name="Keq" value="1998"/>
          <Constant key="Parameter_193" name="KirADP" value="54.945"/>
          <Constant key="Parameter_190" name="KirATP" value="2.4975e-05"/>
          <Constant key="Parameter_187" name="KirF6P" value="1.84615"/>
          <Constant key="Parameter_186" name="KirFDP" value="0.045954"/>
          <Constant key="Parameter_177" name="KitADP" value="80.08"/>
          <Constant key="Parameter_179" name="KitATP" value="0.014014"/>
          <Constant key="Parameter_180" name="KitF6P" value="0.00856856"/>
          <Constant key="Parameter_176" name="KitFDP" value="50.5505"/>
          <Constant key="Parameter_178" name="KmrADP" value="0.690009"/>
          <Constant key="Parameter_182" name="KmrATPMg" value="8.12187e-05"/>
          <Constant key="Parameter_184" name="KmrF6P" value="2.05205e-05"/>
          <Constant key="Parameter_185" name="KmrFDP" value="10.01"/>
          <Constant key="Parameter_181" name="KmtADP" value="2.002"/>
          <Constant key="Parameter_183" name="KmtATPMg" value="3.34334"/>
          <Constant key="Parameter_162" name="KmtF6P" value="32.967"/>
          <Constant key="Parameter_161" name="KmtFDP" value="9.99"/>
          <Constant key="Parameter_174" name="L0" value="14.0851"/>
          <Constant key="Parameter_138" name="Vmax" value="0.185253"/>
          <Constant key="Parameter_171" name="Wr" value="0.0237041"/>
          <Constant key="Parameter_144" name="Wt" value="0.146735"/>
          <Constant key="Parameter_143" name="n" value="4"/>
        </ListOfConstants>
        <KineticLaw function="Function_46" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_349">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Parameter_191"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="Parameter_189"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="Parameter_188"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_344">
              <SourceParameter reference="Parameter_194"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_343">
              <SourceParameter reference="Parameter_192"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_342">
              <SourceParameter reference="Parameter_193"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_341">
              <SourceParameter reference="Parameter_190"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="Parameter_187"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_339">
              <SourceParameter reference="Parameter_186"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_338">
              <SourceParameter reference="Parameter_177"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_337">
              <SourceParameter reference="Parameter_179"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_336">
              <SourceParameter reference="Parameter_180"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="Parameter_176"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="Parameter_178"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="Parameter_182"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Parameter_184"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Parameter_185"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Parameter_181"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="Parameter_183"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="Parameter_162"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_327">
              <SourceParameter reference="Parameter_161"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="Parameter_174"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="Metabolite_58"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_322">
              <SourceParameter reference="Parameter_138"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_321">
              <SourceParameter reference="Parameter_171"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_320">
              <SourceParameter reference="Parameter_144"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="Parameter_143"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="FBA" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-07T10:49:12Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
          <Product metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_160" name="Keq" value="0.18981"/>
          <Constant key="Parameter_175" name="KmDAP" value="0.13001"/>
          <Constant key="Parameter_167" name="KmFDP" value="0.12012"/>
          <Constant key="Parameter_158" name="KmGAP" value="0.13001"/>
          <Constant key="Parameter_173" name="KmPEP" value="0.5"/>
          <Constant key="Parameter_159" name="Vmax" value="21.6978"/>
        </ListOfConstants>
        <KineticLaw function="Function_45" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="Parameter_160"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="Parameter_175"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="Parameter_167"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="Parameter_158"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="Parameter_173"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Parameter_159"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="TPI" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-07T10:49:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_168" name="Keq" value="0.270203"/>
          <Constant key="Parameter_164" name="KmDAP" value="0.01"/>
          <Constant key="Parameter_169" name="KmGAP" value="1.89301"/>
          <Constant key="Parameter_165" name="Vmax" value="24.1843"/>
        </ListOfConstants>
        <KineticLaw function="Function_42" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="Parameter_168"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="Parameter_164"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Parameter_169"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="Parameter_165"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="GDH" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T17:03:28Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_12" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_166" name="Keq" value="20"/>
          <Constant key="Parameter_163" name="KmBPG" value="0.2"/>
          <Constant key="Parameter_141" name="KmGAP" value="2.47265"/>
          <Constant key="Parameter_172" name="KmNAD" value="0.0110454"/>
          <Constant key="Parameter_170" name="KmNADH" value="3.69797"/>
          <Constant key="Parameter_145" name="KmP" value="0.017"/>
          <Constant key="Parameter_139" name="Vmax" value="8.66573"/>
        </ListOfConstants>
        <KineticLaw function="Function_44" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_308">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_307">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_306">
              <SourceParameter reference="Parameter_166"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Parameter_163"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_304">
              <SourceParameter reference="Parameter_141"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="Parameter_172"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_302">
              <SourceParameter reference="Parameter_170"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="Parameter_145"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_300">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_298">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Parameter_139"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="PGK" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-14T17:46:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_50" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_52" stoichiometry="1"/>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_58" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_140" name="Keq" value="99.9925"/>
          <Constant key="Parameter_152" name="KmADPMg" value="0.085416"/>
          <Constant key="Parameter_148" name="KmATPMg" value="3.47737"/>
          <Constant key="Parameter_151" name="KmBPG" value="0.0113296"/>
          <Constant key="Parameter_146" name="KmPGA3" value="2.45722"/>
          <Constant key="Parameter_142" name="Vmax" value="16.1089"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="Parameter_140"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="Parameter_152"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="Parameter_148"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="Parameter_151"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_146"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Metabolite_58"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_142"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="GPM" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_6">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-24T12:56:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_24" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_150" name="Keq" value="0.565818"/>
          <Constant key="Parameter_147" name="KmPGA2" value="1.9153"/>
          <Constant key="Parameter_149" name="KmPGA3" value="0.115"/>
          <Constant key="Parameter_154" name="Vmax" value="10.9934"/>
        </ListOfConstants>
        <KineticLaw function="Function_49" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="Parameter_150"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="Parameter_147"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="Parameter_149"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_398">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_397">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="Parameter_154"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="ENO" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T20:00:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_24" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_156" name="Keq" value="3"/>
          <Constant key="Parameter_157" name="KmPEP" value="0.1"/>
          <Constant key="Parameter_153" name="KmPGA2" value="0.1"/>
          <Constant key="Parameter_155" name="Vmax" value="11.7189"/>
        </ListOfConstants>
        <KineticLaw function="Function_47" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Parameter_156"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_355">
              <SourceParameter reference="Parameter_157"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="Parameter_153"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Parameter_155"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="PYK" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_8">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-08T11:11:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_50" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_52" stoichiometry="1"/>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_9" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_11" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_13" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_58" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_59" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_30" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_31" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_32" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_34" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_35" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_136" name="KefrFDP" value="0.449149"/>
          <Constant key="Parameter_134" name="KefrG6P" value="0.158746"/>
          <Constant key="Parameter_133" name="KefrGL6P" value="0.150482"/>
          <Constant key="Parameter_137" name="KefrR5P" value="9.33254"/>
          <Constant key="Parameter_135" name="KefrRU5P" value="1.53591"/>
          <Constant key="Parameter_130" name="KefrS7P" value="0.0785955"/>
          <Constant key="Parameter_129" name="KefrX5P" value="0.677374"/>
          <Constant key="Parameter_128" name="KeftATP" value="3.69117"/>
          <Constant key="Parameter_132" name="KeftSUCCOA" value="8.26406"/>
          <Constant key="Parameter_131" name="KirADP" value="0.517585"/>
          <Constant key="Parameter_127" name="KirATP" value="96.0333"/>
          <Constant key="Parameter_125" name="KirPEP" value="0.181056"/>
          <Constant key="Parameter_126" name="KirPYR" value="15.1403"/>
          <Constant key="Parameter_124" name="KirPyrATP" value="230.781"/>
          <Constant key="Parameter_123" name="KitADP" value="0.224911"/>
          <Constant key="Parameter_122" name="KitATP" value="0.039564"/>
          <Constant key="Parameter_121" name="KitPEP" value="0.465672"/>
          <Constant key="Parameter_120" name="KitPYR" value="0.2499"/>
          <Constant key="Parameter_119" name="KitPyrATP" value="11.3691"/>
          <Constant key="Parameter_118" name="KmrADPMg" value="0.326144"/>
          <Constant key="Parameter_117" name="KmrPEP" value="5.56368e-07"/>
          <Constant key="Parameter_116" name="KmtADPMg" value="0.054678"/>
          <Constant key="Parameter_115" name="KmtPEP" value="0.11475"/>
          <Constant key="Parameter_113" name="L0" value="50.4818"/>
          <Constant key="Parameter_114" name="Vmax" value="0.74716"/>
          <Constant key="Parameter_111" name="n" value="4"/>
        </ListOfConstants>
        <KineticLaw function="Function_48" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_395">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_394">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_393">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_392">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_391">
              <SourceParameter reference="Parameter_136"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_390">
              <SourceParameter reference="Parameter_134"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_389">
              <SourceParameter reference="Parameter_133"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="Parameter_137"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_387">
              <SourceParameter reference="Parameter_135"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_386">
              <SourceParameter reference="Parameter_130"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_385">
              <SourceParameter reference="Parameter_129"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_384">
              <SourceParameter reference="Parameter_128"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_383">
              <SourceParameter reference="Parameter_132"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_382">
              <SourceParameter reference="Parameter_131"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_381">
              <SourceParameter reference="Parameter_127"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_380">
              <SourceParameter reference="Parameter_125"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_379">
              <SourceParameter reference="Parameter_126"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_378">
              <SourceParameter reference="Parameter_124"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_377">
              <SourceParameter reference="Parameter_123"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="Parameter_122"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_375">
              <SourceParameter reference="Parameter_121"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_374">
              <SourceParameter reference="Parameter_120"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_373">
              <SourceParameter reference="Parameter_119"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="Parameter_118"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_371">
              <SourceParameter reference="Parameter_117"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_370">
              <SourceParameter reference="Parameter_116"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_369">
              <SourceParameter reference="Parameter_115"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="Parameter_113"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_367">
              <SourceParameter reference="Metabolite_58"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_366">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_365">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_363">
              <SourceParameter reference="Metabolite_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_362">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_361">
              <SourceParameter reference="Metabolite_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Metabolite_34"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_359">
              <SourceParameter reference="Parameter_114"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Metabolite_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="Parameter_111"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="ZWF" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_9">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T23:06:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_112" name="KdG6P" value="0.192"/>
          <Constant key="Parameter_105" name="KdGL6P" value="0.02"/>
          <Constant key="Parameter_106" name="Keq" value="6e+10"/>
          <Constant key="Parameter_108" name="KmG6P" value="0.118525"/>
          <Constant key="Parameter_107" name="KmGL6P" value="0.328629"/>
          <Constant key="Parameter_110" name="KmNADP" value="0.0274"/>
          <Constant key="Parameter_109" name="KmNADPH" value="0.0168"/>
          <Constant key="Parameter_104" name="Vmax" value="0.2658"/>
        </ListOfConstants>
        <KineticLaw function="Function_50" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_413">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_412">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_411">
              <SourceParameter reference="Parameter_112"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_410">
              <SourceParameter reference="Parameter_105"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="Parameter_106"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_408">
              <SourceParameter reference="Parameter_108"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_407">
              <SourceParameter reference="Parameter_107"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_406">
              <SourceParameter reference="Parameter_110"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="Parameter_109"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_404">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_403">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_402">
              <SourceParameter reference="Parameter_104"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="PGL" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_10">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-05T14:31:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_103" name="Keq" value="42.7572"/>
          <Constant key="Parameter_102" name="KiG6P" value="2.0001"/>
          <Constant key="Parameter_101" name="KmGL6P" value="0.022977"/>
          <Constant key="Parameter_96" name="KmPGN" value="9.99"/>
          <Constant key="Parameter_99" name="Vmax" value="11.5967"/>
        </ListOfConstants>
        <KineticLaw function="Function_51" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_421">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_420">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_419">
              <SourceParameter reference="Parameter_103"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="Parameter_102"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_417">
              <SourceParameter reference="Parameter_101"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_416">
              <SourceParameter reference="Parameter_96"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_415">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_414">
              <SourceParameter reference="Parameter_99"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="GND" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_11">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:44:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
          <Product metabolite="Metabolite_31" stoichiometry="1"/>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_52" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_97" name="KdHCO3" value="58.8951"/>
          <Constant key="Parameter_98" name="KdHCO3NADPH" value="9.7257"/>
          <Constant key="Parameter_100" name="KdNADP" value="0.116989"/>
          <Constant key="Parameter_221" name="KdNADPH" value="0.00340034"/>
          <Constant key="Parameter_222" name="KdRu5P" value="0.0440044"/>
          <Constant key="Parameter_223" name="KefATP" value="0.0650065"/>
          <Constant key="Parameter_228" name="KefFbP" value="0.0129987"/>
          <Constant key="Parameter_219" name="KefNADPATP" value="0.139986"/>
          <Constant key="Parameter_226" name="KefNADPFbP" value="0.00519948"/>
          <Constant key="Parameter_227" name="Keq" value="49.962"/>
          <Constant key="Parameter_225" name="KmHCO3" value="6.41899"/>
          <Constant key="Parameter_220" name="KmNADP" value="0.049"/>
          <Constant key="Parameter_224" name="KmNADPH" value="68.3828"/>
          <Constant key="Parameter_240" name="KmPGN" value="0.093"/>
          <Constant key="Parameter_242" name="KmRU5P" value="45.1977"/>
          <Constant key="Parameter_243" name="Vmax" value="4.08105"/>
        </ListOfConstants>
        <KineticLaw function="Function_52" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_444">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_443">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_442">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_441">
              <SourceParameter reference="Parameter_97"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_440">
              <SourceParameter reference="Parameter_98"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_439">
              <SourceParameter reference="Parameter_100"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_438">
              <SourceParameter reference="Parameter_221"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_437">
              <SourceParameter reference="Parameter_222"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_436">
              <SourceParameter reference="Parameter_223"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_435">
              <SourceParameter reference="Parameter_228"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_434">
              <SourceParameter reference="Parameter_219"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_433">
              <SourceParameter reference="Parameter_226"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_432">
              <SourceParameter reference="Parameter_227"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_431">
              <SourceParameter reference="Parameter_225"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_430">
              <SourceParameter reference="Parameter_220"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="Parameter_224"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_428">
              <SourceParameter reference="Parameter_240"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Parameter_242"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_426">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_424">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_423">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_422">
              <SourceParameter reference="Parameter_243"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_12" name="RPE" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_12">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-21T14:42:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_35" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_239" name="Keq" value="1.5015"/>
          <Constant key="Parameter_241" name="KmRU5P" value="0.872522"/>
          <Constant key="Parameter_238" name="KmX5P" value="0.893607"/>
          <Constant key="Parameter_237" name="Vmax" value="6.00103"/>
        </ListOfConstants>
        <KineticLaw function="Function_53" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_450">
              <SourceParameter reference="Parameter_239"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Parameter_241"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_448">
              <SourceParameter reference="Parameter_238"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_447">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_446">
              <SourceParameter reference="Parameter_237"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_445">
              <SourceParameter reference="Metabolite_35"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_13" name="RPI" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_13">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-22T20:48:16Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_30" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_233" name="Keq" value="0.330093"/>
          <Constant key="Parameter_231" name="KmE4P" value="0.67067"/>
          <Constant key="Parameter_230" name="KmR5P" value="3.09715"/>
          <Constant key="Parameter_236" name="KmRU5P" value="4.40263"/>
          <Constant key="Parameter_234" name="Vmax" value="8"/>
        </ListOfConstants>
        <KineticLaw function="Function_54" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_458">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_233"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_456">
              <SourceParameter reference="Parameter_231"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_455">
              <SourceParameter reference="Parameter_230"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_454">
              <SourceParameter reference="Parameter_236"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_453">
              <SourceParameter reference="Metabolite_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_452">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_451">
              <SourceParameter reference="Parameter_234"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_14" name="X5P_GAP_TKT" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_14">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T11:51:30Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_48" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_35" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_12" stoichiometry="1"/>
          <Product metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_235" name="Keq" value="1.001"/>
          <Constant key="Parameter_232" name="kcat" value="40"/>
        </ListOfConstants>
        <KineticLaw function="Function_55" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_463">
              <SourceParameter reference="Parameter_235"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_462">
              <SourceParameter reference="Metabolite_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_461">
              <SourceParameter reference="Parameter_232"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_460">
              <SourceParameter reference="Metabolite_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_459">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_15" name="F6P_E4P_TKT" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_15">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T20:00:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
          <Product metabolite="Metabolite_48" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_229" name="Keq" value="0.5005"/>
          <Constant key="Parameter_218" name="kcat" value="40.0002"/>
        </ListOfConstants>
        <KineticLaw function="Function_56" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_470">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_469">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_468">
              <SourceParameter reference="Parameter_229"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_467">
              <SourceParameter reference="Parameter_218"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_466">
              <SourceParameter reference="Metabolite_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_465">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_16" name="S7P_R5P_TKT" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_16">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-09T18:41:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_30" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_32" stoichiometry="1"/>
          <Product metabolite="Metabolite_48" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_217" name="Keq" value="0.33033"/>
          <Constant key="Parameter_93" name="kcat" value="199.979"/>
        </ListOfConstants>
        <KineticLaw function="Function_57" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_476">
              <SourceParameter reference="Parameter_217"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_475">
              <SourceParameter reference="Metabolite_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_474">
              <SourceParameter reference="Metabolite_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_473">
              <SourceParameter reference="Parameter_93"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_472">
              <SourceParameter reference="Metabolite_48"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_471">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_17" name="F6P_GAP_TAL" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_17">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-27T11:53:43Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_12" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
          <Product metabolite="Metabolite_46" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_92" name="Keq" value="0.11011"/>
          <Constant key="Parameter_95" name="kcat" value="119.992"/>
        </ListOfConstants>
        <KineticLaw function="Function_58" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_482">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_481">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_480">
              <SourceParameter reference="Parameter_92"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_479">
              <SourceParameter reference="Parameter_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_478">
              <SourceParameter reference="Metabolite_46"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_477">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_18" name="S7P_E4P_TAL" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_18">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-09T18:41:34Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_32" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_46" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
          <Product metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_94" name="Keq" value="26.6266"/>
          <Constant key="Parameter_88" name="kcat" value="99.9991"/>
        </ListOfConstants>
        <KineticLaw function="Function_59" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_488">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_487">
              <SourceParameter reference="Parameter_94"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_486">
              <SourceParameter reference="Metabolite_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_485">
              <SourceParameter reference="Parameter_88"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_484">
              <SourceParameter reference="Metabolite_46"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_483">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_19" name="FBP" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_19">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T17:07:07Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
          <Product metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_51" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_57" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_60" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_90" name="KirAMP" value="0.00122122"/>
          <Constant key="Parameter_91" name="KirAMPFDP" value="0.256256"/>
          <Constant key="Parameter_87" name="KirF6P" value="1.12112"/>
          <Constant key="Parameter_89" name="KirF6PMg" value="0.384615"/>
          <Constant key="Parameter_86" name="KirFDP" value="1.35327"/>
          <Constant key="Parameter_85" name="KirFDPMg" value="0.75924"/>
          <Constant key="Parameter_81" name="KirFDPMgMg" value="0.356356"/>
          <Constant key="Parameter_79" name="KirP" value="3.16316"/>
          <Constant key="Parameter_78" name="KirPF6P" value="6.60538"/>
          <Constant key="Parameter_84" name="KirPF6PMg" value="48.4484"/>
          <Constant key="Parameter_82" name="KirPMg" value="0.856"/>
          <Constant key="Parameter_83" name="KitAMP" value="0.000255"/>
          <Constant key="Parameter_80" name="KitAMPFDP" value="690"/>
          <Constant key="Parameter_77" name="KitF6P" value="0.304"/>
          <Constant key="Parameter_69" name="KitF6PMg" value="315"/>
          <Constant key="Parameter_70" name="KitFDP" value="0.043101"/>
          <Constant key="Parameter_71" name="KitFDPMg" value="0.00642"/>
          <Constant key="Parameter_76" name="KitFDPMgMg" value="100"/>
          <Constant key="Parameter_67" name="KitP" value="0.642"/>
          <Constant key="Parameter_74" name="KitPF6P" value="0.00689"/>
          <Constant key="Parameter_75" name="KitPF6PMg" value="16.5"/>
          <Constant key="Parameter_73" name="KitPMg" value="539"/>
          <Constant key="Parameter_68" name="KmrFDP" value="0.0636141"/>
          <Constant key="Parameter_72" name="KmrMg" value="0.039039"/>
          <Constant key="Parameter_203" name="KmtFDP" value="1e-05"/>
          <Constant key="Parameter_209" name="KmtMg" value="55.055"/>
          <Constant key="Parameter_207" name="L0" value="0.000815"/>
          <Constant key="Parameter_214" name="Vmax" value="0.215583"/>
          <Constant key="Parameter_204" name="n" value="4"/>
          <Constant key="Parameter_205" name="KdFDPMg" value="5.81"/>
        </ListOfConstants>
        <KineticLaw function="Function_60" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_524">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_523">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_522">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_521">
              <SourceParameter reference="ModelValue_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_520">
              <SourceParameter reference="Parameter_90"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_519">
              <SourceParameter reference="Parameter_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_518">
              <SourceParameter reference="Parameter_87"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_517">
              <SourceParameter reference="Parameter_89"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_516">
              <SourceParameter reference="Parameter_86"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_515">
              <SourceParameter reference="Parameter_85"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_514">
              <SourceParameter reference="Parameter_81"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_513">
              <SourceParameter reference="Parameter_79"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_512">
              <SourceParameter reference="Parameter_78"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_511">
              <SourceParameter reference="Parameter_84"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_510">
              <SourceParameter reference="Parameter_82"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_509">
              <SourceParameter reference="Parameter_83"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_508">
              <SourceParameter reference="Parameter_80"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_507">
              <SourceParameter reference="Parameter_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_506">
              <SourceParameter reference="Parameter_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_505">
              <SourceParameter reference="Parameter_70"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_504">
              <SourceParameter reference="Parameter_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_503">
              <SourceParameter reference="Parameter_76"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_502">
              <SourceParameter reference="Parameter_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_501">
              <SourceParameter reference="Parameter_74"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_500">
              <SourceParameter reference="Parameter_75"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_499">
              <SourceParameter reference="Parameter_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_498">
              <SourceParameter reference="Parameter_68"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_497">
              <SourceParameter reference="Parameter_72"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_496">
              <SourceParameter reference="Parameter_203"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_495">
              <SourceParameter reference="Parameter_209"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_494">
              <SourceParameter reference="Parameter_207"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_493">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_492">
              <SourceParameter reference="Metabolite_60"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_491">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_490">
              <SourceParameter reference="Parameter_214"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_489">
              <SourceParameter reference="Parameter_204"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_20" name="PPC" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_20">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:45:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_22" stoichiometry="1"/>
          <Product metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_0" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_9" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_10" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_17" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_33" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_61" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_62" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_202" name="KdrOAA" value="4.35404"/>
          <Constant key="Parameter_210" name="KdrPEP" value="655.591"/>
          <Constant key="Parameter_213" name="KdtOAA" value="17.9127"/>
          <Constant key="Parameter_212" name="KdtPEP" value="0.0121991"/>
          <Constant key="Parameter_208" name="KefrACCOA" value="0.140029"/>
          <Constant key="Parameter_215" name="KefrASP" value="0.389183"/>
          <Constant key="Parameter_216" name="KefrCIT" value="34.4277"/>
          <Constant key="Parameter_206" name="KefrCYS" value="0.000448843"/>
          <Constant key="Parameter_211" name="KefrFDP" value="9.99126"/>
          <Constant key="Parameter_66" name="KefrFDPACCOA" value="0.0156251"/>
          <Constant key="Parameter_65" name="KefrFUM" value="2.7475"/>
          <Constant key="Parameter_423" name="KefrMAL" value="0.23002"/>
          <Constant key="Parameter_424" name="KefrSUC" value="22.9834"/>
          <Constant key="Parameter_425" name="KeftACCOA" value="1.27598"/>
          <Constant key="Parameter_426" name="KeftASP" value="27.4729"/>
          <Constant key="Parameter_427" name="KeftCIT" value="0.521945"/>
          <Constant key="Parameter_428" name="KeftCYS" value="0.977374"/>
          <Constant key="Parameter_429" name="KeftFDP" value="13.2064"/>
          <Constant key="Parameter_430" name="KeftFDPACCOA" value="47.7563"/>
          <Constant key="Parameter_431" name="KeftFUM" value="9.76119"/>
          <Constant key="Parameter_432" name="KeftMAL" value="0.737283"/>
          <Constant key="Parameter_433" name="KeftSUC" value="107.18"/>
          <Constant key="Parameter_434" name="Keq" value="149.705"/>
          <Constant key="Parameter_435" name="KmrHCO3" value="0.00219811"/>
          <Constant key="Parameter_436" name="KmrOAA" value="13.0469"/>
          <Constant key="Parameter_437" name="KmrP" value="0.663356"/>
          <Constant key="Parameter_438" name="KmrPEP" value="3.20089"/>
          <Constant key="Parameter_439" name="KmtHCO3" value="0.00220031"/>
          <Constant key="Parameter_440" name="KmtOAA" value="6.80995"/>
          <Constant key="Parameter_441" name="KmtP" value="0.285131"/>
          <Constant key="Parameter_442" name="KmtPEP" value="5.12497"/>
          <Constant key="Parameter_443" name="L0" value="6.37209e-06"/>
          <Constant key="Parameter_444" name="Vmax" value="21.439"/>
          <Constant key="Parameter_445" name="n" value="4.00319"/>
        </ListOfConstants>
        <KineticLaw function="Function_61" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_570">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_569">
              <SourceParameter reference="Metabolite_61"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_568">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_567">
              <SourceParameter reference="Metabolite_62"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_566">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_565">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_564">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_563">
              <SourceParameter reference="Parameter_202"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_562">
              <SourceParameter reference="Parameter_210"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_561">
              <SourceParameter reference="Parameter_213"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_560">
              <SourceParameter reference="Parameter_212"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_559">
              <SourceParameter reference="Parameter_208"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_558">
              <SourceParameter reference="Parameter_215"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_557">
              <SourceParameter reference="Parameter_216"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_556">
              <SourceParameter reference="Parameter_206"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_555">
              <SourceParameter reference="Parameter_211"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_554">
              <SourceParameter reference="Parameter_66"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_553">
              <SourceParameter reference="Parameter_65"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_552">
              <SourceParameter reference="Parameter_423"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_551">
              <SourceParameter reference="Parameter_424"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_550">
              <SourceParameter reference="Parameter_425"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_549">
              <SourceParameter reference="Parameter_426"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_548">
              <SourceParameter reference="Parameter_427"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_547">
              <SourceParameter reference="Parameter_428"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_546">
              <SourceParameter reference="Parameter_429"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_545">
              <SourceParameter reference="Parameter_430"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_544">
              <SourceParameter reference="Parameter_431"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_543">
              <SourceParameter reference="Parameter_432"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_542">
              <SourceParameter reference="Parameter_433"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_541">
              <SourceParameter reference="Parameter_434"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_540">
              <SourceParameter reference="Parameter_435"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_539">
              <SourceParameter reference="Parameter_436"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_538">
              <SourceParameter reference="Parameter_437"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_537">
              <SourceParameter reference="Parameter_438"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_536">
              <SourceParameter reference="Parameter_439"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_535">
              <SourceParameter reference="Parameter_440"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_534">
              <SourceParameter reference="Parameter_441"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_533">
              <SourceParameter reference="Parameter_442"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_532">
              <SourceParameter reference="Parameter_443"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_531">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_530">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_529">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_528">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_527">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_526">
              <SourceParameter reference="Parameter_444"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_525">
              <SourceParameter reference="Parameter_445"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_21" name="PCK" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_21">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:46:44Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_52" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_50" stoichiometry="1"/>
          <Product metabolite="Metabolite_23" stoichiometry="1"/>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_58" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_446" name="Keq" value="1.88166"/>
          <Constant key="Parameter_447" name="KmADP" value="0.04997"/>
          <Constant key="Parameter_448" name="KmATP" value="0.0600418"/>
          <Constant key="Parameter_449" name="KmHCO3" value="2.6319"/>
          <Constant key="Parameter_450" name="KmOAA" value="0.66966"/>
          <Constant key="Parameter_451" name="KmPEP" value="0.0699833"/>
          <Constant key="Parameter_452" name="Vmax" value="8.08777"/>
        </ListOfConstants>
        <KineticLaw function="Function_62" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_583">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_582">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_581">
              <SourceParameter reference="Parameter_446"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_580">
              <SourceParameter reference="Parameter_447"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_579">
              <SourceParameter reference="Parameter_448"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_578">
              <SourceParameter reference="Parameter_449"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_577">
              <SourceParameter reference="Parameter_450"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_576">
              <SourceParameter reference="Parameter_451"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_575">
              <SourceParameter reference="Metabolite_58"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_574">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_573">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_572">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_571">
              <SourceParameter reference="Parameter_452"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_22" name="PPS" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_22">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:57:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_52" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_51" stoichiometry="1"/>
          <Product metabolite="Metabolite_23" stoichiometry="1"/>
          <Product metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_50" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_22" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_57" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_58" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_453" name="KdAMP" value="1480"/>
          <Constant key="Parameter_454" name="KdATPMgPPS" value="0.0549"/>
          <Constant key="Parameter_455" name="KdMg" value="36.9"/>
          <Constant key="Parameter_456" name="KdP" value="346"/>
          <Constant key="Parameter_457" name="KdPEP" value="95.7"/>
          <Constant key="Parameter_458" name="KdPYR" value="2740"/>
          <Constant key="Parameter_459" name="KefADP" value="0.0283"/>
          <Constant key="Parameter_460" name="KefAKG" value="0.274"/>
          <Constant key="Parameter_461" name="KefATP" value="0.000628"/>
          <Constant key="Parameter_462" name="KefOAA" value="0.796"/>
          <Constant key="Parameter_463" name="Keq" value="200000"/>
          <Constant key="Parameter_464" name="KmAMP" value="0.000384"/>
          <Constant key="Parameter_465" name="KmATPMg" value="0.0549"/>
          <Constant key="Parameter_466" name="KmP" value="84.4"/>
          <Constant key="Parameter_467" name="KmPEP" value="20.7"/>
          <Constant key="Parameter_468" name="KmPYR" value="0.229"/>
          <Constant key="Parameter_469" name="Vmax" value="0.0163772"/>
          <Constant key="Parameter_470" name="W" value="10"/>
          <Constant key="Parameter_471" name="alpha" value="38900"/>
          <Constant key="Parameter_472" name="KdADPMg" value="1.27771"/>
          <Constant key="Parameter_473" name="KdATPMg" value="0.0847634"/>
        </ListOfConstants>
        <KineticLaw function="Function_63" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_615">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_614">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_613">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_612">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_611">
              <SourceParameter reference="ModelValue_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_610">
              <SourceParameter reference="Parameter_453"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_609">
              <SourceParameter reference="ModelValue_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_608">
              <SourceParameter reference="Parameter_454"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_607">
              <SourceParameter reference="Parameter_455"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_606">
              <SourceParameter reference="Parameter_456"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_605">
              <SourceParameter reference="Parameter_457"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_604">
              <SourceParameter reference="Parameter_458"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_603">
              <SourceParameter reference="Parameter_459"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_602">
              <SourceParameter reference="Parameter_460"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_601">
              <SourceParameter reference="Parameter_461"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_600">
              <SourceParameter reference="Parameter_462"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_599">
              <SourceParameter reference="Parameter_463"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_598">
              <SourceParameter reference="Parameter_464"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_597">
              <SourceParameter reference="Parameter_465"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_596">
              <SourceParameter reference="Parameter_466"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_595">
              <SourceParameter reference="Parameter_467"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_594">
              <SourceParameter reference="Parameter_468"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_593">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_592">
              <SourceParameter reference="Metabolite_58"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_591">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_590">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_589">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_588">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_587">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_586">
              <SourceParameter reference="Parameter_469"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_585">
              <SourceParameter reference="Parameter_470"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_584">
              <SourceParameter reference="Parameter_471"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_23" name="MAE" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_23">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:56:51Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_52" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_0" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_54" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_57" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_61" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_63" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_474" name="KefrACCOA" value="1.83336"/>
          <Constant key="Parameter_475" name="KefrASP" value="0.362142"/>
          <Constant key="Parameter_476" name="KefrATP" value="88.9752"/>
          <Constant key="Parameter_477" name="KefrCOA" value="0.268"/>
          <Constant key="Parameter_478" name="KeftACCOA" value="0.197"/>
          <Constant key="Parameter_479" name="KeftASP" value="0.583"/>
          <Constant key="Parameter_480" name="KeftATP" value="0.26"/>
          <Constant key="Parameter_481" name="KeftCOA" value="0.268"/>
          <Constant key="Parameter_482" name="KirNAD" value="0.636457"/>
          <Constant key="Parameter_483" name="KitNAD" value="0.990398"/>
          <Constant key="Parameter_484" name="KmrMAL" value="0.212913"/>
          <Constant key="Parameter_485" name="KmrMg" value="0.191871"/>
          <Constant key="Parameter_486" name="KmrMn" value="0.272568"/>
          <Constant key="Parameter_487" name="KmrNAD" value="1.36636"/>
          <Constant key="Parameter_488" name="KmtMAL" value="0.093"/>
          <Constant key="Parameter_489" name="KmtMg" value="2.37681"/>
          <Constant key="Parameter_490" name="KmtMn" value="0.410198"/>
          <Constant key="Parameter_491" name="KmtNAD" value="0.108"/>
          <Constant key="Parameter_492" name="L0" value="19.9"/>
          <Constant key="Parameter_493" name="Vmax" value="6.64269"/>
          <Constant key="Parameter_494" name="n" value="4"/>
        </ListOfConstants>
        <KineticLaw function="Function_64" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_644">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_643">
              <SourceParameter reference="Metabolite_61"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_642">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_641">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_640">
              <SourceParameter reference="Parameter_474"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_639">
              <SourceParameter reference="Parameter_475"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_638">
              <SourceParameter reference="Parameter_476"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_637">
              <SourceParameter reference="Parameter_477"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_636">
              <SourceParameter reference="Parameter_478"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_635">
              <SourceParameter reference="Parameter_479"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_634">
              <SourceParameter reference="Parameter_480"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_633">
              <SourceParameter reference="Parameter_481"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_632">
              <SourceParameter reference="Parameter_482"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_631">
              <SourceParameter reference="Parameter_483"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_630">
              <SourceParameter reference="Parameter_484"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_629">
              <SourceParameter reference="Parameter_485"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_628">
              <SourceParameter reference="Parameter_486"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_627">
              <SourceParameter reference="Parameter_487"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_626">
              <SourceParameter reference="Parameter_488"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_625">
              <SourceParameter reference="Parameter_489"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_624">
              <SourceParameter reference="Parameter_490"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_623">
              <SourceParameter reference="Parameter_491"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_622">
              <SourceParameter reference="Parameter_492"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_621">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_620">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_619">
              <SourceParameter reference="Metabolite_63"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_618">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_617">
              <SourceParameter reference="Parameter_493"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_616">
              <SourceParameter reference="Parameter_494"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_24" name="PDH" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_24">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:47:07Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_54" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_495" name="Keq" value="3138.16"/>
          <Constant key="Parameter_496" name="KmACCOA" value="10.174"/>
          <Constant key="Parameter_497" name="KmCOA" value="0.00500461"/>
          <Constant key="Parameter_498" name="KmHCO3" value="0.00545112"/>
          <Constant key="Parameter_499" name="KmNAD" value="0.00999"/>
          <Constant key="Parameter_500" name="KmNADH" value="6.63512"/>
          <Constant key="Parameter_501" name="KmPYR" value="2"/>
          <Constant key="Parameter_502" name="Vmax" value="961.706"/>
        </ListOfConstants>
        <KineticLaw function="Function_65" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_658">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_657">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_656">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_655">
              <SourceParameter reference="Parameter_495"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_654">
              <SourceParameter reference="Parameter_496"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_653">
              <SourceParameter reference="Parameter_497"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_652">
              <SourceParameter reference="Parameter_498"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_651">
              <SourceParameter reference="Parameter_499"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_650">
              <SourceParameter reference="Parameter_500"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_649">
              <SourceParameter reference="Parameter_501"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_648">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_647">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_646">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_645">
              <SourceParameter reference="Parameter_502"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_25" name="GLT" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_25">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:45:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
          <Product metabolite="Metabolite_54" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_52" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_503" name="KdACCOA0" value="0.699309"/>
          <Constant key="Parameter_504" name="KdcsCIT" value="7.38128"/>
          <Constant key="Parameter_505" name="KdcsCOA" value="0.00174282"/>
          <Constant key="Parameter_506" name="KdcsOAA" value="0.154601"/>
          <Constant key="Parameter_507" name="Keq" value="83067.1"/>
          <Constant key="Parameter_508" name="Ki1AKG" value="0.0150083"/>
          <Constant key="Parameter_509" name="Ki1NADH" value="0.000330313"/>
          <Constant key="Parameter_510" name="Ki2AKG" value="0.256252"/>
          <Constant key="Parameter_511" name="Ki2NADH" value="0.0504"/>
          <Constant key="Parameter_512" name="KiATP" value="0.579939"/>
          <Constant key="Parameter_513" name="KmACCOA0" value="0.119974"/>
          <Constant key="Parameter_514" name="KmOAA0" value="0.00123458"/>
          <Constant key="Parameter_515" name="KmcsCIT" value="1.15715"/>
          <Constant key="Parameter_516" name="KmcsCOA" value="9.6344e-05"/>
          <Constant key="Parameter_517" name="Vmax" value="57.0584"/>
        </ListOfConstants>
        <KineticLaw function="Function_66" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_680">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_679">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_678">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_677">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_676">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_675">
              <SourceParameter reference="Parameter_503"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_674">
              <SourceParameter reference="Parameter_504"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_673">
              <SourceParameter reference="Parameter_505"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_672">
              <SourceParameter reference="Parameter_506"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_671">
              <SourceParameter reference="Parameter_507"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_670">
              <SourceParameter reference="Parameter_508"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_669">
              <SourceParameter reference="Parameter_509"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_668">
              <SourceParameter reference="Parameter_510"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_667">
              <SourceParameter reference="Parameter_511"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_666">
              <SourceParameter reference="Parameter_512"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_665">
              <SourceParameter reference="Parameter_513"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_664">
              <SourceParameter reference="Parameter_514"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_663">
              <SourceParameter reference="Parameter_515"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_662">
              <SourceParameter reference="Parameter_516"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_661">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_660">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_659">
              <SourceParameter reference="Parameter_517"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_26" name="ACN_1" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_26">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T20:01:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_518" name="Keq" value="0.384503"/>
          <Constant key="Parameter_519" name="Vmax" value="9.72413"/>
          <Constant key="Parameter_520" name="KmACO_ACN" value="0.02001"/>
          <Constant key="Parameter_521" name="KmCIT_ACN" value="0.0628882"/>
          <Constant key="Parameter_522" name="KmICIT_ACN" value="9.31352"/>
        </ListOfConstants>
        <KineticLaw function="Function_103" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1159">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1224">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1225">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1157">
              <SourceParameter reference="Parameter_518"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_987">
              <SourceParameter reference="ModelValue_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1238">
              <SourceParameter reference="ModelValue_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1227">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1024">
              <SourceParameter reference="Parameter_519"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_27" name="ACN_2" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_27">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:56:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_523" name="Keq" value="3.49183"/>
          <Constant key="Parameter_524" name="Vmax" value="9.86571"/>
          <Constant key="Parameter_525" name="KmACO_ACN" value="0.02001"/>
          <Constant key="Parameter_526" name="KmCIT_ACN" value="0.0628882"/>
          <Constant key="Parameter_527" name="KmICIT_ACN" value="9.31352"/>
        </ListOfConstants>
        <KineticLaw function="Function_104" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1026">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1254">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1253">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1252">
              <SourceParameter reference="Parameter_523"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1251">
              <SourceParameter reference="ModelValue_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1250">
              <SourceParameter reference="ModelValue_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1249">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1248">
              <SourceParameter reference="Parameter_524"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_28" name="ICD" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_28">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T09:23:45Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_15" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_44" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_528" name="Keq" value="28.1631"/>
          <Constant key="Parameter_529" name="KmAKG" value="0.038038"/>
          <Constant key="Parameter_530" name="KmICIT" value="0.010989"/>
          <Constant key="Parameter_531" name="KmNADP" value="0.005994"/>
          <Constant key="Parameter_532" name="KmNADPH" value="0.000683333"/>
          <Constant key="Parameter_533" name="kcat" value="2461.97"/>
        </ListOfConstants>
        <KineticLaw function="Function_69" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_707">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_706">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_705">
              <SourceParameter reference="Parameter_528"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_704">
              <SourceParameter reference="Parameter_529"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_703">
              <SourceParameter reference="Parameter_530"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_702">
              <SourceParameter reference="Parameter_531"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_701">
              <SourceParameter reference="Parameter_532"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_700">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_699">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_698">
              <SourceParameter reference="Metabolite_44"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_697">
              <SourceParameter reference="Parameter_533"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_29" name="LPD" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_29">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T17:04:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_54" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
          <Product metabolite="Metabolite_34" stoichiometry="1"/>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_534" name="KdAKG" value="14.9386"/>
          <Constant key="Parameter_535" name="KmAKG" value="0.020002"/>
          <Constant key="Parameter_536" name="KmCOA" value="0.0760076"/>
          <Constant key="Parameter_537" name="KmNAD" value="0.0980098"/>
          <Constant key="Parameter_538" name="Vmax" value="0.0684413"/>
          <Constant key="Parameter_539" name="alpha" value="16.4304"/>
        </ListOfConstants>
        <KineticLaw function="Function_70" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_716">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_715">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_714">
              <SourceParameter reference="Parameter_534"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_713">
              <SourceParameter reference="Parameter_535"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_712">
              <SourceParameter reference="Parameter_536"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_711">
              <SourceParameter reference="Parameter_537"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_710">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_709">
              <SourceParameter reference="Parameter_538"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_708">
              <SourceParameter reference="Parameter_539"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_30" name="SK" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_30">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T16:20:56Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_50" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_34" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_52" stoichiometry="1"/>
          <Product metabolite="Metabolite_54" stoichiometry="1"/>
          <Product metabolite="Metabolite_33" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_540" name="Keq" value="1.15994"/>
          <Constant key="Parameter_541" name="KmADP" value="0.00868475"/>
          <Constant key="Parameter_542" name="KmATP" value="0.102321"/>
          <Constant key="Parameter_543" name="KmCOA" value="0.255019"/>
          <Constant key="Parameter_544" name="KmP" value="0.914709"/>
          <Constant key="Parameter_545" name="KmSUC" value="0.800744"/>
          <Constant key="Parameter_546" name="KmSUCCOA" value="0.0085"/>
          <Constant key="Parameter_547" name="Vmax" value="76.8163"/>
        </ListOfConstants>
        <KineticLaw function="Function_71" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_730">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_729">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_728">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_727">
              <SourceParameter reference="Parameter_540"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_726">
              <SourceParameter reference="Parameter_541"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_725">
              <SourceParameter reference="Parameter_542"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_724">
              <SourceParameter reference="Parameter_543"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_723">
              <SourceParameter reference="Parameter_544"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_722">
              <SourceParameter reference="Parameter_545"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_721">
              <SourceParameter reference="Parameter_546"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_720">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_719">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_718">
              <SourceParameter reference="Metabolite_34"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_717">
              <SourceParameter reference="Parameter_547"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_31" name="SDH" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_31">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T15:38:25Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_67" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_33" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_10" stoichiometry="1"/>
          <Product metabolite="Metabolite_68" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_548" name="KefFUM" value="0.067048"/>
          <Constant key="Parameter_549" name="KefSUC" value="0.0322425"/>
          <Constant key="Parameter_550" name="Keq" value="2250"/>
          <Constant key="Parameter_551" name="KmFUM" value="1.36019"/>
          <Constant key="Parameter_552" name="KmQ" value="0.00160718"/>
          <Constant key="Parameter_553" name="KmQH2" value="0.00611663"/>
          <Constant key="Parameter_554" name="KmSUC" value="0.805727"/>
          <Constant key="Parameter_555" name="Vmax" value="1.56184"/>
        </ListOfConstants>
        <KineticLaw function="Function_105" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_988">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1228">
              <SourceParameter reference="Metabolite_68"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1479">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1478">
              <SourceParameter reference="Parameter_548"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1477">
              <SourceParameter reference="Parameter_549"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1476">
              <SourceParameter reference="Parameter_550"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1475">
              <SourceParameter reference="Parameter_551"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1474">
              <SourceParameter reference="Parameter_552"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1473">
              <SourceParameter reference="Parameter_553"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1472">
              <SourceParameter reference="Parameter_554"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1471">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1470">
              <SourceParameter reference="Parameter_555"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_32" name="FUMA" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_32">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-07T12:23:44Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_556" name="Keq" value="4.99966"/>
          <Constant key="Parameter_557" name="KmFUM" value="0.6"/>
          <Constant key="Parameter_558" name="KmMAL" value="0.7"/>
          <Constant key="Parameter_559" name="Vmax" value="53.3414"/>
        </ListOfConstants>
        <KineticLaw function="Function_73" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_748">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_747">
              <SourceParameter reference="Parameter_556"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_746">
              <SourceParameter reference="Parameter_557"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_745">
              <SourceParameter reference="Parameter_558"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_744">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_743">
              <SourceParameter reference="Parameter_559"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_33" name="MQO" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_33">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T16:57:52Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_22" stoichiometry="1"/>
          <Product metabolite="Metabolite_29" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_560" name="Keq" value="9"/>
          <Constant key="Parameter_561" name="KmMAL" value="0.435"/>
          <Constant key="Parameter_562" name="KmOAA" value="75.8036"/>
          <Constant key="Parameter_563" name="KmQ" value="0.0414"/>
          <Constant key="Parameter_564" name="KmQH2" value="8.77942"/>
          <Constant key="Parameter_565" name="Vmax" value="4.62283"/>
        </ListOfConstants>
        <KineticLaw function="Function_74" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_758">
              <SourceParameter reference="Parameter_560"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_757">
              <SourceParameter reference="Parameter_561"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_756">
              <SourceParameter reference="Parameter_562"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_755">
              <SourceParameter reference="Parameter_563"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_754">
              <SourceParameter reference="Parameter_564"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_753">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_752">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_751">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_750">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_749">
              <SourceParameter reference="Parameter_565"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_34" name="MDH" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_34">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T16:59:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_29" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
          <Product metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_18" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_566" name="Keq" value="100000"/>
          <Constant key="Parameter_567" name="KiNAD" value="0.0233122"/>
          <Constant key="Parameter_568" name="KiNADH" value="0.000196981"/>
          <Constant key="Parameter_569" name="KiOAA" value="2.46446"/>
          <Constant key="Parameter_570" name="KmMAL" value="0.86"/>
          <Constant key="Parameter_571" name="KmNAD" value="0.64"/>
          <Constant key="Parameter_572" name="KmNADH" value="0.003"/>
          <Constant key="Parameter_573" name="KmOAA" value="0.001"/>
          <Constant key="Parameter_574" name="Vmax" value="6.11492"/>
        </ListOfConstants>
        <KineticLaw function="Function_75" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_771">
              <SourceParameter reference="Parameter_566"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_770">
              <SourceParameter reference="Parameter_567"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_769">
              <SourceParameter reference="Parameter_568"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_768">
              <SourceParameter reference="Parameter_569"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_767">
              <SourceParameter reference="Parameter_570"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_766">
              <SourceParameter reference="Parameter_571"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_765">
              <SourceParameter reference="Parameter_572"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_764">
              <SourceParameter reference="Parameter_573"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_763">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_762">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_761">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_760">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_759">
              <SourceParameter reference="Parameter_574"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_35" name="ACEA" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_35">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T10:03:15Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_14" stoichiometry="1"/>
          <Product metabolite="Metabolite_33" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_23" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_575" name="KdICITsuc" value="0.00489074"/>
          <Constant key="Parameter_576" name="KdPEP" value="1.05105"/>
          <Constant key="Parameter_577" name="KdPEPglx" value="0.0358555"/>
          <Constant key="Parameter_578" name="KdPEPicit" value="0.164263"/>
          <Constant key="Parameter_579" name="KdPGA3" value="0.8"/>
          <Constant key="Parameter_580" name="KdSUC" value="0.53053"/>
          <Constant key="Parameter_581" name="Keq" value="8.8088"/>
          <Constant key="Parameter_582" name="KmGLX" value="0.13013"/>
          <Constant key="Parameter_583" name="KmICIT" value="0.063063"/>
          <Constant key="Parameter_584" name="KmSUC" value="0.58941"/>
          <Constant key="Parameter_585" name="Vmax" value="1.52595"/>
        </ListOfConstants>
        <KineticLaw function="Function_76" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_787">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_786">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_785">
              <SourceParameter reference="Parameter_575"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_784">
              <SourceParameter reference="Parameter_576"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_783">
              <SourceParameter reference="Parameter_577"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_782">
              <SourceParameter reference="Parameter_578"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_781">
              <SourceParameter reference="Parameter_579"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_780">
              <SourceParameter reference="Parameter_580"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_779">
              <SourceParameter reference="Parameter_581"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_778">
              <SourceParameter reference="Parameter_582"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_777">
              <SourceParameter reference="Parameter_583"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_776">
              <SourceParameter reference="Parameter_584"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_775">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_774">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_773">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_772">
              <SourceParameter reference="Parameter_585"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_36" name="ACEB" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_36">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T11:32:16Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_54" stoichiometry="1"/>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_586" name="Keq" value="230000"/>
          <Constant key="Parameter_587" name="KmACCOA" value="0.009"/>
          <Constant key="Parameter_588" name="KmCOA" value="10.5652"/>
          <Constant key="Parameter_589" name="KmGLX" value="0.021"/>
          <Constant key="Parameter_590" name="KmMAL" value="15.0572"/>
          <Constant key="Parameter_591" name="Vmax" value="0.352769"/>
        </ListOfConstants>
        <KineticLaw function="Function_77" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_797">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_796">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_795">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_794">
              <SourceParameter reference="Parameter_586"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_793">
              <SourceParameter reference="Parameter_587"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_792">
              <SourceParameter reference="Parameter_588"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_791">
              <SourceParameter reference="Parameter_589"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_790">
              <SourceParameter reference="Parameter_590"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_789">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_788">
              <SourceParameter reference="Parameter_591"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_37" name="ACEK_1" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_37">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:48:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_52" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_44" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_50" stoichiometry="1"/>
          <Product metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_592" name="Keq" value="888"/>
          <Constant key="Parameter_593" name="k" value="1.25457"/>
        </ListOfConstants>
        <KineticLaw function="Function_78" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_803">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_802">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_801">
              <SourceParameter reference="Parameter_592"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_800">
              <SourceParameter reference="Metabolite_44"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_799">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_798">
              <SourceParameter reference="Parameter_593"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_38" name="ACEK_2" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_38">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:48:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_44" stoichiometry="1"/>
          <Product metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_594" name="Keq" value="400"/>
          <Constant key="Parameter_595" name="k" value="0.0332"/>
        </ListOfConstants>
        <KineticLaw function="Function_79" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_808">
              <SourceParameter reference="Parameter_594"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_807">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_806">
              <SourceParameter reference="Metabolite_44"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_805">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_804">
              <SourceParameter reference="Parameter_595"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_39" name="EDD" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_39">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T19:07:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_596" name="Keq" value="1000"/>
          <Constant key="Parameter_597" name="KmKDPG" value="0.318316"/>
          <Constant key="Parameter_598" name="KmPGN" value="0.6"/>
          <Constant key="Parameter_599" name="Vmax" value="0.111359"/>
        </ListOfConstants>
        <KineticLaw function="Function_80" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_814">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_813">
              <SourceParameter reference="Parameter_596"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_812">
              <SourceParameter reference="Parameter_597"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_811">
              <SourceParameter reference="Parameter_598"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_810">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_809">
              <SourceParameter reference="Parameter_599"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_40" name="EDA" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_40">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T19:06:34Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_12" stoichiometry="1"/>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_600" name="Keq" value="0.5"/>
          <Constant key="Parameter_601" name="KmGAP" value="86.678"/>
          <Constant key="Parameter_602" name="KmKDPG" value="0.06"/>
          <Constant key="Parameter_603" name="KmPYR" value="10"/>
          <Constant key="Parameter_604" name="Vmax" value="0.0775241"/>
        </ListOfConstants>
        <KineticLaw function="Function_81" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_822">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_821">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_820">
              <SourceParameter reference="Parameter_600"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_819">
              <SourceParameter reference="Parameter_601"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_818">
              <SourceParameter reference="Parameter_602"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_817">
              <SourceParameter reference="Parameter_603"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_816">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_815">
              <SourceParameter reference="Parameter_604"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_41" name="NDHI" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-26T16:30:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_28" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_64" stoichiometry="4"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
          <Product metabolite="Metabolite_29" stoichiometry="1"/>
          <Product metabolite="Metabolite_73" stoichiometry="4"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_64" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_73" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_605" name="Vmax" value="23.0735"/>
          <Constant key="Parameter_606" name="KeqNDH" value="27.6193"/>
        </ListOfConstants>
        <KineticLaw function="Function_106" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1577">
              <SourceParameter reference="Metabolite_64"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1576">
              <SourceParameter reference="Metabolite_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1575">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1574">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1223">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1547">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1548">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1450">
              <SourceParameter reference="Parameter_605"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_42" name="PNT" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_42">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T13:54:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
          <Product metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_607" name="Keq" value="0.181891"/>
          <Constant key="Parameter_608" name="k" value="2.49441"/>
        </ListOfConstants>
        <KineticLaw function="Function_82" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_828">
              <SourceParameter reference="Parameter_607"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_827">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_826">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_825">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_824">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_823">
              <SourceParameter reference="Parameter_608"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_43" name="ADK" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:48:35Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_51" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_52" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_50" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_609" name="Keq" value="0.962758"/>
          <Constant key="Parameter_610" name="k" value="0.242256"/>
        </ListOfConstants>
        <KineticLaw function="Function_83" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_833">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_832">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_831">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_830">
              <SourceParameter reference="Parameter_609"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_829">
              <SourceParameter reference="Parameter_610"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_44" name="ATP_SYN" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_44">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:48:42Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_50" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_56" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_73" stoichiometry="4"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_52" stoichiometry="1"/>
          <Product metabolite="Metabolite_64" stoichiometry="4"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_64" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_73" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_611" name="Vmax" value="108.733"/>
          <Constant key="Parameter_612" name="Keq" value="49.8315"/>
        </ListOfConstants>
        <KineticLaw function="Function_107" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1596">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1597">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1447">
              <SourceParameter reference="Metabolite_64"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1607">
              <SourceParameter reference="Metabolite_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1608">
              <SourceParameter reference="Parameter_612"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1609">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1610">
              <SourceParameter reference="Parameter_611"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_45" name="CYA" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:49:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_52" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_53" stoichiometry="1"/>
          <Product metabolite="Metabolite_56" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_613" name="Keq" value="2591.19"/>
          <Constant key="Parameter_614" name="k" value="0.00414418"/>
          <Constant key="Parameter_615" name="KaeiiaP" value="0.180981"/>
        </ListOfConstants>
        <KineticLaw function="Function_108" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1618">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1619">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1620">
              <SourceParameter reference="Parameter_615"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1621">
              <SourceParameter reference="Parameter_613"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1622">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1623">
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1624">
              <SourceParameter reference="Parameter_614"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_46" name="DOS" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_46">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:49:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_616" name="Keq" value="674.242"/>
          <Constant key="Parameter_617" name="k" value="0.00828"/>
        </ListOfConstants>
        <KineticLaw function="Function_85" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_844">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_843">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_842">
              <SourceParameter reference="Parameter_616"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_841">
              <SourceParameter reference="Parameter_617"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_47" name="ACK" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_47">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:48:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_50" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_69" stoichiometry="1"/>
          <Product metabolite="Metabolite_52" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_618" name="Keq" value="174"/>
          <Constant key="Parameter_619" name="KmACE" value="7"/>
          <Constant key="Parameter_620" name="KmACP" value="0.16"/>
          <Constant key="Parameter_621" name="KmADP" value="0.5"/>
          <Constant key="Parameter_622" name="KmATP" value="0.07"/>
          <Constant key="Parameter_623" name="Vmax" value="7.23"/>
        </ListOfConstants>
        <KineticLaw function="Function_86" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_855">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_854">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_853">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_852">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_851">
              <SourceParameter reference="Parameter_618"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_850">
              <SourceParameter reference="Parameter_619"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_849">
              <SourceParameter reference="Parameter_620"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_848">
              <SourceParameter reference="Parameter_621"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_847">
              <SourceParameter reference="Parameter_622"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_846">
              <SourceParameter reference="Parameter_623"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_845">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_48" name="ACS" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_48">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-25T19:59:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_69" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_52" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_54" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
          <Product metabolite="Metabolite_51" stoichiometry="1"/>
          <Product metabolite="Metabolite_56" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_624" name="KmACE" value="0.07"/>
          <Constant key="Parameter_625" name="KmATP" value="0.1"/>
          <Constant key="Parameter_626" name="KmCOA" value="0.01"/>
          <Constant key="Parameter_627" name="Vmax" value="7.3"/>
        </ListOfConstants>
        <KineticLaw function="Function_87" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_863">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_862">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_861">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_860">
              <SourceParameter reference="Parameter_624"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_859">
              <SourceParameter reference="Parameter_625"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_858">
              <SourceParameter reference="Parameter_626"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_857">
              <SourceParameter reference="Parameter_627"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_856">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_49" name="PTA" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-01T17:09:21Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_54" stoichiometry="1"/>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_628" name="Keq" value="0.0053952"/>
          <Constant key="Parameter_629" name="KiACCOA" value="0.2"/>
          <Constant key="Parameter_630" name="KiACP" value="0.2"/>
          <Constant key="Parameter_631" name="KiCOA" value="0.029"/>
          <Constant key="Parameter_632" name="KiP" value="13.54"/>
          <Constant key="Parameter_633" name="KmACP" value="0.7"/>
          <Constant key="Parameter_634" name="KmP" value="6.1"/>
          <Constant key="Parameter_635" name="Vmax" value="2.7"/>
        </ListOfConstants>
        <KineticLaw function="Function_88" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_875">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_874">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_873">
              <SourceParameter reference="Metabolite_54"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_872">
              <SourceParameter reference="Parameter_628"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_871">
              <SourceParameter reference="Parameter_629"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_870">
              <SourceParameter reference="Parameter_630"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_869">
              <SourceParameter reference="Parameter_631"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_868">
              <SourceParameter reference="Parameter_632"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_867">
              <SourceParameter reference="Parameter_633"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_866">
              <SourceParameter reference="Parameter_634"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_865">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_864">
              <SourceParameter reference="Parameter_635"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_50" name="PTS_0" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_50">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T12:14:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_36" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_37" stoichiometry="1"/>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_636" name="KmPEP" value="0.6"/>
          <Constant key="Parameter_637" name="KmPYR" value="1"/>
          <Constant key="Parameter_638" name="kF" value="12000"/>
          <Constant key="Parameter_639" name="kR" value="8000"/>
        </ListOfConstants>
        <KineticLaw function="Function_89" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_883">
              <SourceParameter reference="Parameter_636"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_882">
              <SourceParameter reference="Parameter_637"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_881">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_880">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_879">
              <SourceParameter reference="Metabolite_36"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_878">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_877">
              <SourceParameter reference="Parameter_638"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_876">
              <SourceParameter reference="Parameter_639"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_51" name="PTS_1" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_51">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-03T00:49:35Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_42" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_43" stoichiometry="1"/>
          <Product metabolite="Metabolite_36" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_640" name="k1" value="200000"/>
          <Constant key="Parameter_641" name="k2" value="8000"/>
        </ListOfConstants>
        <KineticLaw function="Function_14" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_69">
              <SourceParameter reference="Parameter_640"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_68">
              <SourceParameter reference="Metabolite_42"/>
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_78">
              <SourceParameter reference="Parameter_641"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_43"/>
              <SourceParameter reference="Metabolite_36"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_52" name="PTS_2" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_52">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T10:24:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_38" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_39" stoichiometry="1"/>
          <Product metabolite="Metabolite_42" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_642" name="k1" value="61000"/>
          <Constant key="Parameter_643" name="k2" value="47000"/>
        </ListOfConstants>
        <KineticLaw function="Function_14" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_69">
              <SourceParameter reference="Parameter_642"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_68">
              <SourceParameter reference="Metabolite_38"/>
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_78">
              <SourceParameter reference="Parameter_643"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_39"/>
              <SourceParameter reference="Metabolite_42"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_53" name="PTS_3" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_53">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T12:14:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_40" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_41" stoichiometry="1"/>
          <Product metabolite="Metabolite_38" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_644" name="k1" value="11000"/>
          <Constant key="Parameter_645" name="k2" value="4000"/>
        </ListOfConstants>
        <KineticLaw function="Function_14" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_69">
              <SourceParameter reference="Parameter_644"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_68">
              <SourceParameter reference="Metabolite_40"/>
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_78">
              <SourceParameter reference="Parameter_645"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_41"/>
              <SourceParameter reference="Metabolite_38"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_54" name="PTS_4" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_54">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T12:14:34Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_74" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
          <Product metabolite="Metabolite_40" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_646" name="KmG6P" value="2125.91"/>
          <Constant key="Parameter_647" name="KmGLC" value="0.02"/>
          <Constant key="Parameter_648" name="kF" value="4000"/>
          <Constant key="Parameter_649" name="kR" value="1e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_109" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1689">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1690">
              <SourceParameter reference="Metabolite_74"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1691">
              <SourceParameter reference="Parameter_646"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1692">
              <SourceParameter reference="Parameter_647"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1693">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1694">
              <SourceParameter reference="Metabolite_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1695">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1696">
              <SourceParameter reference="Parameter_648"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1697">
              <SourceParameter reference="Parameter_649"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_55" name="_GLC_FEED" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_55">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-09-30T23:49:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_70" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_650" name="FEED" value="0.23"/>
        </ListOfConstants>
        <KineticLaw function="Function_91" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[extracellular]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_895">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_894">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_893">
              <SourceParameter reference="Compartment_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_56" name="CYTBO" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_56">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T09:53:39Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_29" stoichiometry="2"/>
          <Substrate metabolite="Metabolite_64" stoichiometry="8"/>
          <Substrate metabolite="Metabolite_66" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_28" stoichiometry="2"/>
          <Product metabolite="Metabolite_73" stoichiometry="8"/>
          <Product metabolite="Metabolite_65" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_64" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_73" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_651" name="Vmax" value="8.54045"/>
          <Constant key="Parameter_652" name="Keq" value="12.067"/>
        </ListOfConstants>
        <KineticLaw function="Function_110" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1708">
              <SourceParameter reference="Metabolite_64"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1709">
              <SourceParameter reference="Metabolite_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1710">
              <SourceParameter reference="Parameter_652"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1711">
              <SourceParameter reference="Metabolite_66"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1712">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1713">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1714">
              <SourceParameter reference="Parameter_651"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_57" name="SQR" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_57">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-15T13:54:45Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_68" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_67" stoichiometry="1"/>
          <Product metabolite="Metabolite_29" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_653" name="Keq" value="0.94033"/>
          <Constant key="Parameter_654" name="Vmax" value="3.41617"/>
        </ListOfConstants>
        <KineticLaw function="Function_111" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1595">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1722">
              <SourceParameter reference="Metabolite_68"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1723">
              <SourceParameter reference="Parameter_653"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1724">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1725">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1726">
              <SourceParameter reference="Parameter_654"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_58" name="NDHII" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_58">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-17T08:01:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
          <Product metabolite="Metabolite_29" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_655" name="Vmax" value="30.8306"/>
          <Constant key="Parameter_656" name="KeqNDH" value="27.6193"/>
        </ListOfConstants>
        <KineticLaw function="Function_112" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1733">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1734">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1735">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1736">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1737">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1738">
              <SourceParameter reference="Parameter_655"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_59" name="GROWTH" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_59">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-21T14:35:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="116"/>
          <Substrate metabolite="Metabolite_7" stoichiometry="204"/>
          <Substrate metabolite="Metabolite_25" stoichiometry="845"/>
          <Substrate metabolite="Metabolite_22" stoichiometry="1010"/>
          <Substrate metabolite="Metabolite_3" stoichiometry="610"/>
          <Substrate metabolite="Metabolite_27" stoichiometry="1601"/>
          <Substrate metabolite="Metabolite_30" stoichiometry="507"/>
          <Substrate metabolite="Metabolite_23" stoichiometry="293"/>
          <Substrate metabolite="Metabolite_12" stoichiometry="73"/>
          <Substrate metabolite="Metabolite_8" stoichiometry="40"/>
          <Substrate metabolite="Metabolite_21" stoichiometry="10169"/>
          <Substrate metabolite="Metabolite_0" stoichiometry="2118"/>
          <Substrate metabolite="Metabolite_18" stoichiometry="2004"/>
          <Substrate metabolite="Metabolite_52" stoichiometry="30508"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_20" stoichiometry="10169"/>
          <Product metabolite="Metabolite_54" stoichiometry="2118"/>
          <Product metabolite="Metabolite_19" stoichiometry="2004"/>
          <Product metabolite="Metabolite_50" stoichiometry="30508"/>
          <Product metabolite="Metabolite_56" stoichiometry="30508"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_657" name="Vmax" value="9.74137"/>
          <Constant key="Parameter_658" name="KmG6P" value="1.20911"/>
          <Constant key="Parameter_659" name="KmE4P" value="1.63298"/>
          <Constant key="Parameter_660" name="KmPGA3" value="0.0764619"/>
          <Constant key="Parameter_661" name="KmOAA" value="0.0248351"/>
          <Constant key="Parameter_662" name="KmAKG" value="5.11989"/>
          <Constant key="Parameter_663" name="KmPYR" value="0.00463904"/>
          <Constant key="Parameter_664" name="KmR5P" value="0.021234"/>
          <Constant key="Parameter_665" name="KmPEP" value="0.457734"/>
          <Constant key="Parameter_666" name="KmGAP" value="0.024854"/>
          <Constant key="Parameter_667" name="KmF6P" value="0.366423"/>
          <Constant key="Parameter_668" name="KmNADPH" value="3.59774"/>
          <Constant key="Parameter_669" name="KmACCOA" value="0.0494404"/>
          <Constant key="Parameter_670" name="KmNAD" value="2.82239"/>
          <Constant key="Parameter_671" name="KmATP" value="0.0468266"/>
        </ListOfConstants>
        <KineticLaw function="Function_113" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1768">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1769">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1770">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1771">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1772">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1773">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1774">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1775">
              <SourceParameter reference="Parameter_669"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1776">
              <SourceParameter reference="Parameter_662"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1777">
              <SourceParameter reference="Parameter_671"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1778">
              <SourceParameter reference="Parameter_659"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1779">
              <SourceParameter reference="Parameter_667"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1780">
              <SourceParameter reference="Parameter_658"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1781">
              <SourceParameter reference="Parameter_666"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1782">
              <SourceParameter reference="Parameter_670"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1783">
              <SourceParameter reference="Parameter_668"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1784">
              <SourceParameter reference="Parameter_661"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1785">
              <SourceParameter reference="Parameter_665"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1786">
              <SourceParameter reference="Parameter_660"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1787">
              <SourceParameter reference="Parameter_663"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1788">
              <SourceParameter reference="Parameter_664"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1789">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1790">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1791">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1792">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1793">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1794">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1795">
              <SourceParameter reference="Metabolite_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1796">
              <SourceParameter reference="Parameter_657"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_60" name="ATP_MAINTENANCE" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_60">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-21T14:43:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_52" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_50" stoichiometry="1"/>
          <Product metabolite="Metabolite_56" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_672" name="Vmax" value="1.30166"/>
          <Constant key="Parameter_673" name="Keq" value="3.63369"/>
        </ListOfConstants>
        <KineticLaw function="Function_114" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1685">
              <SourceParameter reference="Metabolite_50"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1750">
              <SourceParameter reference="Metabolite_52"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1752">
              <SourceParameter reference="Parameter_673"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1760">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1759">
              <SourceParameter reference="Parameter_672"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_61" name="XCH_GLC" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_61">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-23T16:07:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_70" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_74" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_674" name="Vmax" value="100"/>
          <Constant key="Parameter_675" name="Km" value="10"/>
        </ListOfConstants>
        <KineticLaw function="Function_115" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1745">
              <SourceParameter reference="Metabolite_74"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1762">
              <SourceParameter reference="Metabolite_70"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1754">
              <SourceParameter reference="Parameter_675"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1763">
              <SourceParameter reference="Parameter_674"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_62" name="PIT" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_62">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-23T17:08:39Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_75" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_73" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_56" stoichiometry="1"/>
          <Product metabolite="Metabolite_64" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_73" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_64" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_676" name="Vmax" value="7.146"/>
          <Constant key="Parameter_677" name="KmPp" value="0.025"/>
          <Constant key="Parameter_678" name="Kr" value="0.1"/>
          <Constant key="Parameter_679" name="KmP" value="12.18"/>
        </ListOfConstants>
        <KineticLaw function="Function_116" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1753">
              <SourceParameter reference="Metabolite_64"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1109">
              <SourceParameter reference="Metabolite_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1751">
              <SourceParameter reference="Parameter_679"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1826">
              <SourceParameter reference="Parameter_677"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1827">
              <SourceParameter reference="Parameter_678"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1828">
              <SourceParameter reference="Metabolite_56"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1829">
              <SourceParameter reference="Metabolite_75"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1830">
              <SourceParameter reference="Parameter_676"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_63" name="XCH_P" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_63">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-31T12:45:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_75" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_680" name="Vmax" value="100"/>
          <Constant key="Parameter_681" name="Km" value="10"/>
        </ListOfConstants>
        <KineticLaw function="Function_117" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1748">
              <SourceParameter reference="Parameter_681"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1686">
              <SourceParameter reference="Metabolite_75"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1747">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1707">
              <SourceParameter reference="Parameter_680"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_64" name="XCH_ACE1" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_64">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-03T00:04:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_69" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_76" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_682" name="Vmax" value="100"/>
          <Constant key="Parameter_683" name="Km" value="10"/>
        </ListOfConstants>
        <KineticLaw function="Function_118" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1843">
              <SourceParameter reference="Metabolite_76"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1844">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1845">
              <SourceParameter reference="Parameter_683"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1846">
              <SourceParameter reference="Parameter_682"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_65" name="_ACE_OUT" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_65">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-03T00:06:14Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_72" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_684" name="k1" value="5.556e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[extracellular]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="Parameter_684"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_72"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_66" name="XCH_ACE2" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_66">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-03T00:13:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_76" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_72" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_685" name="Vmax" value="100"/>
          <Constant key="Parameter_686" name="Km" value="10"/>
        </ListOfConstants>
        <KineticLaw function="Function_119" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1853">
              <SourceParameter reference="Metabolite_76"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1854">
              <SourceParameter reference="Metabolite_72"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1855">
              <SourceParameter reference="Parameter_686"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1856">
              <SourceParameter reference="Parameter_685"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_67" name="GL6P_HYDROLYSIS" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_67">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-01-22T11:03:40Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_687" name="KGl6Phydrol" value="0.000167"/>
          <Constant key="Parameter_688" name="KeqGl6Phydrol" value="42.8"/>
        </ListOfConstants>
        <KineticLaw function="Function_120" unitType="Default" scalingCompartment="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1861">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1862">
              <SourceParameter reference="Parameter_687"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1863">
              <SourceParameter reference="Parameter_688"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1864">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_0">
      <ModelParameterSet key="ModelParameterSet_0" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm]" value="1" type="Compartment" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[extracellular]" value="100" type="Compartment" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_periplasm]" value="0.25" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ACCOA]" value="9.3188415892273316e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ACO]" value="1.936106319512773e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ACP]" value="8.6664190225577943e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[AKG]" value="3.600459246417821e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[BPG]" value="3.93911634355828e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[CIT]" value="5.3916511483702837e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[DAP]" value="2.6322420007975843e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[E4P]" value="7.9070667332268687e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[F6P]" value="1.5763945812272231e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[FDP]" value="1.6970884060191143e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[FUM]" value="1.2834083981229053e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[G6P]" value="5.1858430762902304e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[GAP]" value="7.0569318068504535e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[GL6P]" value="1.9642127656464876e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[GLX]" value="5.3057531047160074e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ICIT]" value="6.370366604598068e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[KDPG]" value="5.2282834401295e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MAL]" value="6.2157713955168924e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[NAD]" value="8.5005145629002013e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[NADH]" value="9.5424643449249694e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[NADP]" value="1.0107392859688657e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[NADPH]" value="5.3695088710780928e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[OAA]" value="7.6986800408179196e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[PEP]" value="6.0043052526783051e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[PGA2]" value="2.2781584136454282e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[PGA3]" value="4.193061030651404e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[PGN]" value="7.9251240638457332e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[PYR]" value="1.4265932432297129e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[Q]" value="1.9639247917940182e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[QH2]" value="4.0582159661071394e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[R5P]" value="6.4341568135866352e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[RU5P]" value="2.0585278287567575e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[S7P]" value="8.5505451311487959e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[SUC]" value="1.3011153977329191e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[SUCCOA]" value="2.474363826964566e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[X5P]" value="3.0473115692780598e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ei]" value="2.0114735099464614e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[eiP]" value="3.8428260222940047e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[eiia]" value="8.5525574231136512e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[eiiaP]" value="2.8940514165016504e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[eiicb]" value="28419064718452324" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[eiicbP]" value="2.0633142634442397e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[hpr]" value="1.1515043464737315e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[hprP]" value="3.1621127848639089e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[icd]" value="3.2684796456898566e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[icdP]" value="3.0988284301613298e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[tal]" value="1.6747235244311811e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[talC3]" value="3.445812101458518e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[tkt]" value="8.3290921482953677e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[tktC2]" value="3.3825893122639122e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ADP]" value="3.6031353600518318e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[AMP]" value="1.1216394522154634e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ATP]" value="1.5490159261778145e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[CAMP]" value="5.5592271447547439e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[COA]" value="3.0110703800000001e+20" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[HCO3]" value="8.4309970639999992e+20" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[P]" value="5.8799868365210732e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MG]" value="6.0221407600000002e+20" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MgADP]" value="1.5819113759222343e+20" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MgATP]" value="1.4279758389505163e+21" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MgFDP]" value="2.4920534596462764e+19" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ASP]" value="7.0459046891999999e+20" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[CYS]" value="5.1188196460000002e+19" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[MN]" value="1.8066422279999999e+20" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[Hin]" value="19043681190723424" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[H2O]" value="6.0221407600000002e+20" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[O2]" value="1.2646495596e+20" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[FAD]" value="1.5291076362172393e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[FADH2]" value="4.4930331242454601e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_cytoplasm],Vector=Metabolites[ACE]" value="1.1243807508062381e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[extracellular],Vector=Metabolites[GLCx]" value="3.814044398093117e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[extracellular],Vector=Metabolites[Px]" value="6.0221407599999999e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[extracellular],Vector=Metabolites[ACEx]" value="1.1242558234991299e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_periplasm],Vector=Metabolites[Hout]" value="8091472322925119" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_periplasm],Vector=Metabolites[GLCp]" value="6.0723800582327936e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_periplasm],Vector=Metabolites[Pp]" value="1.5054490881749578e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Compartments[cell_periplasm],Vector=Metabolites[ACEp]" value="28107957178817176" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[FEED]" value="0.23000000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KdADPMg]" value="1.2777099999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KdATPMg]" value="0.084763400000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KdFDPMg]" value="5.8099999999999996" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KmICIT_ACN]" value="9.3135200000000005" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KmCIT_ACN]" value="0.062888200000000005" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KmACO_ACN]" value="0.02001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KeqNDH]" value="27.619299999999999" type="ModelValue" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGI]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGI],ParameterGroup=Parameters,Parameter=Keq" value="0.35999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGI],ParameterGroup=Parameters,Parameter=KmF6P" value="0.14699999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGI],ParameterGroup=Parameters,Parameter=KmG6P" value="0.28000000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGI],ParameterGroup=Parameters,Parameter=KmPEP" value="1.9990000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGI],ParameterGroup=Parameters,Parameter=Vmax" value="2.32456" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGI],ParameterGroup=Parameters,Parameter=KmPGN" value="0.51595800000000003" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KefrADP" value="0.073526400000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KefrPEP" value="19.98" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KeftADP" value="9.0090000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KeftPEP" value="0.26025999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Keq" value="1998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KirADP" value="54.945" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KirATP" value="2.4975000000000001e-05" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KirF6P" value="1.84615" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KirFDP" value="0.045954000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KitADP" value="80.079999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KitATP" value="0.014014" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KitF6P" value="0.0085685599999999994" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KitFDP" value="50.5505" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KmrADP" value="0.69000899999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KmrATPMg" value="8.1218700000000002e-05" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KmrF6P" value="2.0520500000000001e-05" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KmrFDP" value="10.01" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KmtADP" value="2.0019999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KmtATPMg" value="3.34334" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KmtF6P" value="32.966999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=KmtFDP" value="9.9900000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=L0" value="14.085100000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Vmax" value="0.185253" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Wr" value="0.023704099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=Wt" value="0.146735" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PFK],ParameterGroup=Parameters,Parameter=n" value="4" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBA]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBA],ParameterGroup=Parameters,Parameter=Keq" value="0.18981000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBA],ParameterGroup=Parameters,Parameter=KmDAP" value="0.13000999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBA],ParameterGroup=Parameters,Parameter=KmFDP" value="0.12012" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBA],ParameterGroup=Parameters,Parameter=KmGAP" value="0.13000999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBA],ParameterGroup=Parameters,Parameter=KmPEP" value="0.5" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBA],ParameterGroup=Parameters,Parameter=Vmax" value="21.697800000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[TPI]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[TPI],ParameterGroup=Parameters,Parameter=Keq" value="0.27020300000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[TPI],ParameterGroup=Parameters,Parameter=KmDAP" value="0.01" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[TPI],ParameterGroup=Parameters,Parameter=KmGAP" value="1.8930100000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[TPI],ParameterGroup=Parameters,Parameter=Vmax" value="24.1843" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GDH]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GDH],ParameterGroup=Parameters,Parameter=Keq" value="20" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GDH],ParameterGroup=Parameters,Parameter=KmBPG" value="0.20000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GDH],ParameterGroup=Parameters,Parameter=KmGAP" value="2.4726499999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GDH],ParameterGroup=Parameters,Parameter=KmNAD" value="0.0110454" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GDH],ParameterGroup=Parameters,Parameter=KmNADH" value="3.6979700000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GDH],ParameterGroup=Parameters,Parameter=KmP" value="0.017000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GDH],ParameterGroup=Parameters,Parameter=Vmax" value="8.6657299999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGK]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGK],ParameterGroup=Parameters,Parameter=Keq" value="99.992500000000007" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGK],ParameterGroup=Parameters,Parameter=KmADPMg" value="0.085416000000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGK],ParameterGroup=Parameters,Parameter=KmATPMg" value="3.4773700000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGK],ParameterGroup=Parameters,Parameter=KmBPG" value="0.0113296" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGK],ParameterGroup=Parameters,Parameter=KmPGA3" value="2.45722" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGK],ParameterGroup=Parameters,Parameter=Vmax" value="16.108899999999998" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GPM]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GPM],ParameterGroup=Parameters,Parameter=Keq" value="0.56581800000000004" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GPM],ParameterGroup=Parameters,Parameter=KmPGA2" value="1.9153" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GPM],ParameterGroup=Parameters,Parameter=KmPGA3" value="0.115" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GPM],ParameterGroup=Parameters,Parameter=Vmax" value="10.993399999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ENO]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ENO],ParameterGroup=Parameters,Parameter=Keq" value="3" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ENO],ParameterGroup=Parameters,Parameter=KmPEP" value="0.10000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ENO],ParameterGroup=Parameters,Parameter=KmPGA2" value="0.10000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ENO],ParameterGroup=Parameters,Parameter=Vmax" value="11.7189" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KefrFDP" value="0.44914900000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KefrG6P" value="0.158746" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KefrGL6P" value="0.150482" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KefrR5P" value="9.3325399999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KefrRU5P" value="1.5359100000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KefrS7P" value="0.078595499999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KefrX5P" value="0.67737400000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KeftATP" value="3.6911700000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KeftSUCCOA" value="8.2640600000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KirADP" value="0.51758499999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KirATP" value="96.033299999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KirPEP" value="0.18105599999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KirPYR" value="15.1403" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KirPyrATP" value="230.78100000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KitADP" value="0.224911" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KitATP" value="0.039564000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KitPEP" value="0.46567199999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KitPYR" value="0.24990000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KitPyrATP" value="11.3691" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KmrADPMg" value="0.32614399999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KmrPEP" value="5.5636800000000005e-07" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KmtADPMg" value="0.054677999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=KmtPEP" value="0.11475" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=L0" value="50.4818" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=Vmax" value="0.74716000000000005" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PYK],ParameterGroup=Parameters,Parameter=n" value="4" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ZWF]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ZWF],ParameterGroup=Parameters,Parameter=KdG6P" value="0.192" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ZWF],ParameterGroup=Parameters,Parameter=KdGL6P" value="0.02" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ZWF],ParameterGroup=Parameters,Parameter=Keq" value="60000000000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ZWF],ParameterGroup=Parameters,Parameter=KmG6P" value="0.11852500000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ZWF],ParameterGroup=Parameters,Parameter=KmGL6P" value="0.328629" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ZWF],ParameterGroup=Parameters,Parameter=KmNADP" value="0.027400000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ZWF],ParameterGroup=Parameters,Parameter=KmNADPH" value="0.016799999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ZWF],ParameterGroup=Parameters,Parameter=Vmax" value="0.26579999999999998" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGL]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGL],ParameterGroup=Parameters,Parameter=Keq" value="42.757199999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGL],ParameterGroup=Parameters,Parameter=KiG6P" value="2.0001000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGL],ParameterGroup=Parameters,Parameter=KmGL6P" value="0.022977000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGL],ParameterGroup=Parameters,Parameter=KmPGN" value="9.9900000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PGL],ParameterGroup=Parameters,Parameter=Vmax" value="11.5967" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KdHCO3" value="58.895099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KdHCO3NADPH" value="9.7256999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KdNADP" value="0.116989" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KdNADPH" value="0.00340034" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KdRu5P" value="0.044004399999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KefATP" value="0.065006499999999995" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KefFbP" value="0.0129987" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KefNADPATP" value="0.139986" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KefNADPFbP" value="0.0051994800000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=Keq" value="49.962000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KmHCO3" value="6.41899" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KmNADP" value="0.049000000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KmNADPH" value="68.382800000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KmPGN" value="0.092999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=KmRU5P" value="45.197699999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GND],ParameterGroup=Parameters,Parameter=Vmax" value="4.0810500000000003" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPE]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPE],ParameterGroup=Parameters,Parameter=Keq" value="1.5015000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPE],ParameterGroup=Parameters,Parameter=KmRU5P" value="0.87252200000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPE],ParameterGroup=Parameters,Parameter=KmX5P" value="0.89360700000000004" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPE],ParameterGroup=Parameters,Parameter=Vmax" value="6.0010300000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPI]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPI],ParameterGroup=Parameters,Parameter=Keq" value="0.33009300000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPI],ParameterGroup=Parameters,Parameter=KmE4P" value="0.67066999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPI],ParameterGroup=Parameters,Parameter=KmR5P" value="3.0971500000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPI],ParameterGroup=Parameters,Parameter=KmRU5P" value="4.4026300000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[RPI],ParameterGroup=Parameters,Parameter=Vmax" value="8" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[X5P_GAP_TKT]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[X5P_GAP_TKT],ParameterGroup=Parameters,Parameter=Keq" value="1.0009999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[X5P_GAP_TKT],ParameterGroup=Parameters,Parameter=kcat" value="40" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[F6P_E4P_TKT]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[F6P_E4P_TKT],ParameterGroup=Parameters,Parameter=Keq" value="0.50049999999999994" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[F6P_E4P_TKT],ParameterGroup=Parameters,Parameter=kcat" value="40.0002" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[S7P_R5P_TKT]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[S7P_R5P_TKT],ParameterGroup=Parameters,Parameter=Keq" value="0.33033000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[S7P_R5P_TKT],ParameterGroup=Parameters,Parameter=kcat" value="199.97900000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[F6P_GAP_TAL]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[F6P_GAP_TAL],ParameterGroup=Parameters,Parameter=Keq" value="0.11011" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[F6P_GAP_TAL],ParameterGroup=Parameters,Parameter=kcat" value="119.992" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[S7P_E4P_TAL]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[S7P_E4P_TAL],ParameterGroup=Parameters,Parameter=Keq" value="26.6266" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[S7P_E4P_TAL],ParameterGroup=Parameters,Parameter=kcat" value="99.999099999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirAMP" value="0.0012212200000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirAMPFDP" value="0.25625599999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirF6P" value="1.1211199999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirF6PMg" value="0.38461499999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirFDP" value="1.35327" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirFDPMg" value="0.75924000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirFDPMgMg" value="0.35635600000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirP" value="3.16316" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirPF6P" value="6.6053800000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirPF6PMg" value="48.448399999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KirPMg" value="0.85599999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitAMP" value="0.00025500000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitAMPFDP" value="690" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitF6P" value="0.30399999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitF6PMg" value="315" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitFDP" value="0.043101" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitFDPMg" value="0.0064200000000000004" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitFDPMgMg" value="100" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitP" value="0.64200000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitPF6P" value="0.0068900000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitPF6PMg" value="16.5" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KitPMg" value="539" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KmrFDP" value="0.063614100000000007" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KmrMg" value="0.039038999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KmtFDP" value="1.0000000000000001e-05" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KmtMg" value="55.055" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=L0" value="0.00081499999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=Vmax" value="0.215583" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=n" value="4" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FBP],ParameterGroup=Parameters,Parameter=KdFDPMg" value="5.8099999999999996" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KdFDPMg],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KdrOAA" value="4.3540400000000004" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KdrPEP" value="655.59100000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KdtOAA" value="17.912700000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KdtPEP" value="0.012199099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KefrACCOA" value="0.14002899999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KefrASP" value="0.389183" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KefrCIT" value="34.427700000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KefrCYS" value="0.00044884299999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KefrFDP" value="9.9912600000000005" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KefrFDPACCOA" value="0.015625099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KefrFUM" value="2.7475000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KefrMAL" value="0.23002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KefrSUC" value="22.9834" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KeftACCOA" value="1.2759799999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KeftASP" value="27.472899999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KeftCIT" value="0.52194499999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KeftCYS" value="0.97737399999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KeftFDP" value="13.2064" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KeftFDPACCOA" value="47.756300000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KeftFUM" value="9.7611899999999991" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KeftMAL" value="0.73728300000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KeftSUC" value="107.18000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=Keq" value="149.70500000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KmrHCO3" value="0.0021981100000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KmrOAA" value="13.046900000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KmrP" value="0.66335599999999995" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KmrPEP" value="3.2008899999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KmtHCO3" value="0.00220031" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KmtOAA" value="6.8099499999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KmtP" value="0.28513100000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=KmtPEP" value="5.1249700000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=L0" value="6.3720899999999997e-06" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=Vmax" value="21.439" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPC],ParameterGroup=Parameters,Parameter=n" value="4.00319" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PCK]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PCK],ParameterGroup=Parameters,Parameter=Keq" value="1.8816600000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PCK],ParameterGroup=Parameters,Parameter=KmADP" value="0.049970000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PCK],ParameterGroup=Parameters,Parameter=KmATP" value="0.060041799999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PCK],ParameterGroup=Parameters,Parameter=KmHCO3" value="2.6318999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PCK],ParameterGroup=Parameters,Parameter=KmOAA" value="0.66966000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PCK],ParameterGroup=Parameters,Parameter=KmPEP" value="0.069983299999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PCK],ParameterGroup=Parameters,Parameter=Vmax" value="8.0877700000000008" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KdAMP" value="1480" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KdATPMgPPS" value="0.054899999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KdMg" value="36.899999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KdP" value="346" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KdPEP" value="95.700000000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KdPYR" value="2740" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KefADP" value="0.028299999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KefAKG" value="0.27400000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KefATP" value="0.00062799999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KefOAA" value="0.79600000000000004" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=Keq" value="200000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KmAMP" value="0.00038400000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KmATPMg" value="0.054899999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KmP" value="84.400000000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KmPEP" value="20.699999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KmPYR" value="0.22900000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=Vmax" value="0.016377200000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=W" value="10" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=alpha" value="38900" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KdADPMg" value="1.2777099999999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KdADPMg],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PPS],ParameterGroup=Parameters,Parameter=KdATPMg" value="0.084763400000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KdATPMg],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KefrACCOA" value="1.8333600000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KefrASP" value="0.36214200000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KefrATP" value="88.975200000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KefrCOA" value="0.26800000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KeftACCOA" value="0.19700000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KeftASP" value="0.58299999999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KeftATP" value="0.26000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KeftCOA" value="0.26800000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KirNAD" value="0.63645700000000005" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KitNAD" value="0.990398" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KmrMAL" value="0.21291299999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KmrMg" value="0.19187100000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KmrMn" value="0.27256799999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KmrNAD" value="1.36636" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KmtMAL" value="0.092999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KmtMg" value="2.3768099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KmtMn" value="0.41019800000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=KmtNAD" value="0.108" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=L0" value="19.899999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=Vmax" value="6.64269" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MAE],ParameterGroup=Parameters,Parameter=n" value="4" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PDH]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PDH],ParameterGroup=Parameters,Parameter=Keq" value="3138.1599999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PDH],ParameterGroup=Parameters,Parameter=KmACCOA" value="10.173999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PDH],ParameterGroup=Parameters,Parameter=KmCOA" value="0.0050046099999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PDH],ParameterGroup=Parameters,Parameter=KmHCO3" value="0.0054511200000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PDH],ParameterGroup=Parameters,Parameter=KmNAD" value="0.0099900000000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PDH],ParameterGroup=Parameters,Parameter=KmNADH" value="6.6351199999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PDH],ParameterGroup=Parameters,Parameter=KmPYR" value="2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PDH],ParameterGroup=Parameters,Parameter=Vmax" value="961.70600000000002" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=KdACCOA0" value="0.69930899999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=KdcsCIT" value="7.3812800000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=KdcsCOA" value="0.00174282" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=KdcsOAA" value="0.15460099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=Keq" value="83067.100000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=Ki1AKG" value="0.0150083" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=Ki1NADH" value="0.00033031299999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=Ki2AKG" value="0.25625199999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=Ki2NADH" value="0.0504" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=KiATP" value="0.57993899999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=KmACCOA0" value="0.119974" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=KmOAA0" value="0.0012345800000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=KmcsCIT" value="1.1571499999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=KmcsCOA" value="9.6343999999999998e-05" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GLT],ParameterGroup=Parameters,Parameter=Vmax" value="57.058399999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_1],ParameterGroup=Parameters,Parameter=Keq" value="0.38450299999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_1],ParameterGroup=Parameters,Parameter=Vmax" value="9.7241300000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_1],ParameterGroup=Parameters,Parameter=KmACO_ACN" value="0.02001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KmACO_ACN],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_1],ParameterGroup=Parameters,Parameter=KmCIT_ACN" value="0.062888200000000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KmCIT_ACN],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_1],ParameterGroup=Parameters,Parameter=KmICIT_ACN" value="9.3135200000000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KmICIT_ACN],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_2],ParameterGroup=Parameters,Parameter=Keq" value="3.4918300000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_2],ParameterGroup=Parameters,Parameter=Vmax" value="9.86571" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_2],ParameterGroup=Parameters,Parameter=KmACO_ACN" value="0.02001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KmACO_ACN],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_2],ParameterGroup=Parameters,Parameter=KmCIT_ACN" value="0.062888200000000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KmCIT_ACN],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACN_2],ParameterGroup=Parameters,Parameter=KmICIT_ACN" value="9.3135200000000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KmICIT_ACN],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ICD]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ICD],ParameterGroup=Parameters,Parameter=Keq" value="28.1631" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ICD],ParameterGroup=Parameters,Parameter=KmAKG" value="0.038038000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ICD],ParameterGroup=Parameters,Parameter=KmICIT" value="0.010989000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ICD],ParameterGroup=Parameters,Parameter=KmNADP" value="0.0059940000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ICD],ParameterGroup=Parameters,Parameter=KmNADPH" value="0.00068333300000000005" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ICD],ParameterGroup=Parameters,Parameter=kcat" value="2461.9699999999998" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[LPD]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[LPD],ParameterGroup=Parameters,Parameter=KdAKG" value="14.938599999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[LPD],ParameterGroup=Parameters,Parameter=KmAKG" value="0.020001999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[LPD],ParameterGroup=Parameters,Parameter=KmCOA" value="0.076007599999999995" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[LPD],ParameterGroup=Parameters,Parameter=KmNAD" value="0.098009799999999994" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[LPD],ParameterGroup=Parameters,Parameter=Vmax" value="0.068441299999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[LPD],ParameterGroup=Parameters,Parameter=alpha" value="16.430399999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SK]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SK],ParameterGroup=Parameters,Parameter=Keq" value="1.15994" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SK],ParameterGroup=Parameters,Parameter=KmADP" value="0.0086847499999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SK],ParameterGroup=Parameters,Parameter=KmATP" value="0.102321" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SK],ParameterGroup=Parameters,Parameter=KmCOA" value="0.255019" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SK],ParameterGroup=Parameters,Parameter=KmP" value="0.91470899999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SK],ParameterGroup=Parameters,Parameter=KmSUC" value="0.80074400000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SK],ParameterGroup=Parameters,Parameter=KmSUCCOA" value="0.0085000000000000006" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SK],ParameterGroup=Parameters,Parameter=Vmax" value="76.816299999999998" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SDH]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SDH],ParameterGroup=Parameters,Parameter=KefFUM" value="0.067047999999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SDH],ParameterGroup=Parameters,Parameter=KefSUC" value="0.0322425" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SDH],ParameterGroup=Parameters,Parameter=Keq" value="2250" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SDH],ParameterGroup=Parameters,Parameter=KmFUM" value="1.36019" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SDH],ParameterGroup=Parameters,Parameter=KmQ" value="0.0016071799999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SDH],ParameterGroup=Parameters,Parameter=KmQH2" value="0.0061166299999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SDH],ParameterGroup=Parameters,Parameter=KmSUC" value="0.80572699999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SDH],ParameterGroup=Parameters,Parameter=Vmax" value="1.5618399999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FUMA]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FUMA],ParameterGroup=Parameters,Parameter=Keq" value="4.9996600000000004" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FUMA],ParameterGroup=Parameters,Parameter=KmFUM" value="0.59999999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FUMA],ParameterGroup=Parameters,Parameter=KmMAL" value="0.69999999999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[FUMA],ParameterGroup=Parameters,Parameter=Vmax" value="53.3414" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MQO]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MQO],ParameterGroup=Parameters,Parameter=Keq" value="9" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MQO],ParameterGroup=Parameters,Parameter=KmMAL" value="0.435" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MQO],ParameterGroup=Parameters,Parameter=KmOAA" value="75.803600000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MQO],ParameterGroup=Parameters,Parameter=KmQ" value="0.041399999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MQO],ParameterGroup=Parameters,Parameter=KmQH2" value="8.77942" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MQO],ParameterGroup=Parameters,Parameter=Vmax" value="4.6228300000000004" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH],ParameterGroup=Parameters,Parameter=Keq" value="100000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH],ParameterGroup=Parameters,Parameter=KiNAD" value="0.023312200000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH],ParameterGroup=Parameters,Parameter=KiNADH" value="0.00019698099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH],ParameterGroup=Parameters,Parameter=KiOAA" value="2.4644599999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH],ParameterGroup=Parameters,Parameter=KmMAL" value="0.85999999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH],ParameterGroup=Parameters,Parameter=KmNAD" value="0.64000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH],ParameterGroup=Parameters,Parameter=KmNADH" value="0.0030000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH],ParameterGroup=Parameters,Parameter=KmOAA" value="0.001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[MDH],ParameterGroup=Parameters,Parameter=Vmax" value="6.1149199999999997" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=KdICITsuc" value="0.0048907400000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=KdPEP" value="1.05105" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=KdPEPglx" value="0.035855499999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=KdPEPicit" value="0.16426299999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=KdPGA3" value="0.80000000000000004" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=KdSUC" value="0.53052999999999995" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=Keq" value="8.8087999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=KmGLX" value="0.13013" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=KmICIT" value="0.063062999999999994" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=KmSUC" value="0.58940999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEA],ParameterGroup=Parameters,Parameter=Vmax" value="1.5259499999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEB]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEB],ParameterGroup=Parameters,Parameter=Keq" value="230000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEB],ParameterGroup=Parameters,Parameter=KmACCOA" value="0.0089999999999999993" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEB],ParameterGroup=Parameters,Parameter=KmCOA" value="10.565200000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEB],ParameterGroup=Parameters,Parameter=KmGLX" value="0.021000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEB],ParameterGroup=Parameters,Parameter=KmMAL" value="15.0572" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEB],ParameterGroup=Parameters,Parameter=Vmax" value="0.352769" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEK_1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEK_1],ParameterGroup=Parameters,Parameter=Keq" value="888" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEK_1],ParameterGroup=Parameters,Parameter=k" value="1.25457" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEK_2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEK_2],ParameterGroup=Parameters,Parameter=Keq" value="400" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACEK_2],ParameterGroup=Parameters,Parameter=k" value="0.0332" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDD]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDD],ParameterGroup=Parameters,Parameter=Keq" value="1000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDD],ParameterGroup=Parameters,Parameter=KmKDPG" value="0.31831599999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDD],ParameterGroup=Parameters,Parameter=KmPGN" value="0.59999999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDD],ParameterGroup=Parameters,Parameter=Vmax" value="0.111359" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDA]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDA],ParameterGroup=Parameters,Parameter=Keq" value="0.5" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDA],ParameterGroup=Parameters,Parameter=KmGAP" value="86.677999999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDA],ParameterGroup=Parameters,Parameter=KmKDPG" value="0.059999999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDA],ParameterGroup=Parameters,Parameter=KmPYR" value="10" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[EDA],ParameterGroup=Parameters,Parameter=Vmax" value="0.077524099999999999" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[NDHI]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[NDHI],ParameterGroup=Parameters,Parameter=Vmax" value="23.073499999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[NDHI],ParameterGroup=Parameters,Parameter=KeqNDH" value="27.619299999999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KeqNDH],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PNT]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PNT],ParameterGroup=Parameters,Parameter=Keq" value="0.181891" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PNT],ParameterGroup=Parameters,Parameter=k" value="2.4944099999999998" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ADK]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ADK],ParameterGroup=Parameters,Parameter=Keq" value="0.962758" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ADK],ParameterGroup=Parameters,Parameter=k" value="0.242256" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ATP_SYN]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ATP_SYN],ParameterGroup=Parameters,Parameter=Vmax" value="108.733" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ATP_SYN],ParameterGroup=Parameters,Parameter=Keq" value="49.831499999999998" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[CYA]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[CYA],ParameterGroup=Parameters,Parameter=Keq" value="2591.1900000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[CYA],ParameterGroup=Parameters,Parameter=k" value="0.0041441799999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[CYA],ParameterGroup=Parameters,Parameter=KaeiiaP" value="0.180981" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[DOS]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[DOS],ParameterGroup=Parameters,Parameter=Keq" value="674.24199999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[DOS],ParameterGroup=Parameters,Parameter=k" value="0.0082799999999999992" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACK]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACK],ParameterGroup=Parameters,Parameter=Keq" value="174" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACK],ParameterGroup=Parameters,Parameter=KmACE" value="7" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACK],ParameterGroup=Parameters,Parameter=KmACP" value="0.16" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACK],ParameterGroup=Parameters,Parameter=KmADP" value="0.5" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACK],ParameterGroup=Parameters,Parameter=KmATP" value="0.070000000000000007" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACK],ParameterGroup=Parameters,Parameter=Vmax" value="7.2300000000000004" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACS]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACS],ParameterGroup=Parameters,Parameter=KmACE" value="0.070000000000000007" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACS],ParameterGroup=Parameters,Parameter=KmATP" value="0.10000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACS],ParameterGroup=Parameters,Parameter=KmCOA" value="0.01" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ACS],ParameterGroup=Parameters,Parameter=Vmax" value="7.2999999999999998" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTA]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTA],ParameterGroup=Parameters,Parameter=Keq" value="0.0053952000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTA],ParameterGroup=Parameters,Parameter=KiACCOA" value="0.20000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTA],ParameterGroup=Parameters,Parameter=KiACP" value="0.20000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTA],ParameterGroup=Parameters,Parameter=KiCOA" value="0.029000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTA],ParameterGroup=Parameters,Parameter=KiP" value="13.539999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTA],ParameterGroup=Parameters,Parameter=KmACP" value="0.69999999999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTA],ParameterGroup=Parameters,Parameter=KmP" value="6.0999999999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTA],ParameterGroup=Parameters,Parameter=Vmax" value="2.7000000000000002" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_0]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_0],ParameterGroup=Parameters,Parameter=KmPEP" value="0.59999999999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_0],ParameterGroup=Parameters,Parameter=KmPYR" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_0],ParameterGroup=Parameters,Parameter=kF" value="12000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_0],ParameterGroup=Parameters,Parameter=kR" value="8000" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_1],ParameterGroup=Parameters,Parameter=k1" value="200000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_1],ParameterGroup=Parameters,Parameter=k2" value="8000" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_2],ParameterGroup=Parameters,Parameter=k1" value="61000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_2],ParameterGroup=Parameters,Parameter=k2" value="47000" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_3],ParameterGroup=Parameters,Parameter=k1" value="11000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_3],ParameterGroup=Parameters,Parameter=k2" value="4000" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_4]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_4],ParameterGroup=Parameters,Parameter=KmG6P" value="2125.9099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_4],ParameterGroup=Parameters,Parameter=KmGLC" value="0.02" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_4],ParameterGroup=Parameters,Parameter=kF" value="4000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PTS_4],ParameterGroup=Parameters,Parameter=kR" value="1.0000000000000001e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[_GLC_FEED]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[_GLC_FEED],ParameterGroup=Parameters,Parameter=FEED" value="0.23000000000000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[FEED],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[CYTBO]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[CYTBO],ParameterGroup=Parameters,Parameter=Vmax" value="8.5404499999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[CYTBO],ParameterGroup=Parameters,Parameter=Keq" value="12.067" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SQR]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SQR],ParameterGroup=Parameters,Parameter=Keq" value="0.94033" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[SQR],ParameterGroup=Parameters,Parameter=Vmax" value="3.4161700000000002" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[NDHII]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[NDHII],ParameterGroup=Parameters,Parameter=Vmax" value="30.8306" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[NDHII],ParameterGroup=Parameters,Parameter=KeqNDH" value="27.619299999999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Values[KeqNDH],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=Vmax" value="9.7413699999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmG6P" value="1.2091099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmE4P" value="1.6329800000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmPGA3" value="0.076461899999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmOAA" value="0.024835099999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmAKG" value="5.1198899999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmPYR" value="0.0046390399999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmR5P" value="0.021233999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmPEP" value="0.45773399999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmGAP" value="0.024854000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmF6P" value="0.366423" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmNADPH" value="3.5977399999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmACCOA" value="0.049440400000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmNAD" value="2.82239" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GROWTH],ParameterGroup=Parameters,Parameter=KmATP" value="0.046826600000000003" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ATP_MAINTENANCE]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ATP_MAINTENANCE],ParameterGroup=Parameters,Parameter=Vmax" value="1.30166" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[ATP_MAINTENANCE],ParameterGroup=Parameters,Parameter=Keq" value="3.6336900000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_GLC]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_GLC],ParameterGroup=Parameters,Parameter=Vmax" value="100" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_GLC],ParameterGroup=Parameters,Parameter=Km" value="10" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PIT]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PIT],ParameterGroup=Parameters,Parameter=Vmax" value="7.1459999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PIT],ParameterGroup=Parameters,Parameter=KmPp" value="0.025000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PIT],ParameterGroup=Parameters,Parameter=Kr" value="0.10000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[PIT],ParameterGroup=Parameters,Parameter=KmP" value="12.18" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_P]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_P],ParameterGroup=Parameters,Parameter=Vmax" value="100" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_P],ParameterGroup=Parameters,Parameter=Km" value="10" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_ACE1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_ACE1],ParameterGroup=Parameters,Parameter=Vmax" value="100" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_ACE1],ParameterGroup=Parameters,Parameter=Km" value="10" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[_ACE_OUT]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[_ACE_OUT],ParameterGroup=Parameters,Parameter=k1" value="5.5560000000000003e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_ACE2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_ACE2],ParameterGroup=Parameters,Parameter=Vmax" value="100" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[XCH_ACE2],ParameterGroup=Parameters,Parameter=Km" value="10" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GL6P_HYDROLYSIS]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GL6P_HYDROLYSIS],ParameterGroup=Parameters,Parameter=KGl6Phydrol" value="0.00016699999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Millard2016 - E. coli central carbon and energy metabolism,Vector=Reactions[GL6P_HYDROLYSIS],ParameterGroup=Parameters,Parameter=KeqGl6Phydrol" value="42.799999999999997" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_0"/>
      <StateTemplateVariable objectReference="Metabolite_56"/>
      <StateTemplateVariable objectReference="Metabolite_73"/>
      <StateTemplateVariable objectReference="Metabolite_50"/>
      <StateTemplateVariable objectReference="Metabolite_28"/>
      <StateTemplateVariable objectReference="Metabolite_18"/>
      <StateTemplateVariable objectReference="Metabolite_27"/>
      <StateTemplateVariable objectReference="Metabolite_12"/>
      <StateTemplateVariable objectReference="Metabolite_20"/>
      <StateTemplateVariable objectReference="Metabolite_8"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_23"/>
      <StateTemplateVariable objectReference="Metabolite_26"/>
      <StateTemplateVariable objectReference="Metabolite_17"/>
      <StateTemplateVariable objectReference="Metabolite_33"/>
      <StateTemplateVariable objectReference="Metabolite_22"/>
      <StateTemplateVariable objectReference="Metabolite_69"/>
      <StateTemplateVariable objectReference="Metabolite_48"/>
      <StateTemplateVariable objectReference="Metabolite_31"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_51"/>
      <StateTemplateVariable objectReference="Metabolite_15"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_38"/>
      <StateTemplateVariable objectReference="Metabolite_70"/>
      <StateTemplateVariable objectReference="Metabolite_72"/>
      <StateTemplateVariable objectReference="Metabolite_75"/>
      <StateTemplateVariable objectReference="Metabolite_25"/>
      <StateTemplateVariable objectReference="Metabolite_36"/>
      <StateTemplateVariable objectReference="Metabolite_44"/>
      <StateTemplateVariable objectReference="Metabolite_32"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="Metabolite_34"/>
      <StateTemplateVariable objectReference="Metabolite_67"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_24"/>
      <StateTemplateVariable objectReference="Metabolite_16"/>
      <StateTemplateVariable objectReference="Metabolite_76"/>
      <StateTemplateVariable objectReference="Metabolite_10"/>
      <StateTemplateVariable objectReference="Metabolite_40"/>
      <StateTemplateVariable objectReference="Metabolite_35"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_4"/>
      <StateTemplateVariable objectReference="Metabolite_74"/>
      <StateTemplateVariable objectReference="Metabolite_14"/>
      <StateTemplateVariable objectReference="Metabolite_30"/>
      <StateTemplateVariable objectReference="Metabolite_43"/>
      <StateTemplateVariable objectReference="Metabolite_47"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_52"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_53"/>
      <StateTemplateVariable objectReference="Metabolite_21"/>
      <StateTemplateVariable objectReference="Metabolite_68"/>
      <StateTemplateVariable objectReference="Metabolite_39"/>
      <StateTemplateVariable objectReference="Metabolite_46"/>
      <StateTemplateVariable objectReference="Metabolite_29"/>
      <StateTemplateVariable objectReference="Metabolite_42"/>
      <StateTemplateVariable objectReference="Metabolite_45"/>
      <StateTemplateVariable objectReference="Metabolite_19"/>
      <StateTemplateVariable objectReference="Metabolite_37"/>
      <StateTemplateVariable objectReference="Metabolite_41"/>
      <StateTemplateVariable objectReference="Metabolite_49"/>
      <StateTemplateVariable objectReference="Metabolite_58"/>
      <StateTemplateVariable objectReference="Metabolite_59"/>
      <StateTemplateVariable objectReference="Metabolite_60"/>
      <StateTemplateVariable objectReference="Metabolite_54"/>
      <StateTemplateVariable objectReference="Metabolite_55"/>
      <StateTemplateVariable objectReference="Metabolite_57"/>
      <StateTemplateVariable objectReference="Metabolite_61"/>
      <StateTemplateVariable objectReference="Metabolite_62"/>
      <StateTemplateVariable objectReference="Metabolite_63"/>
      <StateTemplateVariable objectReference="Metabolite_64"/>
      <StateTemplateVariable objectReference="Metabolite_65"/>
      <StateTemplateVariable objectReference="Metabolite_66"/>
      <StateTemplateVariable objectReference="Metabolite_71"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
      <StateTemplateVariable objectReference="Compartment_1"/>
      <StateTemplateVariable objectReference="Compartment_2"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="ModelValue_4"/>
      <StateTemplateVariable objectReference="ModelValue_5"/>
      <StateTemplateVariable objectReference="ModelValue_6"/>
      <StateTemplateVariable objectReference="ModelValue_7"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 5.8799868365210732e+21 8091472322925119 3.6031353600518318e+20 1.9639247917940182e+20 8.5005145629002013e+20 1.4265932432297129e+20 7.0569318068504535e+19 1.0107392859688657e+20 1.5763945812272231e+20 9.3188415892273316e+19 6.0043052526783051e+20 7.9251240638457332e+19 6.2157713955168924e+20 1.3011153977329191e+20 7.6986800408179196e+19 1.1243807508062381e+17 8.3290921482953677e+18 2.0585278287567575e+20 5.1858430762902304e+20 1.1216394522154634e+20 6.370366604598068e+19 2.6322420007975843e+20 8.5525574231136512e+18 3.814044398093117e+20 1.1242558234991299e+19 1.5054490881749578e+21 4.193061030651404e+20 2.0114735099464614e+17 3.2684796456898566e+17 8.5505451311487959e+19 1.936106319512773e+19 1.9642127656464876e+18 2.474363826964566e+19 1.5291076362172393e+20 7.9070667332268687e+19 2.2781584136454282e+20 5.2282834401295e+19 28107957178817176 1.2834083981229053e+20 28419064718452324 3.0473115692780598e+20 8.6664190225577943e+18 3.93911634355828e+19 6.0723800582327936e+17 5.3057531047160074e+18 6.4341568135866352e+19 3.1621127848639089e+18 3.445812101458518e+19 5.3916511483702837e+19 1.5490159261778145e+21 3.600459246417821e+20 1.6970884060191143e+20 5.5592271447547439e+20 5.3695088710780928e+19 4.4930331242454601e+20 2.8940514165016504e+20 1.6747235244311811e+18 4.0582159661071394e+20 1.1515043464737315e+17 3.0988284301613298e+19 9.5424643449249694e+19 3.8428260222940047e+18 2.0633142634442397e+17 3.3825893122639122e+19 1.5819113759222343e+20 1.4279758389505163e+21 2.4920534596462764e+19 3.0110703800000001e+20 8.4309970639999992e+20 6.0221407600000002e+20 7.0459046891999999e+20 5.1188196460000002e+19 1.8066422279999999e+20 19043681190723424 6.0221407600000002e+20 1.2646495596e+20 6.0221407599999999e+23 1 100 0.25 0.23000000000000001 1.2777099999999999 0.084763400000000003 5.8099999999999996 9.3135200000000005 0.062888200000000005 0.02001 27.619299999999999 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_13" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_10" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="0"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
        <Parameter name="Target Criterion" type="string" value="Distance and Rate"/>
      </Method>
    </Task>
    <Task key="Task_12" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Report reference="Report_9" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_11" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Subtask Output" type="string" value="subTaskDuring"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_10" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_9" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_8" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="Use Time Sens" type="bool" value="0"/>
        <Parameter name="Time-Sens" type="cn" value=""/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_7" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_13"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_6" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_4" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_5" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="0.0001"/>
      </Method>
    </Task>
    <Task key="Task_16" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="9.9999999999999998e-13"/>
      </Method>
    </Task>
    <Task key="Task_15" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_4" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_3" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_0" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_13"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_2" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <ParameterGroup name="ListOfParameters">
        </ParameterGroup>
        <ParameterGroup name="ListOfTargets">
        </ParameterGroup>
      </Problem>
      <Method name="LSODA Sensitivities" type="Sensitivities(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_10" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_9" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_8" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_7" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_6" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_5" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_4" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_3" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_2" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_1" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_0" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <GUI>
  </GUI>
  <SBMLReference file="E_coli_Millard2016.xml">
    <SBMLMap SBMLid="ACCOA" COPASIkey="Metabolite_0"/>
    <SBMLMap SBMLid="ACEA" COPASIkey="Reaction_35"/>
    <SBMLMap SBMLid="ACEB" COPASIkey="Reaction_36"/>
    <SBMLMap SBMLid="ACEK_1" COPASIkey="Reaction_37"/>
    <SBMLMap SBMLid="ACEK_2" COPASIkey="Reaction_38"/>
    <SBMLMap SBMLid="ACEp" COPASIkey="Metabolite_76"/>
    <SBMLMap SBMLid="ACEx" COPASIkey="Metabolite_69"/>
    <SBMLMap SBMLid="ACEx_0" COPASIkey="Metabolite_72"/>
    <SBMLMap SBMLid="ACK" COPASIkey="Reaction_47"/>
    <SBMLMap SBMLid="ACN_1" COPASIkey="Reaction_26"/>
    <SBMLMap SBMLid="ACN_2" COPASIkey="Reaction_27"/>
    <SBMLMap SBMLid="ACO" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="ACP" COPASIkey="Metabolite_2"/>
    <SBMLMap SBMLid="ACS" COPASIkey="Reaction_48"/>
    <SBMLMap SBMLid="ADK" COPASIkey="Reaction_43"/>
    <SBMLMap SBMLid="ADP" COPASIkey="Metabolite_50"/>
    <SBMLMap SBMLid="AKG" COPASIkey="Metabolite_3"/>
    <SBMLMap SBMLid="AMP" COPASIkey="Metabolite_51"/>
    <SBMLMap SBMLid="ASP" COPASIkey="Metabolite_61"/>
    <SBMLMap SBMLid="ATP" COPASIkey="Metabolite_52"/>
    <SBMLMap SBMLid="ATP_MAINTENANCE" COPASIkey="Reaction_60"/>
    <SBMLMap SBMLid="ATP_syn" COPASIkey="Reaction_44"/>
    <SBMLMap SBMLid="BPG" COPASIkey="Metabolite_4"/>
    <SBMLMap SBMLid="CAMP" COPASIkey="Metabolite_53"/>
    <SBMLMap SBMLid="CIT" COPASIkey="Metabolite_5"/>
    <SBMLMap SBMLid="COA" COPASIkey="Metabolite_54"/>
    <SBMLMap SBMLid="CYA" COPASIkey="Reaction_45"/>
    <SBMLMap SBMLid="CYS" COPASIkey="Metabolite_62"/>
    <SBMLMap SBMLid="CYTBO" COPASIkey="Reaction_56"/>
    <SBMLMap SBMLid="DAP" COPASIkey="Metabolite_6"/>
    <SBMLMap SBMLid="DOS" COPASIkey="Reaction_46"/>
    <SBMLMap SBMLid="E4P" COPASIkey="Metabolite_7"/>
    <SBMLMap SBMLid="EDA" COPASIkey="Reaction_40"/>
    <SBMLMap SBMLid="EDD" COPASIkey="Reaction_39"/>
    <SBMLMap SBMLid="ENO" COPASIkey="Reaction_7"/>
    <SBMLMap SBMLid="F6P" COPASIkey="Metabolite_8"/>
    <SBMLMap SBMLid="F6P_E4P_TKT" COPASIkey="Reaction_15"/>
    <SBMLMap SBMLid="F6P_GAP_TAL" COPASIkey="Reaction_17"/>
    <SBMLMap SBMLid="FAD" COPASIkey="Metabolite_67"/>
    <SBMLMap SBMLid="FADH2" COPASIkey="Metabolite_68"/>
    <SBMLMap SBMLid="FBA" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="FBP" COPASIkey="Reaction_19"/>
    <SBMLMap SBMLid="FDP" COPASIkey="Metabolite_9"/>
    <SBMLMap SBMLid="FEED" COPASIkey="ModelValue_0"/>
    <SBMLMap SBMLid="FUM" COPASIkey="Metabolite_10"/>
    <SBMLMap SBMLid="FUMA" COPASIkey="Reaction_32"/>
    <SBMLMap SBMLid="Function_for_ACEA" COPASIkey="Function_76"/>
    <SBMLMap SBMLid="Function_for_ACEB" COPASIkey="Function_77"/>
    <SBMLMap SBMLid="Function_for_ACEK_1" COPASIkey="Function_78"/>
    <SBMLMap SBMLid="Function_for_ACEK_2" COPASIkey="Function_79"/>
    <SBMLMap SBMLid="Function_for_ACK" COPASIkey="Function_86"/>
    <SBMLMap SBMLid="Function_for_ACS" COPASIkey="Function_87"/>
    <SBMLMap SBMLid="Function_for_ADK" COPASIkey="Function_83"/>
    <SBMLMap SBMLid="Function_for_DOS" COPASIkey="Function_85"/>
    <SBMLMap SBMLid="Function_for_EDA" COPASIkey="Function_81"/>
    <SBMLMap SBMLid="Function_for_EDD" COPASIkey="Function_80"/>
    <SBMLMap SBMLid="Function_for_ENO" COPASIkey="Function_47"/>
    <SBMLMap SBMLid="Function_for_F6P_E4P_TKT" COPASIkey="Function_56"/>
    <SBMLMap SBMLid="Function_for_F6P_GAP_TAL" COPASIkey="Function_58"/>
    <SBMLMap SBMLid="Function_for_FBA" COPASIkey="Function_45"/>
    <SBMLMap SBMLid="Function_for_FBP" COPASIkey="Function_60"/>
    <SBMLMap SBMLid="Function_for_FUMA" COPASIkey="Function_73"/>
    <SBMLMap SBMLid="Function_for_GDH" COPASIkey="Function_44"/>
    <SBMLMap SBMLid="Function_for_GLC_FEED" COPASIkey="Function_91"/>
    <SBMLMap SBMLid="Function_for_GLT" COPASIkey="Function_66"/>
    <SBMLMap SBMLid="Function_for_GND" COPASIkey="Function_52"/>
    <SBMLMap SBMLid="Function_for_GPM" COPASIkey="Function_49"/>
    <SBMLMap SBMLid="Function_for_ICD" COPASIkey="Function_69"/>
    <SBMLMap SBMLid="Function_for_LPD" COPASIkey="Function_70"/>
    <SBMLMap SBMLid="Function_for_MAD" COPASIkey="Function_64"/>
    <SBMLMap SBMLid="Function_for_MDH" COPASIkey="Function_75"/>
    <SBMLMap SBMLid="Function_for_MQO" COPASIkey="Function_74"/>
    <SBMLMap SBMLid="Function_for_PCK" COPASIkey="Function_62"/>
    <SBMLMap SBMLid="Function_for_PDH" COPASIkey="Function_65"/>
    <SBMLMap SBMLid="Function_for_PFK" COPASIkey="Function_46"/>
    <SBMLMap SBMLid="Function_for_PGK" COPASIkey="Function_41"/>
    <SBMLMap SBMLid="Function_for_PGL" COPASIkey="Function_51"/>
    <SBMLMap SBMLid="Function_for_PNT" COPASIkey="Function_82"/>
    <SBMLMap SBMLid="Function_for_PPC" COPASIkey="Function_61"/>
    <SBMLMap SBMLid="Function_for_PPS" COPASIkey="Function_63"/>
    <SBMLMap SBMLid="Function_for_PTA" COPASIkey="Function_88"/>
    <SBMLMap SBMLid="Function_for_PTS_0" COPASIkey="Function_89"/>
    <SBMLMap SBMLid="Function_for_PYK" COPASIkey="Function_48"/>
    <SBMLMap SBMLid="Function_for_RPE" COPASIkey="Function_53"/>
    <SBMLMap SBMLid="Function_for_RPI" COPASIkey="Function_54"/>
    <SBMLMap SBMLid="Function_for_S7P_E4P_TAL" COPASIkey="Function_59"/>
    <SBMLMap SBMLid="Function_for_S7P_R5P_TKT" COPASIkey="Function_57"/>
    <SBMLMap SBMLid="Function_for_SK" COPASIkey="Function_71"/>
    <SBMLMap SBMLid="Function_for_TPI" COPASIkey="Function_42"/>
    <SBMLMap SBMLid="Function_for_X5P_GAP_TKT" COPASIkey="Function_55"/>
    <SBMLMap SBMLid="Function_for_ZWF" COPASIkey="Function_50"/>
    <SBMLMap SBMLid="G6P" COPASIkey="Metabolite_11"/>
    <SBMLMap SBMLid="GAP" COPASIkey="Metabolite_12"/>
    <SBMLMap SBMLid="GDH" COPASIkey="Reaction_4"/>
    <SBMLMap SBMLid="GL6P" COPASIkey="Metabolite_13"/>
    <SBMLMap SBMLid="GL6P_HYDROLYSIS" COPASIkey="Reaction_67"/>
    <SBMLMap SBMLid="GLC_feed" COPASIkey="Reaction_55"/>
    <SBMLMap SBMLid="GLCp" COPASIkey="Metabolite_74"/>
    <SBMLMap SBMLid="GLCx" COPASIkey="Metabolite_70"/>
    <SBMLMap SBMLid="GLT" COPASIkey="Reaction_25"/>
    <SBMLMap SBMLid="GLX" COPASIkey="Metabolite_14"/>
    <SBMLMap SBMLid="GND" COPASIkey="Reaction_11"/>
    <SBMLMap SBMLid="GPM" COPASIkey="Reaction_6"/>
    <SBMLMap SBMLid="GROWTH" COPASIkey="Reaction_59"/>
    <SBMLMap SBMLid="H2O" COPASIkey="Metabolite_65"/>
    <SBMLMap SBMLid="HCO3" COPASIkey="Metabolite_55"/>
    <SBMLMap SBMLid="Hin" COPASIkey="Metabolite_64"/>
    <SBMLMap SBMLid="Hout" COPASIkey="Metabolite_73"/>
    <SBMLMap SBMLid="ICD" COPASIkey="Reaction_28"/>
    <SBMLMap SBMLid="ICIT" COPASIkey="Metabolite_15"/>
    <SBMLMap SBMLid="KDPG" COPASIkey="Metabolite_16"/>
    <SBMLMap SBMLid="KdADPMg" COPASIkey="ModelValue_1"/>
    <SBMLMap SBMLid="KdATPMg" COPASIkey="ModelValue_2"/>
    <SBMLMap SBMLid="KdFDPMg" COPASIkey="ModelValue_3"/>
    <SBMLMap SBMLid="KeqNDH" COPASIkey="ModelValue_7"/>
    <SBMLMap SBMLid="KmACO_ACN" COPASIkey="ModelValue_6"/>
    <SBMLMap SBMLid="KmCIT_ACN" COPASIkey="ModelValue_5"/>
    <SBMLMap SBMLid="KmICIT_ACN" COPASIkey="ModelValue_4"/>
    <SBMLMap SBMLid="LPD" COPASIkey="Reaction_29"/>
    <SBMLMap SBMLid="MAD" COPASIkey="Reaction_23"/>
    <SBMLMap SBMLid="MAL" COPASIkey="Metabolite_17"/>
    <SBMLMap SBMLid="MDH" COPASIkey="Reaction_34"/>
    <SBMLMap SBMLid="MG" COPASIkey="Metabolite_57"/>
    <SBMLMap SBMLid="MN" COPASIkey="Metabolite_63"/>
    <SBMLMap SBMLid="MQO" COPASIkey="Reaction_33"/>
    <SBMLMap SBMLid="MgADP" COPASIkey="Metabolite_58"/>
    <SBMLMap SBMLid="MgATP" COPASIkey="Metabolite_59"/>
    <SBMLMap SBMLid="MgFDP" COPASIkey="Metabolite_60"/>
    <SBMLMap SBMLid="NAD" COPASIkey="Metabolite_18"/>
    <SBMLMap SBMLid="NADH" COPASIkey="Metabolite_19"/>
    <SBMLMap SBMLid="NADH_req" COPASIkey="Reaction_41"/>
    <SBMLMap SBMLid="NADP" COPASIkey="Metabolite_20"/>
    <SBMLMap SBMLid="NADPH" COPASIkey="Metabolite_21"/>
    <SBMLMap SBMLid="NDHII" COPASIkey="Reaction_58"/>
    <SBMLMap SBMLid="O2" COPASIkey="Metabolite_66"/>
    <SBMLMap SBMLid="OAA" COPASIkey="Metabolite_22"/>
    <SBMLMap SBMLid="P" COPASIkey="Metabolite_56"/>
    <SBMLMap SBMLid="PCK" COPASIkey="Reaction_21"/>
    <SBMLMap SBMLid="PDH" COPASIkey="Reaction_24"/>
    <SBMLMap SBMLid="PEP" COPASIkey="Metabolite_23"/>
    <SBMLMap SBMLid="PFK" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="PGA2" COPASIkey="Metabolite_24"/>
    <SBMLMap SBMLid="PGA3" COPASIkey="Metabolite_25"/>
    <SBMLMap SBMLid="PGI" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="PGK" COPASIkey="Reaction_5"/>
    <SBMLMap SBMLid="PGL" COPASIkey="Reaction_10"/>
    <SBMLMap SBMLid="PGN" COPASIkey="Metabolite_26"/>
    <SBMLMap SBMLid="PIT" COPASIkey="Reaction_62"/>
    <SBMLMap SBMLid="PNT_req" COPASIkey="Reaction_42"/>
    <SBMLMap SBMLid="PPC" COPASIkey="Reaction_20"/>
    <SBMLMap SBMLid="PPS" COPASIkey="Reaction_22"/>
    <SBMLMap SBMLid="PTA" COPASIkey="Reaction_49"/>
    <SBMLMap SBMLid="PTS_0" COPASIkey="Reaction_50"/>
    <SBMLMap SBMLid="PTS_1" COPASIkey="Reaction_51"/>
    <SBMLMap SBMLid="PTS_2" COPASIkey="Reaction_52"/>
    <SBMLMap SBMLid="PTS_3" COPASIkey="Reaction_53"/>
    <SBMLMap SBMLid="PTS_4" COPASIkey="Reaction_54"/>
    <SBMLMap SBMLid="PYK" COPASIkey="Reaction_8"/>
    <SBMLMap SBMLid="PYR" COPASIkey="Metabolite_27"/>
    <SBMLMap SBMLid="Pp" COPASIkey="Metabolite_75"/>
    <SBMLMap SBMLid="Px" COPASIkey="Metabolite_71"/>
    <SBMLMap SBMLid="Q" COPASIkey="Metabolite_28"/>
    <SBMLMap SBMLid="QH2" COPASIkey="Metabolite_29"/>
    <SBMLMap SBMLid="R5P" COPASIkey="Metabolite_30"/>
    <SBMLMap SBMLid="RPE" COPASIkey="Reaction_12"/>
    <SBMLMap SBMLid="RPI" COPASIkey="Reaction_13"/>
    <SBMLMap SBMLid="RU5P" COPASIkey="Metabolite_31"/>
    <SBMLMap SBMLid="S7P" COPASIkey="Metabolite_32"/>
    <SBMLMap SBMLid="S7P_E4P_TAL" COPASIkey="Reaction_18"/>
    <SBMLMap SBMLid="S7P_R5P_TKT" COPASIkey="Reaction_16"/>
    <SBMLMap SBMLid="SDH" COPASIkey="Reaction_31"/>
    <SBMLMap SBMLid="SK" COPASIkey="Reaction_30"/>
    <SBMLMap SBMLid="SQR" COPASIkey="Reaction_57"/>
    <SBMLMap SBMLid="SUC" COPASIkey="Metabolite_33"/>
    <SBMLMap SBMLid="SUCCOA" COPASIkey="Metabolite_34"/>
    <SBMLMap SBMLid="TPI" COPASIkey="Reaction_3"/>
    <SBMLMap SBMLid="X5P" COPASIkey="Metabolite_35"/>
    <SBMLMap SBMLid="X5P_GAP_TKT" COPASIkey="Reaction_14"/>
    <SBMLMap SBMLid="XCH_ACE1" COPASIkey="Reaction_64"/>
    <SBMLMap SBMLid="XCH_ACE2" COPASIkey="Reaction_66"/>
    <SBMLMap SBMLid="XCH_GLC" COPASIkey="Reaction_61"/>
    <SBMLMap SBMLid="XCH_P" COPASIkey="Reaction_63"/>
    <SBMLMap SBMLid="ZWF" COPASIkey="Reaction_9"/>
    <SBMLMap SBMLid="_ACE_OUT" COPASIkey="Reaction_65"/>
    <SBMLMap SBMLid="cell" COPASIkey="Compartment_0"/>
    <SBMLMap SBMLid="cell_periplasm" COPASIkey="Compartment_2"/>
    <SBMLMap SBMLid="ei" COPASIkey="Metabolite_36"/>
    <SBMLMap SBMLid="eiP" COPASIkey="Metabolite_37"/>
    <SBMLMap SBMLid="eiia" COPASIkey="Metabolite_38"/>
    <SBMLMap SBMLid="eiiaP" COPASIkey="Metabolite_39"/>
    <SBMLMap SBMLid="eiicb" COPASIkey="Metabolite_40"/>
    <SBMLMap SBMLid="eiicbP" COPASIkey="Metabolite_41"/>
    <SBMLMap SBMLid="extracellular" COPASIkey="Compartment_1"/>
    <SBMLMap SBMLid="hpr" COPASIkey="Metabolite_42"/>
    <SBMLMap SBMLid="hprP" COPASIkey="Metabolite_43"/>
    <SBMLMap SBMLid="icd" COPASIkey="Metabolite_44"/>
    <SBMLMap SBMLid="icdP" COPASIkey="Metabolite_45"/>
    <SBMLMap SBMLid="tal" COPASIkey="Metabolite_46"/>
    <SBMLMap SBMLid="talC3" COPASIkey="Metabolite_47"/>
    <SBMLMap SBMLid="tkt" COPASIkey="Metabolite_48"/>
    <SBMLMap SBMLid="tktC2" COPASIkey="Metabolite_49"/>
  </SBMLReference>
  <ListOfUnitDefinitions>
    <UnitDefinition key="Unit_1" name="meter" symbol="m">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_0">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        m
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_5" name="second" symbol="s">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_4">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        s
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_13" name="Avogadro" symbol="Avogadro">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_12">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_17" name="item" symbol="#">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_16">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        #
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_35" name="liter" symbol="l">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_34">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        0.001*m^3
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_41" name="mole" symbol="mol">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro*#
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
