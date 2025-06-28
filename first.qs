import Microsoft.Quantum.Diagnostics.*;

operation Main() : (Result, Result) {
// Allocate two qubits, q1 and q2, in the 0 state.
        use (q1, q2) = (Qubit(), Qubit());

//The qubits q1 and q2 are in the state of bra vector
// Put q1 into an even superposition.
//where it has a 50% chance of being measured as it is
        H(q1);

// Entangle q1 and q2, making q2 depend on q1.
        CNOT(q1, q2);


// Show the entangled state of the qubits.
        DumpMachine();

// Measure q1 and q2 and store the results in m1 and m2.
        let (m1, m2) = (M(q1), M(q2));

// Reset q1 and q2 to the 0 state.
        Reset(q1);
        Reset(q2);

        DumpMachine();

// Return the measurement results.
        return (m1, m2);
}


