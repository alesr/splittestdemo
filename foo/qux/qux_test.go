package qux

import "testing"

func TestIntegration_Qux(t *testing.T) {
	if testing.Short() {
		t.Skip("Skipping integration test in short mode")
	}

	got := Qux()

	if got != "qux" {
		t.Error("Expected qux, got ", got)
	}
}

func TestIntegration_Qux2(t *testing.T) {
	if testing.Short() {
		t.Skip("Skipping integration test in short mode")
	}

	got := Qux2()

	if got != "qux2" {
		t.Error("Expected qux2, got ", got)
	}
}
