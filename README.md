## FSparql
Flexible Sparql<br>
<br>
***We provide basic (plain FSparql) syntax and concise API,***<br>
***but you can inject your own style right into the system with ease.***<br>
### About
FSparql is a programming language and you are at a page which contains<br>
its implementation.
<br>
FSparql aims at simplicity and flexibility (F - flexible).<br>
Following the Unix philosophy, toolkit divided into multiple parts:
  * preprocessor
  * translator (converts sources into valid Sparql)
  * sparql executor

The good part: you can use them separately.<br>
<br>
If you choose all 3 of them, `sh` scripts are there for your convinience.<br>
<br>
<img src="./img/three.png">
### Preprocessor
Allows simple text substitution before invoking the translator.<br>
Say, you sick of `PROP` and `EXC` or even `INC` short forms.<br>
Well, define your own syntax!<br>
```
(PROPERTY) PROP
(EXCLUSIVE) EXC
(INCLUSIVE) INC
```
It can handle variables:
```
(swap $x + $y) $y + $x
```
Defined this way, fragement `swap foo + bar` going to be replaced<br>
with `bar + foo`.<br>
### Translator
Takes FSparql source code and outputs Sparql equivalent.<br>
When the translator 'sees' the input, it should not contain any<br>
arbitrary text, no preprocessing is done by translator (actually,<br>
it does some input manipulations).<br>
<br>
Example of valid input:
```
# Raw FSparql. Pretty verbose.
OBJ lang EXC VAL dbpedia-owl:ProgrammingLanguage {
  PROP name INC VAL rdfs:label [@LANG == 'en']
  PROP year INC VAL dbpprop:year

  OBJ author EXC VAL dbpedia-owl:designer {
    PROP name INC VAL rdfs:label [@LANG == "en"]
    PROP depiction OPT INC VAL foaf:depiction
  }
}
```
Output for above:
```
SELECT ?lang__name, ?lang__year, ?lang__author__name, ?lang__author__depiction {
  ?lang a dbpedia-owl:ProgrammingLanguage.
  ?lang rdfs:label ?lang__name.
  ?lang dbpprop:year ?lang__year.
  ?lang dbpedia-owl:designer ?lang__author.
  ?lang__author rdfs:label ?lang__author__name.
  OPTIONAL {
    ?author foaf:depiction ?lang__author__depiction.
  }
  FILTER(LANG(?lang__name) = "en")
  FILTER(LANG(?lang__author__name) = "en")
}
```
Translator receive command line arguments for LIMIT, OFFSET, etc.<br>
Example: `fsparql --translator './file.query' --limit=100`<br>
### Sparql executor
@TODO: implement and describe translator