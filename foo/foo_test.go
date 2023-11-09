package foo

import "testing"

func TestFoo(t *testing.T) {
	got := Foo()

	if got != "foo" {
		t.Error("Expected foo, got ", got)
	}
}
