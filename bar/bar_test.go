package bar

import "testing"

func TestBar(t *testing.T) {
	got := Bar()

	if got != "bar" {
		t.Error("Expected bar, got ", got)
	}
}
