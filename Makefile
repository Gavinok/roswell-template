LISP ?= sbcl
project = {{name}}

all: $(project)

deps: ## Install quicklisp dependancies
	#docker run --rm -it -v $PWD:/app fukamachi/qlot install
	qlot install

sbcl: deps ## For faster compilation and startup at the cost of binary size
	$(LISP) --non-interactive \
	--load ./$(project).asd \
	--eval '(ql:quickload :$(project))' \
	--eval '(asdf:make :$(project))'

fast: ## For faster compilation and startup at the cost of binary size
	$(MAKE) args=--disable-compression

clean:
	$(RM) $(project)

qlot: deps
	qlot exec make

$(project): ## Default build format
	ros run -S . -l ./$(project).asd \
	-e '(ql:quickload :$(project))' \
	-e '(asdf:make :$(project))'
