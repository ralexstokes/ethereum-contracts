pragma solidity ^0.4.11;

// NOTE: the given version of the Solidity compiler yields an invalid opcode while attempting to execute `encodeASCII` against the `testrpc` VM.

contract ROT13Cipher {
  event Encode(bytes indexed message, bytes encodedMessage);

  uint8 private shift = 0xD;
  uint8 private modulus = shift * 2;

  function encodeASCIIString(bytes _input) constant returns (bytes) {
    if (_input.length > 256) {
      throw; // do not overflow for-loop counter
    }

    bytes output = new bytes(_input.length);

    for (uint i = 0; i < _input.length; i++) {
      output[i] = encodeCharacter(_input[i]);
    }

    Encode(_input, output);

    return output;
  }

  function encodeCharacter(byte input) private constant returns (byte) {
    uint8 next = uint8(input);
    next = next + shift;
    next = next % modulus;
    return byte(next);
  }
}
