package main

import (
	"io"
	"log"
	"net/http"
)

func main() {
	// Hello world, the web server

	helloHandler := func(w http.ResponseWriter, req *http.Request) {
		log.Println("Recieved request")
		io.WriteString(w, "Hello, world!\n")
	}

	http.HandleFunc("/", helloHandler)
	log.Println("Listening for requests at :8080/")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
