package main

import (
	"fmt"

	"github.com/martinrusev/amonagent/collectors"
	"github.com/martinrusev/amonagent/logging"
)

// AmonAgentLogger for the main file
var AmonAgentLogger = logging.GetLogger("amonagent")

// Just for testing
func main() {

	l := collectors.LoadAverage()
	fmt.Println(l)
}
