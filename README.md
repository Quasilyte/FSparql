## FSparql
Flexible Sparql<br>
<br>
***We provide basic (plain FSparql) syntax and concise API,***<br>
***but you can inject your own style right into the system with ease.***<br>
### About
FSparql is a programming language and you are at a page which contains<br>
its implementation, the **FSparql TWiR**.<br>
TWiR refers to "Translator written in Ruby".<br>
TWiR is main and only existing implementation for FSparql.<br>
<br>
The TWiR is, well, not very performant, but it doesn't matter that much;<br>
the goal is to introduce a language and some ideas.<br>
<br>
FSparql aims at simplicity and flexibility (F - flexible).<br>
Following the Unix philosophy, TWiR divided into multiple parts:
  * preprocessor
  * translator (converts sources into valid Sparql)
  * sparql executor

The good part is: you can use them separately.<br>
<br>
If you choose all 3 of them, `sh` scripts are there for your convinience.<br>
<br>
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
@TODO: implement and describe translator
### Sparql executor
@TODO: implement and describe translator