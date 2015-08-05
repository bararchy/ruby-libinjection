# ruby-libinjection
Ruby wrapper around Client9's libinjection

Original Project is here --> https://github.com/client9/libinjection

Simple Usage is:

```
cd test

ruby test.rb "wululu"
No SQLi Found

ruby test.rb "wululu 'OR 'a'='a'"
SQLi Found!

```
