pragma solidity ^0.4.11;

contract AddNOutOfGas {
  int public n;

  function AddNOutOfGas(int _n) {
    n = _n;
  }

  function apply(int _x) constant returns (int) {
    int f = 0;
    // trigger an out-of-gas exception
    for (int i = 0; i < 200000; i++) {
      f += 1;
    }
    return _x + n;
  }

  function setN(int _n) {
    n = _n;
  }
}
