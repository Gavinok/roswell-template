(defsystem "{{ name }}"
  :description "TODO"
  :version "0.1.0"

  :author "{{author}}"
  :license "TODO"
  ;; :depends-on '()
  :components ((:module "src"
                :components
                ((:file "packages")
                 (:file "main"))))
  :build-operation "program-op"
  :entry-point "{{name}}::main")
