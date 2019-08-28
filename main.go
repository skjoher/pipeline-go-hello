package main

import (
	"fmt"
	"log"
	"net/http"
)

// handler
func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, service v1")
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":9999", nil))
}