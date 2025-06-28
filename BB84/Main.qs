 open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Canon;
open Microsoft.Quantum.Diagnostics;
open Microsoft.Quantum.Measurement;

operation GenerateRandomBit() : Result {
    use q = Qubit();
    H(q);
    let r = M(q);
    Reset(q);
    return r;
}

@EntryPoint()
operation Main() : Unit {
    let rounds = 20;
    mutable matchCount = 0;

    for i in 1..rounds {
        use q = Qubit();

        let aliceBit   = GenerateRandomBit();
        let aliceBasis = GenerateRandomBit();
        let bobBasis   = GenerateRandomBit();

        if (aliceBit == One) {
            X(q);
        }
        if (aliceBasis == One) {
            H(q);
        }

        if (bobBasis == One) {
            H(q);
        }

        let bobResult = M(q);

        if (aliceBasis == bobBasis) {
            set matchCount += 1;
            Message($"  → Matched! ({bobResult})");
        } else {
            Message($"  → Bases not matched , furth.");
        }

        Reset(q);
    }

    Message($"--- Total match: {matchCount} / {rounds} ---");
}

