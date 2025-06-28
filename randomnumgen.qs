import Microsoft.Quantum.Convert.*;
import Microsoft.Quantum.Math.*;

operation Main() : Int {
    let max = 100000;
    return GenerateRandomNumberInRange(max);
}

operation GenerateRandomNumberInRange(max : Int) : Int {

    mutable bits = [];
    let nBits = BitSizeI(max);

    for i in 1..nBits {
        bits += [GenerateRandomBit()];
    }

    let sample = ResultArrayAsInt(bits);
    return sample > max ? GenerateRandomNumberInRange(max) | sample;
}
operation GenerateRandomBit() : Result {

    use q = Qubit();
    H(q);
    let result = M(q);
    Reset(q);
    return result;
}