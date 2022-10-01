(DEFPACKAGE :ROSWELL.INIT.SAMPLE-TEMPLATE
  (:USE :CL))
(IN-PACKAGE :ROSWELL.INIT.SAMPLE-TEMPLATE)
(DEFVAR *PARAMS*
  '(:FILES
    ((:NAME "roswell/README.md" :METHOD "djula")
     (:NAME "roswell/project.ros" :METHOD "djula" :REWRITE
      "roswell/{{name}}.ros")
     (:NAME "src/packages.lisp" :METHOD "djula")
     (:NAME "src/main.lisp" :METHOD "djula")
     (:NAME "sample.asd" :METHOD "djula" :REWRITE "{{name}}.asd")
     (:NAME "Makefile" :METHOD "djula")
     (:NAME "qlfile" :METHOD "djula")
     (:NAME ".gitignore" :METHOD "djula"))))
(DEFUN SAMPLE-TEMPLATE (_ &REST R)
  (ASDF/OPERATE:LOAD-SYSTEM :ROSWELL.UTIL.TEMPLATE :VERBOSE NIL)
  (FUNCALL (READ-FROM-STRING "roswell.util.template:template-apply") _ R
           *PARAMS*))
