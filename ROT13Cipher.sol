pragma solidity ^0.4.11;

// NOTE: the given version of the Solidity compiler yields an invalid opcode while attempting to execute `encodeASCII` against the `testrpc` VM.

contract ROT13Cipher {
  event Encode(bytes indexed message, bytes encodedMessage);

  uint8 private shift = 0xD;
  uint8 private modulo = shift * 2;

  function encodeASCII(bytes _input) constant returns (bytes) {
    bytes memory output = new bytes(_input.length);

    for (uint i = 0; i < 32; i++) {
      uint8 next = uint8(_input[i]);
      next = next + shift;
      next = next % modulo;
      output[i] = byte(next);
    }
    Encode(_input, output);

    return output;
  }
}
