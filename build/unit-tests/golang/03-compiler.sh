#!/bin/bash -l

p_info "golang" "Compiler test started."


rm -rf /tmp/golang-test
mkdir /tmp/golang-test && cd /tmp/golang-test
cat <<EOF > main.go
package main

import (
	"fmt"
	"os"
	"runtime"
)

func main() {
	fmt.Printf("Go runs OK!\n")
	fmt.Printf("PPID: %d -> PID:%d\n", os.Getppid(), os.Getpid())
	fmt.Printf("Compiler: %s v%s\n", runtime.Compiler, runtime.Version())
	fmt.Printf("Architecture: %s v%s\n", runtime.GOARCH, runtime.GOOS)
	fmt.Printf("GOROOT: %s\n", runtime.GOROOT())
}
EOF


if go build
then
	./golang-test
	if [ "$?" == "0" ]
	then
		c_ok "GoLang OK"
	else
		c_err "GoLang FAILED"
	fi
else
	c_err "GoLang FAILED"
fi


p_info "golang" "Compiler test finished."

