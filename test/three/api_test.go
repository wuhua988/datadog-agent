package three

import (
	"strings"
	"testing"
)

func TestGetVersion(t *testing.T) {
	ver := getVersion()
	if !strings.HasPrefix(ver, "3.") {
		t.Errorf("Version doesn't start with `3.`: %s", ver)
	}
}

func TestRunSimpleString(t *testing.T) {
	output, err := runString("import sys; sys.stderr.write('Hello, World!') \n")

	if err != nil {
		t.Fatal("`run_simple_string` error")
	}

	if output != "Hello, World!" {
		t.Errorf("Unexpected printed value: '%s'", output)
	}
}
